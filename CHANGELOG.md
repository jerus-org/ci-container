# Changelog

All notable changes to this project will be documented in this file.

## [Unreleased]

### Security

- Dependencies: update dependency cargo-release to v0.25.13(pr [#171])
- Dependencies: update dependency pcu to v0.4.16(pr [#172])

## [0.1.21] - 2024-11-17

### Changed

- chore(Dockerfile)-set default user and work directory for circleci(pr [#174])

## [0.1.20] - 2024-11-17

### Changed

- ci(circleci)-add Rust version 1.81 to test matrix(pr [#170])

## [0.1.19] - 2024-11-10

### Security

- Dependencies: update dependency nextsv to v0.12.0(pr [#168])
- Dependencies: update dependency pcu to v0.4.15(pr [#169])

## [0.1.18] - 2024-11-08

### Added

- add llvm-tools component to rustup installation in Dockerfile(pr [#167])

### Security

- Dependencies: update dependency toolkit to v1.18.0(pr [#165])
- Dependencies: update dependency toolkit to v1.19.0(pr [#166])

## [0.1.17] - 2024-11-07

### Changed

- chore-update CircleCI toolkit orb to version 1.17.0 and remove Docker version specification(pr [#163])
- chore-add cargo-llvm-cov to Dockerfile build process(pr [#164])

## [0.1.16] - 2024-11-07

### Added

- add cargo-llvm-cov to installed tools(pr [#161])

### Security

- Dependencies: update dependency nextsv to v0.11.0(pr [#158])
- Dependencies: update dependency wasmtime-cli to v26.0.1(pr [#159])
- Dependencies: update dependency toolkit to v1.16.0(pr [#160])

## [0.1.15] - 2024-11-02

### Security

- Dependencies: update dependency toolkit to v1.14.0(pr [#149])
- Dependencies: update dependency nextsv to v0.9.1(pr [#150])
- Dependencies: update dependency cargo-audit to v0.21.0(pr [#151])
- Dependencies: update dependency nextsv to v0.9.2(pr [#152])
- Dependencies: update dependency toolkit to v1.15.0(pr [#154])
- Dependencies: update cimg/base docker tag to v2024.11(pr [#155])
- Dependencies: update dependency pcu to v0.4.14(pr [#156])
- Dependencies: update dependency nextsv to v0.10.0(pr [#157])

## [0.1.14] - 2024-10-26

### Security

- Dependencies: update dependency wasmtime-cli to v26(pr [#147])
- Dependencies: update dependency pcu to v0.4.13(pr [#148])

## [0.1.13] - 2024-10-19

### Security

- Dependencies: update rust docker tag to v1.82.0(pr [#144])
- Dependencies: update dependency pcu to v0.4.12(pr [#146])
- Dependencies: update dependency nextsv to v0.8.22(pr [#145])

## [0.1.12] - 2024-10-12

### Security

- Dependencies: update dependency nextsv to v0.8.20(pr [#138])
- Dependencies: update dependency pcu to v0.4.10(pr [#139])
- Dependencies: update dependency cargo-release to v0.25.12(pr [#140])
- Dependencies: update dependency wasmtime-cli to v25.0.2(pr [#141])
- Dependencies: update dependency nextsv to v0.8.21(pr [#142])
- Dependencies: update dependency pcu to v0.4.11(pr [#143])

## [0.1.11] - 2024-10-05

### Security

- Dependencies: update dependency nextsv to v0.8.19(pr [#135])
- Dependencies: update dependency pcu to v0.4.9(pr [#136])
- Dependencies: update cimg/base docker tag to v2024.10(pr [#137])

## [0.1.10] - 2024-09-25

### Added

- update renovate regex manager to handle additional Dockerfile and Containerfile patterns(pr [#125])
- update renovate.json to enable jerus-org/circleci-toolkit with source URL(pr [#134])

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
- Dependencies: update dependency cargo-release to v0.25.11(pr [#131])
- Dependencies: update dependency nextsv to v0.8.18(pr [#132])
- Dependencies: update dependency wasmtime-cli to v25.0.1(pr [#133])

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
[#131]: https://github.com/jerus-org/ci-container/pull/131
[#132]: https://github.com/jerus-org/ci-container/pull/132
[#133]: https://github.com/jerus-org/ci-container/pull/133
[#134]: https://github.com/jerus-org/ci-container/pull/134
[#135]: https://github.com/jerus-org/ci-container/pull/135
[#136]: https://github.com/jerus-org/ci-container/pull/136
[#137]: https://github.com/jerus-org/ci-container/pull/137
[#138]: https://github.com/jerus-org/ci-container/pull/138
[#139]: https://github.com/jerus-org/ci-container/pull/139
[#140]: https://github.com/jerus-org/ci-container/pull/140
[#141]: https://github.com/jerus-org/ci-container/pull/141
[#142]: https://github.com/jerus-org/ci-container/pull/142
[#143]: https://github.com/jerus-org/ci-container/pull/143
[#144]: https://github.com/jerus-org/ci-container/pull/144
[#146]: https://github.com/jerus-org/ci-container/pull/146
[#145]: https://github.com/jerus-org/ci-container/pull/145
[#147]: https://github.com/jerus-org/ci-container/pull/147
[#148]: https://github.com/jerus-org/ci-container/pull/148
[#149]: https://github.com/jerus-org/ci-container/pull/149
[#150]: https://github.com/jerus-org/ci-container/pull/150
[#151]: https://github.com/jerus-org/ci-container/pull/151
[#152]: https://github.com/jerus-org/ci-container/pull/152
[#154]: https://github.com/jerus-org/ci-container/pull/154
[#155]: https://github.com/jerus-org/ci-container/pull/155
[#156]: https://github.com/jerus-org/ci-container/pull/156
[#157]: https://github.com/jerus-org/ci-container/pull/157
[#158]: https://github.com/jerus-org/ci-container/pull/158
[#159]: https://github.com/jerus-org/ci-container/pull/159
[#161]: https://github.com/jerus-org/ci-container/pull/161
[#160]: https://github.com/jerus-org/ci-container/pull/160
[#163]: https://github.com/jerus-org/ci-container/pull/163
[#164]: https://github.com/jerus-org/ci-container/pull/164
[#165]: https://github.com/jerus-org/ci-container/pull/165
[#167]: https://github.com/jerus-org/ci-container/pull/167
[#166]: https://github.com/jerus-org/ci-container/pull/166
[#168]: https://github.com/jerus-org/ci-container/pull/168
[#169]: https://github.com/jerus-org/ci-container/pull/169
[#170]: https://github.com/jerus-org/ci-container/pull/170
[#174]: https://github.com/jerus-org/ci-container/pull/174
[#171]: https://github.com/jerus-org/ci-container/pull/171
[#172]: https://github.com/jerus-org/ci-container/pull/172
[Unreleased]: https://github.com/jerus-org/ci-container/compare/v0.1.21...HEAD
[0.1.21]: https://github.com/jerus-org/ci-container/compare/v0.1.20...v0.1.21
[0.1.20]: https://github.com/jerus-org/ci-container/compare/v0.1.19...v0.1.20
[0.1.19]: https://github.com/jerus-org/ci-container/compare/v0.1.18...v0.1.19
[0.1.18]: https://github.com/jerus-org/ci-container/compare/v0.1.17...v0.1.18
[0.1.17]: https://github.com/jerus-org/ci-container/compare/v0.1.16...v0.1.17
[0.1.16]: https://github.com/jerus-org/ci-container/compare/v0.1.15...v0.1.16
[0.1.15]: https://github.com/jerus-org/ci-container/compare/v0.1.14...v0.1.15
[0.1.14]: https://github.com/jerus-org/ci-container/compare/v0.1.13...v0.1.14
[0.1.13]: https://github.com/jerus-org/ci-container/compare/v0.1.12...v0.1.13
[0.1.12]: https://github.com/jerus-org/ci-container/compare/v0.1.11...v0.1.12
[0.1.11]: https://github.com/jerus-org/ci-container/compare/v0.1.10...v0.1.11
[0.1.10]: https://github.com/jerus-org/ci-container/compare/v0.1.9...v0.1.10
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
