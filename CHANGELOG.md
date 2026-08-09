# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.0] - 2026-08-09

### Added

- Support for account regional bucket namespace through the `namespace` module
variable.

### Fixed

- Renamed the encryption key variable to reflect the fact that we are expecting
an ARN, not an ID. I originally set it to ID, but didn't realize the UI actually
shows it like it's an ARN, and that the recommendation is to use ARNs anyway.
I don't even know if it'd work with the ID neither, just staying on the safe
side. It's technically a backwards incompat change, but also it was an oversight
on my part. I'd rather treat it as a fix hehe.

## [1.0.0] - 2026-08-09

### Added

- First release!

[1.1.0]: https://github.com/infra-blocks/terraform-aws-s3-private-bucket/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/infra-blocks/terraform-aws-s3-private-bucket/releases/tag/v1.0.0
