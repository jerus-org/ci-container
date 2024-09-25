# Changelog

All notable changes to this project will be documented in this file.

## [Unreleased]

### Added

- update renovate regex manager to handle additional Dockerfile and Containerfile patterns(pr [#125])

### Changed

- chore(Dockerfile)-update renovate configuration to include versioning for cargo dependencies(pr [#122])
- ci(circleci)-update toolkit orb version and add security context(pr [#124])
- chore-update VSCode settings and simplify renovate custom managers(pr [#127])
- chore-update versioning scheme for pcu package in Dockerfile(pr [#128])
- chore-update versioning strategy for dependencies in Dockerfile(pr [#130])

### Fixed

- correct regex pattern in renovate.json for matching version strings(pr [#123])

### Security

- Dependencies: update dependency pcu to v0.4.8(pr [#129])

## [0.1.9] - 2024-09-22

### Changed

- chore(Dockerfile)-add unzip to base image and remove redundant packages from final stage(pr [#121])

## [0.1.8] - 2024-09-21

### Security

- Dependencies: update dependency wasmtime-cli to v25(pr [#120])

## [0.1.7] - 2024-09-13

### Added

- add support for publishing Rust WASI environment(pr [#116])
- add support for multiple Rust toolchains and WASI target(pr [#118])

### Changed

- ci-add label_option to CircleCI config and rangeStrategy to Renovate config(pr [#112])
- chore(circleci)-update Docker image to default in config(pr [#113])
- ci(circleci)-update toolkit orb to v1.6.0 and modify workflows(pr [#114])
- chore-update changelog for version 0.1.6(pr [#115])
- chore(ci)-remove unsupported Rust version from CircleCI config(pr [#119])

### Fixed

- Dockerfile: add wasm32-wasip1 target to rustup(pr [#117])

## [0.1.6] - 2024-09-07

### Added

- add environment variables for cargo tools versions and update renovate config(pr [#108])

### Changed

- chore(Dockerfile)-update renovate config to include depName for cargo dependencies(pr [#109])
- chore-update datasource from cargo to crate in Dockerfile(pr [#110])
- style-remove trailing spaces in Dockerfile(pr [#111])

### Security

- Dependencies: update cimg/base docker tag to v2024.09(pr [#106])
- Dependencies: update rust docker tag to v1.81.0(pr [#107])

## [0.1.5] - 2024-08-31

### Added

- add support for rustc version 1.79(pr [#104])

### Changed

- chore-update versions of cargo-audit, nextsv, and pcu in cargo binstall commands(pr [#102])
- ci-add version 1.78 to workflows(pr [#103])
- chore-update CircleCI toolkit orb and pcu version in Dockerfile(pr [#105])

## [0.1.4] - 2024-08-17

### Changed

- ci-upgrade toolkit version from 0.27.0 to 1.0.0(pr [#100])
- chore-update nextsv and pcu versions in cargo binstall command(pr [#101])

## [0.1.3] - 2024-08-10

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
[#100]: https://github.com/jerus-org/ci-container/pull/100
[#101]: https://github.com/jerus-org/ci-container/pull/101
[#102]: https://github.com/jerus-org/ci-container/pull/102
[#103]: https://github.com/jerus-org/ci-container/pull/103
[#104]: https://github.com/jerus-org/ci-container/pull/104
[#105]: https://github.com/jerus-org/ci-container/pull/105
[#106]: https://github.com/jerus-org/ci-container/pull/106
[#107]: https://github.com/jerus-org/ci-container/pull/107
[#108]: https://github.com/jerus-org/ci-container/pull/108
[#109]: https://github.com/jerus-org/ci-container/pull/109
[#110]: https://github.com/jerus-org/ci-container/pull/110
[#111]: https://github.com/jerus-org/ci-container/pull/111
[#112]: https://github.com/jerus-org/ci-container/pull/112
[#113]: https://github.com/jerus-org/ci-container/pull/113
[#114]: https://github.com/jerus-org/ci-container/pull/114
[#115]: https://github.com/jerus-org/ci-container/pull/115
[#116]: https://github.com/jerus-org/ci-container/pull/116
[#117]: https://github.com/jerus-org/ci-container/pull/117
[#118]: https://github.com/jerus-org/ci-container/pull/118
[#119]: https://github.com/jerus-org/ci-container/pull/119
[#120]: https://github.com/jerus-org/ci-container/pull/120
[#121]: https://github.com/jerus-org/ci-container/pull/121
[#122]: https://github.com/jerus-org/ci-container/pull/122
[#123]: https://github.com/jerus-org/ci-container/pull/123
[#124]: https://github.com/jerus-org/ci-container/pull/124
[#125]: https://github.com/jerus-org/ci-container/pull/125
[#127]: https://github.com/jerus-org/ci-container/pull/127
[#128]: https://github.com/jerus-org/ci-container/pull/128
[#130]: https://github.com/jerus-org/ci-container/pull/130
[#129]: https://github.com/jerus-org/ci-container/pull/129
[Unreleased]: https://github.com/jerus-org/ci-container/compare/v0.1.9...HEAD
[0.1.9]: https://github.com/jerus-org/ci-container/compare/v0.1.8...v0.1.9
[0.1.8]: https://github.com/jerus-org/ci-container/compare/v0.1.7...v0.1.8
[0.1.7]: https://github.com/jerus-org/ci-container/compare/v0.1.6...v0.1.7
[0.1.6]: https://github.com/jerus-org/ci-container/compare/v0.1.5...v0.1.6
[0.1.5]: https://github.com/jerus-org/ci-container/compare/v0.1.4...v0.1.5
[0.1.4]: https://github.com/jerus-org/ci-container/compare/v0.1.3...v0.1.4
[0.1.3]: https://github.com/jerus-org/ci-container/compare/v0.1.2...v0.1.3
[0.1.2]: https://github.com/jerus-org/ci-container/compare/v0.1.1...v0.1.2
[0.1.1]: https://github.com/jerus-org/ci-container/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/jerus-org/ci-container/releases/tag/v0.1.0
