## [Unreleased]

- Verify each response's `&&` checksum and raise `Atg::ChecksumError` (a
  subclass of `InvalidResponseError`) when it is missing or wrong. A
  response cut off after its header used to parse as zero results without
  raising. The trailing EXT is still not required.
- Test fixtures now carry their SOH and valid checksums.

- Restore the mangled `# frozen_string_literal: true` magic comment in
  `lib/atg/base.rb`.

## [0.1.0] - 2022-05-07

- Initial release
