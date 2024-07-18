# Changelog

All notable changes to this project will be documented in this file.

## [Unreleased]

### Added

- make release to increment version number and update change log(pr [#78])

### Changed

- docs-update unreleased version to 0.10 with release date 2024-7-17(pr [#76])
- ci-add back in publish workflow(pr [#77])
- ci-add pcu_verbosity parameter and update pcu release command(pr [#84])
- ci-replace tree with ls(pr [#85])

### Fixed

- remove sudo from commands in .circleci/config.yml(pr [#79])
- remove sudo from wget command in CircleCI config(pr [#80])
- change changelog.md to uppercase CHANGELOG.md in gh release command(pr [#81])
- changelog to CHANGELOG and better debugging(pr [#82])
- correct pipeline to pipefail in set command(pr [#83])

## [0.1.0] - 2024-07-17

### Added

- ✨ Build docker container for my CI
- ✨ Build docker container
- Test script
- Test builds and testing
- Add test target that includes the test script
- add pcu tool to ci container(pr [#56](https://github.com/jerus-org/ci-container/pull/56))
- add curl package to the list of installed packages for final container(pr [#64](https://github.com/jerus-org/ci-container/pull/64))
- add jq package to the list of installed packages in the Dockerfile(pr [#65](https://github.com/jerus-org/ci-container/pull/65))
- add rust version 1.76(pr [#66](https://github.com/jerus-org/ci-container/pull/66))
- add new base stage with rust:1.79.0-slim(pr [#68](https://github.com/jerus-org/ci-container/pull/68))
- add cargo-audit to the build(pr [#74](https://github.com/jerus-org/ci-container/pull/74))

### Changed

- Update README to describe files and usage
- Add .gitignore
- Delete build.sh as adopting Makefile
- Add Makefile for building, publishing and debugging
- Add renovate.json
- Update cimg/rust docker tag to v1.63
- Default init for git cliff
- Initial change log
- Change MIN_RUST to MIN_RUST_VERSION
- fix(pr [#61](https://github.com/jerus-org/ci-container/pull/61))
- chore-Use un-published version of pcu(pr [#63](https://github.com/jerus-org/ci-container/pull/63))
- fix remove rust-min-version parameter and change docker build tag to base(pr [#69](https://github.com/jerus-org/ci-container/pull/69))
- ci-fix docker argument and docker push for missing TAG(pr [#70](https://github.com/jerus-org/ci-container/pull/70))
- style-break curl command into multiple lines for better readability(pr [#71](https://github.com/jerus-org/ci-container/pull/71))
- ci-add Rust version 1.67 to the testing matrix(pr [#72](https://github.com/jerus-org/ci-container/pull/72))
- ci-add Rust version 1.33 to the testing workflow(pr [#73](https://github.com/jerus-org/ci-container/pull/73))

### Fixed

- It not required for test container run
- update pcu cargo package version to 0.1.5(pr [#59](https://github.com/jerus-org/ci-container/pull/59))

### Security

- Security: update pcu cargo package version to 0.1.6(pr [#60](https://github.com/jerus-org/ci-container/pull/60))
- Security: update pcu cargo package version to 0.1.8(pr [#62](https://github.com/jerus-org/ci-container/pull/62))
- Dependencies: update cimg/base docker tag to v2024.07(pr [#67](https://github.com/jerus-org/ci-container/pull/67))

[#76]: https://github.com/jerus-org/ci-container/pull/76
[#77]: https://github.com/jerus-org/ci-container/pull/77
[#78]: https://github.com/jerus-org/ci-container/pull/78
[#79]: https://github.com/jerus-org/ci-container/pull/79
[#80]: https://github.com/jerus-org/ci-container/pull/80
[#81]: https://github.com/jerus-org/ci-container/pull/81
[#82]: https://github.com/jerus-org/ci-container/pull/82
[#83]: https://github.com/jerus-org/ci-container/pull/83
[#84]: https://github.com/jerus-org/ci-container/pull/84
[#85]: https://github.com/jerus-org/ci-container/pull/85
[Unreleased]: https://github.com/jerus-org/ci-container/compare/0.1.0...HEAD
[0.1.0]: https://github.com/jerus-org/ci-container/releases/tag/0.1.0
