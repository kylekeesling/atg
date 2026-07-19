## [Unreleased]

- Guard `Base#parse_timestamp` against garbled TLS-350 frames: an unparseable
  10-digit stamp now returns `nil` instead of raising `ArgumentError` and
  sinking the whole report (matches `SystemRevision#parse_created`).
- Restore the mangled `# frozen_string_literal: true` magic comment in
  `lib/atg/base.rb`.

## [0.1.0] - 2022-05-07

- Initial release
