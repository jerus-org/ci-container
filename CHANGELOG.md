# Changelog

All notable changes to this project will be documented in this file.

## [Unreleased]

### Security

- Dependencies: update cimg/base docker tag to v2024.08(pr [#98])
- Dependencies: update rust docker tag to v1.80.1(pr [#99])

## [0.1.2] - 2024-08-02

### Added

- add version 1.70 to workflows(pr [#90])

### Changed

- docs-update version from Unreleased to 0.1.1 and update release link(pr [#89])
- chore-update versions of cargo-release, nextsv, and pcu in Dockerfile(pr [#91])
- ci-remove make_release job and replace it with toolkit/make_release in workflows(pr [#93])
- ci-add cargo_release parameter with false value(pr [#94])
- ci-update to toolkit 0.25.0 and enable tag_log in release workflow(pr [#95])
- chore-add pcu_verbosity and pcu_update parameters to workflows(pr [#96])
- ci-update toolkit version from 0.25.0 to 0.27.0 and set pcu_update_changelog to true(pr [#97])

### Security

- Dependencies: update rust docker tag to v1.80.0(pr [#92])

## [0.1.1] - 2024-07-20

### Added

- make release to increment version number and update change log(pr [#78])

### Changed

- docs-update unreleased version to 0.10 with release date 2024-7-17(pr [#76])
- ci-add back in publish workflow(pr [#77])
- ci-add pcu_verbosity parameter and update pcu release command(pr [#84])
- ci-replace tree with ls(pr [#85])
- ci-add step to check GitHub CLI authentication status(pr [#86])
- ci-add commands to set git protocol and authenticate with GitHub token(pr [#87])
- chore-comment out GitHub token authentication lines(pr [#88])

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
[#86]: https://github.com/jerus-org/ci-container/pull/86
[#87]: https://github.com/jerus-org/ci-container/pull/87
[#88]: https://github.com/jerus-org/ci-container/pull/88
[#89]: https://github.com/jerus-org/ci-container/pull/89
[#90]: https://github.com/jerus-org/ci-container/pull/90
[#91]: https://github.com/jerus-org/ci-container/pull/91
[#92]: https://github.com/jerus-org/ci-container/pull/92
[#93]: https://github.com/jerus-org/ci-container/pull/93
[#94]: https://github.com/jerus-org/ci-container/pull/94
[#95]: https://github.com/jerus-org/ci-container/pull/95
[#96]: https://github.com/jerus-org/ci-container/pull/96
[#97]: https://github.com/jerus-org/ci-container/pull/97
[#98]: https://github.com/jerus-org/ci-container/pull/98
[#99]: https://github.com/jerus-org/ci-container/pull/99
[Unreleased]: https://github.com/jerus-org/ci-container/compare/0.1.2...HEAD
[0.1.2]: https://github.com/jerus-org/ci-container/compare/0.1.1...0.1.2
[0.1.1]: https://github.com/jerus-org/ci-container/compare/0.1.0...0.1.1
[0.1.0]: https://github.com/jerus-org/ci-container/releases/tag/0.1.0
