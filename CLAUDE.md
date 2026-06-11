# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

`atg` is a Ruby gem for communicating with Veeder-Root TLS-350 **Automatic Tank Gauges (ATGs)** — the controllers found at fuel stations that monitor underground storage tanks and leak-detection sensors. It speaks the TLS-350 serial protocol over RS-232, Telnet (TCP/IP), or Telnet-over-SSH.

The authoritative protocol reference is `Serial Interface-TLS-350.pdf` in the repo root. Command codes, response framing, field widths, and data formats all come from this manual — consult it before changing any parsing logic or adding a new report.

## Commands

```bash
bin/setup                  # install dependencies (bundle install)
bin/console                # IRB session with the gem loaded, for experimenting
bundle exec rake test      # run the full test suite (the default rake task)
bundle exec rake           # same as `rake test`
bundle exec standardrb     # lint (the project uses the `standard` gem)
```

Run a single test file or a single test by name:

```bash
bundle exec ruby -Itest -Ilib test/reports/tank_inventory_report_test.rb
bundle exec ruby -Itest -Ilib test/reports/tank_inventory_report_test.rb -n test_tank_inventory_report
```

Ruby `>= 3.1.0` is required (`.ruby-version` pins 3.4.2). Tests use **Minitest**.

## Architecture

The protocol flow is: build a command string → send it through an **Adapter** → a **Report** parses the raw response into an array of **Object** records.

### Command/response framing (`lib/atg.rb`, `lib/atg/report.rb`)

- Every command is `SOH (\x01) + command_code + optional data_field`. Every response is terminated by `EXT (\x03)` and carries a trailing `&&<checksum>`.
- `Report#run` assembles the command, calls `@adapter.write`, then `process`:
  1. strips the checksum (`split("&&")`), `SOH`, and `EXT`,
  2. validates the echoed command code matches the one issued (`InvalidResponseError`) and that the device recognized it (`CommandNotRecognizedError`, detected via the sentinel `9999FF1B`),
  3. parses the 10-digit timestamp at positions 6–15 into `responded_at`,
  4. slices the payload from `results_start_position` (default 16) onward and delegates to `parse_response_results`.
- The three custom exceptions (`CommandNotRecognizedError`, `InvalidResponseError`, `ConnectionError`) and the `SOH`/`EXT` control bytes are defined in `lib/atg.rb`.

### Three layers

1. **Adapters** (`lib/atg/adapters/`) — transport. Each implements `write(command_string)` (send + read until `EXT`), `close`, and `description`.
   - `SerialAdapter` (uses `rubyserial`), `TelnetAdapter` (uses `net-telnet`, retries 3× on connection errors), and `TestAdapter`.
   - `TestAdapter#write` strips control chars and reads `test/fixtures/<command_code>.txt` — this is how the suite runs without hardware.

2. **Reports** (`lib/atg/reports/`) — one class per TLS-350 command, subclassing `Atg::Report`. Most only override three methods:
   - `command_code` (e.g. `"i20100"`), `result_object` (the record class), and `result_length` (fixed character width of one record).
   - The base `parse_response_results` splits the payload into `result_length`-sized chunks and maps each to `result_object.new(chunk)`.
   - Reports with **variable-length / repeating blocks** (e.g. `TankLeakTestHistoryReport`) override `parse_response_results` entirely, walking a cursor through the payload. `parse_repeating_result_block` in the base class is a helper for the common "N results to follow" shape. Sensor reports are organized under `reports/sensors/` and `reports/sensor_statuses/`.

3. **Objects** (`lib/atg/objects/`) — value objects, subclassing `Atg::Base`. The constructor takes the raw record string and slices fixed-position substrings into `attr_accessor`s. Numeric measurements are IEEE-754 floats encoded as 8 hex chars, decoded with `Base#ieee754_value`; timestamps use `Base#parse_timestamp`. Sensor objects share a `Sensor` base with type-specific subclasses (liquid, vapor, groundwater, two/three-wire, universal, smart).

`lib/atg.rb` is the single entrypoint that `require`s every file in dependency order.

### Adding a new report

1. Find the command code and its response layout in the TLS-350 PDF.
2. Capture a real response into `test/fixtures/<command_code>.txt`.
3. Add the record class in `lib/atg/objects/` (fixed-position slicing; `ieee754_value` for floats).
4. Add the report class in `lib/atg/reports/` overriding `command_code` / `result_object` / `result_length` (or `parse_response_results` for repeating blocks).
5. `require_relative` both new files in `lib/atg.rb`.
6. Add a test that calls `report_response(Atg::YourReport)` (from `test/test_helper.rb`, which wires up `TestAdapter`) and asserts the parsed fields.

## Conventions

- Files are `# frozen_string_literal: true` and use double-quoted strings (enforced by `standard`).
- Tests are data-driven against fixtures; the fixture filename **must** equal the report's `command_code`, since `TestAdapter` reads `test/fixtures/<command_code>.txt`.
- `.rubocop.yml` exists (line length 120, double quotes) but the project lints with `standard`; `Rakefile`'s default task runs only `test`.

## Notes

- The files in `examples/` (`serial.rb`, `telnet.rb`) are illustrative and partly stale — they call `Report.run` as a class method, whereas the real API is `Report.new(adapter:).run(data_field:)`. Treat `test/test_helper.rb` as the source of truth for invocation.
- Releasing: bump `Atg::VERSION` in `lib/atg/version.rb`, then `bundle exec rake release` (tags, pushes, publishes to RubyGems). CI (`.github/workflows/main.yml`) runs `bundle exec rake` on push to `master` and on all PRs.
