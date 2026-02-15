# Changelog

All notable changes to this project will be documented in this file.

## [0.1.80] - 2026-02-15

### Changed

- ♻️ refactor(docker)-reorder environment variables(pr [#380])
- 📦 build(docker)-update Dockerfile dependencies(pr [#381])

### Fixed

- deps: update dependency cull-gmail to v0.1.4(pr [#387])
- deps: update docker.io/library/rust:1.93.0 docker digest to bbde3ca(pr [#382])
- deps: update dependency cargo-llvm-cov to v0.8.4(pr [#385])
- deps: update dependency cargo-audit to v0.22.1(pr [#384])
- deps: update docker.io/library/rust docker tag to v1.93.1(pr [#386])
- deps: update dependency toolkit to v4.4.2(pr [#388])
- deps: update dependency cargo-release to v1(pr [#389])

## [0.1.79] - 2026-02-09

### Added

- add gen-orb-mcp to CI images(pr [#379])

### Fixed

- deps: update jerusdp/ci-rust:base docker digest to 129d1a3(pr [#376])
- deps: update dependency toolkit to v4.3.0(pr [#377])
- deps: update dependency wasmtime-cli to v41.0.3(pr [#378])

## [0.1.78] - 2026-02-01

### Fixed

- deps: update dependency pcu to v0.6.4(pr [#375])

## [0.1.77] - 2026-01-31

### Fixed

- deps: update dependency nextsv to v0.19.26(pr [#374])

## [0.1.76] - 2026-01-30

### Changed

- 🔧 chore(ci)-update docker tag format in CircleCI config(pr [#373])

## [0.1.75] - 2026-01-30

### Changed

- 🔧 chore(ci)-refactor docker tag assignment in config(pr [#372])

## [0.1.74] - 2026-01-29

### Changed

- 👷 ci(circleci)-update docker tag format(pr [#371])

## [0.1.73] - 2026-01-29

### Changed

- 👷 ci(circleci)-update docker login command(pr [#370])

## [0.1.72] - 2026-01-29

### Changed

- 👷 ci(config)-update command naming convention and tagging strategy(pr [#369])

### Fixed

- deps: update dependency wasmtime-cli to v41(pr [#364])
- deps: update docker.io/library/rust docker tag to v1.93.0(pr [#365])
- deps: update dependency wasm-pack to v0.14.0(pr [#366])
- deps: update dependency cargo-llvm-cov to v0.8.2(pr [#367])
- deps: pin dependencies(pr [#368])

## [0.1.71] - 2026-01-12

### Changed

- 🔧 chore(docker)-update Docker image references(pr [#345])
- Add custom manager for updating Dockerfile versioning(pr [#352])
- Fix fileMatch to managerFilePattern in renovate.json(pr [#354])
- Fix syntax error in renovate.json(pr [#355])
- Remove customManagers for Dockerfile updates(pr [#356])

### Fixed

- deps: update docker.io/library/rust docker tag to v1.92.0(pr [#346])
- deps: update dependency toolkit to v4(pr [#350])
- deps: update dependency toolkit to v4.2.1(pr [#351])
- deps: update dependency wasmtime-cli to v40(pr [#357])
- deps: update dependency cargo-fuzz to v0.13.1(pr [#358])
- deps: update dependency pcu to v0.6.3(pr [#359])
- deps: update dependency nextsv to v0.19.25(pr [#360])
- deps: update dependency cargo-llvm-cov to v0.6.23(pr [#361])
- deps: update dependency cargo-release to v0.25.22(pr [#362])
- deps: update dependency cull-gmail to v0.0.16(pr [#363])

## [0.1.70] - 2025-12-31

### Added

- add rolling 6-month multi-version image support(pr [#344])

## [0.1.69] - 2025-12-29

### Fixed

- add rust-src component to nightly toolchain for miri support(pr [#342])

## [0.1.68] - 2025-12-26

### Added

- add miri and cargo-fuzz support(pr [#341])

## [0.1.67] - 2025-12-21

### Changed

- 🔧 chore(Dockerfile)-downgrade cargo-audit version(pr [#339])
- 📦 build(docker)-cargo-audit  CVSS v4.0 (v0.22.0)(pr [#340])

## [0.1.66] - 2025-12-20

### Changed

- 📦 build(Dockerfile)-update cargo-audit to version 0.22.0(pr [#338])

### Fixed

- deps: update dependency toolkit to v3(pr [#337])
- deps: update rust docker tag to v1.92.0(pr [#335])
- deps: update dependency sonarcloud to v4(pr [#336])

## [0.1.65] - 2025-12-07

### Fixed

- deps: update rust docker tag to v1.91.1(pr [#333])

## [0.1.64] - 2025-11-07

### Fixed

- deps: update dependency toolkit to v2.16.0(pr [#331])
- deps: update rust docker tag to v1.91.0(pr [#332])

## [0.1.63] - 2025-10-26

### Changed

- 📦 build(docker)-update cull-gmail version(pr [#330])

## [0.1.62] - 2025-10-26

### Changed

- 📦 build(docker)-add cull-gmail to docker image(pr [#329])

## [0.1.61] - 2025-10-24

### Changed

- 👷 ci(circleci)-add go version 1.89 to test matrix(pr [#328])

## [0.1.60] - 2025-10-07

### Fixed

- deps: update dependency toolkit to v2.13.4(pr [#326])

## [0.1.59] - 2025-09-28

### Changed

- 📦 build(Dockerfile)-update gen-changelog version to 0.1.3(pr [#325])

## [0.1.58] - 2025-09-27

### Changed

- 👷 ci(circleci)-update orb versions(pr [#321])
- 🔧 chore(Dockerfile)-update gen-changelog version(pr [#322])
- 👷 ci(circleci)-update configuration for workflow parameters(pr [#323])
- 📦 build(dockerfile)-update gen-changelog version(pr [#324])

## [0.1.57] - 2025-09-24

### Changed

- 👷 ci(config)-update rust versions in CI matrix(pr [#320])

## [0.1.56] - 2025-09-19

### Changed

- 👷 ci(circleci)-update crate installation command name(pr [#316])
- 📦 build(dockerfile)-update crate versions(pr [#317])
- 👷 ci(circleci)-add github release command(pr [#318])
- 👷 ci(circleci)-fix update_prlog flag in config(pr [#319])

## [0.1.55] - 2025-09-17

### Changed

- 🔧 chore(makefile)-enhance build scripts with logging(pr [#307])
- 📝 docs-rename CHANGELOG.md to PRLOG.md(pr [#308])
- 📦 build(dockerfile)-update and reorganize cargo dependencies(pr [#309])
- 👷 ci(circleci)-enhance CircleCI configuration with new jobs(pr [#310])
- 👷 ci(circleci)-fix parameter references in config(pr [#311])
- 👷 ci(circleci)-fix syntax error in config.yml(pr [#312])
- 👷 ci(circleci)-add when_update_pcu parameter to workflows(pr [#315])

### Fixed

- 🐛 ci: add missing semicolon in conditional statement(pr [#313])
- 🐛 ci: correct changelog generation command(pr [#314])

## [0.1.54] - 2025-08-03

### Changed

- 🔧 chore(renovate)-update configuration for semantic commits(pr [#304])
- 🔧 chore(config)-update renovate configuration(pr [#305])
- 👷 ci(circleci)-update Rust version matrix(pr [#306])

## [0.1.53] - 2025-07-10

### Changed

- 👷 ci(circleci)-remove unnecessary pcu update flag(pr [#300])
- 💄 style(Dockerfile)-remove redundant curl flag(pr [#301])
- 🔧 chore(config)-update source URL for CircleCI toolkit(pr [#303])

### Security

- Dependencies: update dependency pcu to v0.4.49(pr [#302])

## [0.1.52] - 2025-07-08

### Changed

- 👷 ci(circleci)-update toolkit version and streamline jobs(pr [#298])
- 🔧 chore(Dockerfile)-update pcu version to 0.4.48(pr [#299])

## [0.1.51] - 2025-07-08

### Changed

- 👷 ci(circleci)-update circleci-toolkit orb version(pr [#296])
- 🔧 chore(Dockerfile)-update PCU_VERSION to 0.4.47(pr [#297])

## [0.1.50] - 2025-07-07

### Security

- Dependencies: update dependency pcu to v0.4.45(pr [#291])
- Dependencies: update dependency wasmtime-cli to v33.0.1(pr [#292])
- Dependencies: update cimg/base docker tag to v2025.07(pr [#293])
- Dependencies: update rust docker tag to v1.88.0(pr [#294])
- Dependencies: update dependency wasmtime-cli to v34(pr [#295])

## [0.1.49] - 2025-06-07

### Security

- Dependencies: update dependency pcu to v0.4.44(pr [#287])
- Dependencies: update dependency nextsv to v0.19.22(pr [#286])
- Dependencies: update rust docker tag to v1.87.0(pr [#288])
- Dependencies: update dependency wasmtime-cli to v33(pr [#290])
- Dependencies: update dependency sonarcloud to v3(pr [#289])

## [0.1.48] - 2025-05-12

### Changed

- 🔧 chore(config)-update renovate schedule(pr [#282])
- 🔧 chore(config)-update renovate schedule(pr [#284])
- 👷 ci(circleci)-fix YAML formatting for matrix parameters(pr [#285])

### Security

- Dependencies: update dependency nextsv to v0.19.21(pr [#281])
- Dependencies: update dependency pcu to v0.4.43(pr [#283])

## [0.1.47] - 2025-05-02

### Changed

- 🔧 chore(Dockerfile)-update pcu version to 0.4.42(pr [#277])
- 🔧 chore(ci)-update CircleCI toolkit orb version(pr [#279])
- 👷 ci(circleci)-update toolkit orb version and add pcu update(pr [#280])

### Security

- Dependencies: update dependency toolkit to v2.10.5(pr [#274])
- Dependencies: update dependency toolkit to v2.10.7(pr [#275])
- Dependencies: update cimg/base docker tag to v2025.05(pr [#276])

## [0.1.46] - 2025-04-29

### Changed

- 👷 ci(circleci)-update toolkit orb and adjust workflow dependencies(pr [#272])
- 👷 ci(circleci)-update workflow configurations for release and deploy(pr [#273])

## [0.1.45] - 2025-04-29

### Changed

- 👷 ci(circleci)-update toolkit version and simplify workflows(pr [#271])

## [0.1.44] - 2025-04-27

### Changed

- 🔧 chore(config)-remove renovate schedule(pr [#266])

### Security

- Dependencies: update dependency nextsv to v0.19.20(pr [#267])
- Dependencies: update dependency pcu to v0.4.41(pr [#268])
- Dependencies: update dependency wasmtime-cli to v32(pr [#269])

## [0.1.43] - 2025-04-22

### Security

- Dependencies: update dependency toolkit to v2.9.1(pr [#265])

## [0.1.42] - 2025-04-15

### Security

- Dependencies: update dependency cargo-release to v0.25.18(pr [#262])
- Dependencies: update dependency nextsv to v0.19.18(pr [#263])
- Dependencies: update dependency pcu to v0.4.39(pr [#264])

## [0.1.41] - 2025-04-08

### Security

- Dependencies: update dependency nextsv to v0.19.17(pr [#258])
- Dependencies: update dependency pcu to v0.4.38(pr [#259])
- Dependencies: update cimg/base docker tag to v2025.04(pr [#260])
- Dependencies: update rust docker tag to v1.86.0(pr [#261])

## [0.1.40] - 2025-04-01

### Security

- Dependencies: update dependency nextsv to v0.19.16(pr [#256])
- Dependencies: update dependency pcu to v0.4.37(pr [#257])

## [0.1.39] - 2025-03-25

### Security

- Dependencies: update dependency toolkit to v2.5.1(pr [#254])
- Dependencies: update dependency nextsv to v0.19.15(pr [#251])
- Dependencies: update dependency pcu to v0.4.36(pr [#252])
- Dependencies: update rust docker tag to v1.85.1(pr [#253])
- Dependencies: update dependency wasmtime-cli to v31(pr [#255])

## [0.1.38] - 2025-03-18

### Security

- Dependencies: update dependency pcu to v0.4.35(pr [#250])
- Dependencies: update dependency nextsv to v0.19.14(pr [#249])

## [0.1.37] - 2025-03-11

### Security

- Dependencies: update dependency nextsv to v0.19.13(pr [#247])
- Dependencies: update dependency pcu to v0.4.34(pr [#248])

## [0.1.36] - 2025-03-07

### Changed

- 👷 ci(circleci)-update Rust version matrix(pr [#246])

### Security

- Dependencies: update dependency cargo-audit to v0.21.2(pr [#240])
- Dependencies: update dependency nextsv to v0.19.12(pr [#241])
- Dependencies: update dependency pcu to v0.4.33(pr [#242])
- Dependencies: update dependency wasmtime-cli to v30.0.2(pr [#243])
- Dependencies: update cimg/base docker tag to v2025.03(pr [#244])
- Dependencies: update dependency toolkit to v2.1.0(pr [#245])

## [0.1.35] - 2025-02-28

### Changed

- 🔧 chore(Dockerfile)-update nextsv version to 0.19.11(pr [#239])

## [0.1.34] - 2025-02-25

### Security

- Dependencies: update dependency toolkit to v2.0.8(pr [#237])
- Dependencies: update dependency pcu to v0.4.32(pr [#238])

## [0.1.33] - 2025-02-25

### Changed

- 🔧 chore(Dockerfile): correct package name for wasm-pack(pr [#232])

### Security

- Dependencies: update dependency pcu to v0.4.30(pr [#231])
- Dependencies: update dependency nextsv to v0.19.9(pr [#230])
- Dependencies: update dependency pcu to v0.4.31(pr [#233])
- Dependencies: update rust docker tag to v1.85.0(pr [#234])
- Dependencies: update dependency wasmtime-cli to v30(pr [#235])
- Dependencies: update dependency nextsv to v0.19.10(pr [#236])

## [0.1.32] - 2025-02-18

### Security

- Dependencies: update dependency cargo-release to v0.25.17(pr [#225])
- Dependencies: update dependency nextsv to v0.19.8(pr [#226])
- Dependencies: update dependency pcu to v0.4.29(pr [#227])
- Dependencies: update rust docker tag to v1.84.1(pr [#228])
- Dependencies: update cimg/base docker tag to v2025.02(pr [#229])

## [0.1.31] - 2025-01-28

### Changed

- chore(config)-migrate renovate config(pr [#220])

### Security

- Dependencies: update dependency nextsv to v0.19.4(pr [#221])
- Dependencies: update dependency pcu to v0.4.26(pr [#222])
- Dependencies: update dependency wasmtime-cli to v28.0.1(pr [#223])
- Dependencies: update dependency wasmtime-cli to v29(pr [#224])

## [0.1.30] - 2025-01-21

### Changed

- ci-update CircleCI config to include when_use_workspace parameter and remove pcu_verbosity(pr [#212])
- ci(circleci)-update toolkit version and improve pipeline workflow(pr [#217])
- ci(circleci)-add release-flag parameter for pipeline execution(pr [#218])
- ci(circleci)-refine check_rebase workflow conditions(pr [#219])

### Security

- Dependencies: update dependency nextsv to v0.19.3(pr [#208])
- Dependencies: update dependency pcu to v0.4.24(pr [#209])
- Dependencies: update rust docker tag to v1.84.0(pr [#210])
- Dependencies: update dependency toolkit to v2(pr [#211])
- Dependencies: update dependency cargo-audit to v0.21.1(pr [#213])
- Dependencies: update dependency cargo-llvm-cov to v0.6.16(pr [#214])
- Dependencies: update dependency pcu to v0.4.25(pr [#215])

## [0.1.29] - 2025-01-07

### Security

- Dependencies: update dependency cargo-release to v0.25.15(pr [#204])
- Dependencies: update dependency nextsv to v0.19.2(pr [#205])
- Dependencies: update dependency pcu to v0.4.23(pr [#206])
- Dependencies: update cimg/base docker tag to v2025(pr [#207])

## [0.1.28] - 2024-12-31

### Security

- Dependencies: update dependency nextsv to v0.19.1(pr [#200])
- Dependencies: update dependency pcu to v0.4.22(pr [#201])
- Dependencies: update dependency toolkit to v1.23.0(pr [#202])
- Dependencies: update dependency wasmtime-cli to v28(pr [#203])

## [0.1.27] - 2024-12-24

### Changed

- ci(circleci)-add job dependencies for make_release in workflows(pr [#190])

### Fixed

- circleci: rename cargo_release parameter to when_cargo_release in config file(pr [#199])

### Security

- Dependencies: update dependency cargo-release to v0.25.14(pr [#191])
- Dependencies: update dependency pcu to v0.4.20(pr [#192])
- Dependencies: update dependency nextsv to v0.18.0(pr [#193])
- Dependencies: update dependency toolkit to v1.20.2(pr [#194])
- Dependencies: update dependency cargo-llvm-cov to v0.6.15(pr [#195])
- Dependencies: update dependency pcu to v0.4.21(pr [#196])
- Dependencies: update dependency nextsv to v0.19.0(pr [#197])
- Dependencies: update dependency toolkit to v1.21.0(pr [#198])

## [0.1.26] - 2024-12-11

### Changed

- refactor(circleci)-rename cargo_release to when_cargo_release in config.yml(pr [#187])
- chore-update NEXTSV_VERSION to 0.17.0 in Dockerfile(pr [#188])
- chore-downgrade circleci-toolkit orb to version 1.19.0(pr [#189])

### Security

- Dependencies: update dependency pcu to v0.4.19(pr [#183])
- Dependencies: update dependency nextsv to v0.16.0(pr [#184])
- Dependencies: update dependency toolkit to v1.20.1(pr [#185])
- Dependencies: update rust docker tag to v1.83.0(pr [#186])

## [0.1.25] - 2024-12-06

### Added

- add wasm-pack installation and environment variable(pr [#182])

### Security

- Dependencies: update cimg/base docker tag to v2024.12(pr [#180])
- Dependencies: update dependency pcu to v0.4.18(pr [#179])
- Dependencies: update dependency nextsv to v0.15.0(pr [#181])

## [0.1.24] - 2024-12-03

### Changed

- chore(Dockerfile)-add new cargo tools for build process(pr [#178])

## [0.1.23] - 2024-11-26

### Security

- Dependencies: update dependency wasmtime-cli to v27(pr [#175])
- Dependencies: update dependency pcu to v0.4.17(pr [#176])
- Dependencies: update dependency nextsv to v0.14.0(pr [#177])

## [0.1.22] - 2024-11-19

### Security

- Dependencies: update dependency cargo-release to v0.25.13(pr [#171])
- Dependencies: update dependency pcu to v0.4.16(pr [#172])
- Dependencies: update dependency nextsv to v0.13.0(pr [#173])

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

- It is not required for test container run
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
[#173]: https://github.com/jerus-org/ci-container/pull/173
[#175]: https://github.com/jerus-org/ci-container/pull/175
[#176]: https://github.com/jerus-org/ci-container/pull/176
[#177]: https://github.com/jerus-org/ci-container/pull/177
[#178]: https://github.com/jerus-org/ci-container/pull/178
[#180]: https://github.com/jerus-org/ci-container/pull/180
[#179]: https://github.com/jerus-org/ci-container/pull/179
[#181]: https://github.com/jerus-org/ci-container/pull/181
[#182]: https://github.com/jerus-org/ci-container/pull/182
[#183]: https://github.com/jerus-org/ci-container/pull/183
[#184]: https://github.com/jerus-org/ci-container/pull/184
[#185]: https://github.com/jerus-org/ci-container/pull/185
[#186]: https://github.com/jerus-org/ci-container/pull/186
[#187]: https://github.com/jerus-org/ci-container/pull/187
[#188]: https://github.com/jerus-org/ci-container/pull/188
[#189]: https://github.com/jerus-org/ci-container/pull/189
[#190]: https://github.com/jerus-org/ci-container/pull/190
[#191]: https://github.com/jerus-org/ci-container/pull/191
[#192]: https://github.com/jerus-org/ci-container/pull/192
[#193]: https://github.com/jerus-org/ci-container/pull/193
[#194]: https://github.com/jerus-org/ci-container/pull/194
[#195]: https://github.com/jerus-org/ci-container/pull/195
[#196]: https://github.com/jerus-org/ci-container/pull/196
[#197]: https://github.com/jerus-org/ci-container/pull/197
[#198]: https://github.com/jerus-org/ci-container/pull/198
[#199]: https://github.com/jerus-org/ci-container/pull/199
[#200]: https://github.com/jerus-org/ci-container/pull/200
[#201]: https://github.com/jerus-org/ci-container/pull/201
[#202]: https://github.com/jerus-org/ci-container/pull/202
[#203]: https://github.com/jerus-org/ci-container/pull/203
[#204]: https://github.com/jerus-org/ci-container/pull/204
[#205]: https://github.com/jerus-org/ci-container/pull/205
[#206]: https://github.com/jerus-org/ci-container/pull/206
[#207]: https://github.com/jerus-org/ci-container/pull/207
[#208]: https://github.com/jerus-org/ci-container/pull/208
[#209]: https://github.com/jerus-org/ci-container/pull/209
[#210]: https://github.com/jerus-org/ci-container/pull/210
[#211]: https://github.com/jerus-org/ci-container/pull/211
[#212]: https://github.com/jerus-org/ci-container/pull/212
[#213]: https://github.com/jerus-org/ci-container/pull/213
[#214]: https://github.com/jerus-org/ci-container/pull/214
[#215]: https://github.com/jerus-org/ci-container/pull/215
[#217]: https://github.com/jerus-org/ci-container/pull/217
[#218]: https://github.com/jerus-org/ci-container/pull/218
[#219]: https://github.com/jerus-org/ci-container/pull/219
[#220]: https://github.com/jerus-org/ci-container/pull/220
[#221]: https://github.com/jerus-org/ci-container/pull/221
[#222]: https://github.com/jerus-org/ci-container/pull/222
[#223]: https://github.com/jerus-org/ci-container/pull/223
[#224]: https://github.com/jerus-org/ci-container/pull/224
[#225]: https://github.com/jerus-org/ci-container/pull/225
[#226]: https://github.com/jerus-org/ci-container/pull/226
[#227]: https://github.com/jerus-org/ci-container/pull/227
[#228]: https://github.com/jerus-org/ci-container/pull/228
[#229]: https://github.com/jerus-org/ci-container/pull/229
[#231]: https://github.com/jerus-org/ci-container/pull/231
[#230]: https://github.com/jerus-org/ci-container/pull/230
[#232]: https://github.com/jerus-org/ci-container/pull/232
[#233]: https://github.com/jerus-org/ci-container/pull/233
[#234]: https://github.com/jerus-org/ci-container/pull/234
[#235]: https://github.com/jerus-org/ci-container/pull/235
[#236]: https://github.com/jerus-org/ci-container/pull/236
[#237]: https://github.com/jerus-org/ci-container/pull/237
[#238]: https://github.com/jerus-org/ci-container/pull/238
[#239]: https://github.com/jerus-org/ci-container/pull/239
[#240]: https://github.com/jerus-org/ci-container/pull/240
[#241]: https://github.com/jerus-org/ci-container/pull/241
[#242]: https://github.com/jerus-org/ci-container/pull/242
[#243]: https://github.com/jerus-org/ci-container/pull/243
[#244]: https://github.com/jerus-org/ci-container/pull/244
[#245]: https://github.com/jerus-org/ci-container/pull/245
[#246]: https://github.com/jerus-org/ci-container/pull/246
[#247]: https://github.com/jerus-org/ci-container/pull/247
[#248]: https://github.com/jerus-org/ci-container/pull/248
[#250]: https://github.com/jerus-org/ci-container/pull/250
[#249]: https://github.com/jerus-org/ci-container/pull/249
[#254]: https://github.com/jerus-org/ci-container/pull/254
[#251]: https://github.com/jerus-org/ci-container/pull/251
[#252]: https://github.com/jerus-org/ci-container/pull/252
[#253]: https://github.com/jerus-org/ci-container/pull/253
[#255]: https://github.com/jerus-org/ci-container/pull/255
[#256]: https://github.com/jerus-org/ci-container/pull/256
[#257]: https://github.com/jerus-org/ci-container/pull/257
[#258]: https://github.com/jerus-org/ci-container/pull/258
[#259]: https://github.com/jerus-org/ci-container/pull/259
[#260]: https://github.com/jerus-org/ci-container/pull/260
[#261]: https://github.com/jerus-org/ci-container/pull/261
[#262]: https://github.com/jerus-org/ci-container/pull/262
[#263]: https://github.com/jerus-org/ci-container/pull/263
[#264]: https://github.com/jerus-org/ci-container/pull/264
[#265]: https://github.com/jerus-org/ci-container/pull/265
[#266]: https://github.com/jerus-org/ci-container/pull/266
[#267]: https://github.com/jerus-org/ci-container/pull/267
[#268]: https://github.com/jerus-org/ci-container/pull/268
[#269]: https://github.com/jerus-org/ci-container/pull/269
[#271]: https://github.com/jerus-org/ci-container/pull/271
[#272]: https://github.com/jerus-org/ci-container/pull/272
[#273]: https://github.com/jerus-org/ci-container/pull/273
[#274]: https://github.com/jerus-org/ci-container/pull/274
[#275]: https://github.com/jerus-org/ci-container/pull/275
[#276]: https://github.com/jerus-org/ci-container/pull/276
[#277]: https://github.com/jerus-org/ci-container/pull/277
[#279]: https://github.com/jerus-org/ci-container/pull/279
[#280]: https://github.com/jerus-org/ci-container/pull/280
[#281]: https://github.com/jerus-org/ci-container/pull/281
[#282]: https://github.com/jerus-org/ci-container/pull/282
[#283]: https://github.com/jerus-org/ci-container/pull/283
[#284]: https://github.com/jerus-org/ci-container/pull/284
[#285]: https://github.com/jerus-org/ci-container/pull/285
[#287]: https://github.com/jerus-org/ci-container/pull/287
[#286]: https://github.com/jerus-org/ci-container/pull/286
[#288]: https://github.com/jerus-org/ci-container/pull/288
[#290]: https://github.com/jerus-org/ci-container/pull/290
[#289]: https://github.com/jerus-org/ci-container/pull/289
[#291]: https://github.com/jerus-org/ci-container/pull/291
[#292]: https://github.com/jerus-org/ci-container/pull/292
[#293]: https://github.com/jerus-org/ci-container/pull/293
[#294]: https://github.com/jerus-org/ci-container/pull/294
[#295]: https://github.com/jerus-org/ci-container/pull/295
[#296]: https://github.com/jerus-org/ci-container/pull/296
[#297]: https://github.com/jerus-org/ci-container/pull/297
[#298]: https://github.com/jerus-org/ci-container/pull/298
[#299]: https://github.com/jerus-org/ci-container/pull/299
[#300]: https://github.com/jerus-org/ci-container/pull/300
[#301]: https://github.com/jerus-org/ci-container/pull/301
[#303]: https://github.com/jerus-org/ci-container/pull/303
[#302]: https://github.com/jerus-org/ci-container/pull/302
[#304]: https://github.com/jerus-org/ci-container/pull/304
[#305]: https://github.com/jerus-org/ci-container/pull/305
[#306]: https://github.com/jerus-org/ci-container/pull/306
[#307]: https://github.com/jerus-org/ci-container/pull/307
[#308]: https://github.com/jerus-org/ci-container/pull/308
[#309]: https://github.com/jerus-org/ci-container/pull/309
[#310]: https://github.com/jerus-org/ci-container/pull/310
[#311]: https://github.com/jerus-org/ci-container/pull/311
[#312]: https://github.com/jerus-org/ci-container/pull/312
[#313]: https://github.com/jerus-org/ci-container/pull/313
[#314]: https://github.com/jerus-org/ci-container/pull/314
[#315]: https://github.com/jerus-org/ci-container/pull/315
[#316]: https://github.com/jerus-org/ci-container/pull/316
[#317]: https://github.com/jerus-org/ci-container/pull/317
[#318]: https://github.com/jerus-org/ci-container/pull/318
[#319]: https://github.com/jerus-org/ci-container/pull/319
[#320]: https://github.com/jerus-org/ci-container/pull/320
[#321]: https://github.com/jerus-org/ci-container/pull/321
[#322]: https://github.com/jerus-org/ci-container/pull/322
[#323]: https://github.com/jerus-org/ci-container/pull/323
[#324]: https://github.com/jerus-org/ci-container/pull/324
[#325]: https://github.com/jerus-org/ci-container/pull/325
[#326]: https://github.com/jerus-org/ci-container/pull/326
[#328]: https://github.com/jerus-org/ci-container/pull/328
[#329]: https://github.com/jerus-org/ci-container/pull/329
[#330]: https://github.com/jerus-org/ci-container/pull/330
[#331]: https://github.com/jerus-org/ci-container/pull/331
[#332]: https://github.com/jerus-org/ci-container/pull/332
[#333]: https://github.com/jerus-org/ci-container/pull/333
[#337]: https://github.com/jerus-org/ci-container/pull/337
[#335]: https://github.com/jerus-org/ci-container/pull/335
[#336]: https://github.com/jerus-org/ci-container/pull/336
[#338]: https://github.com/jerus-org/ci-container/pull/338
[#339]: https://github.com/jerus-org/ci-container/pull/339
[#340]: https://github.com/jerus-org/ci-container/pull/340
[#341]: https://github.com/jerus-org/ci-container/pull/341
[#342]: https://github.com/jerus-org/ci-container/pull/342
[#344]: https://github.com/jerus-org/ci-container/pull/344
[#345]: https://github.com/jerus-org/ci-container/pull/345
[#346]: https://github.com/jerus-org/ci-container/pull/346
[#350]: https://github.com/jerus-org/ci-container/pull/350
[#352]: https://github.com/jerus-org/ci-container/pull/352
[#354]: https://github.com/jerus-org/ci-container/pull/354
[#355]: https://github.com/jerus-org/ci-container/pull/355
[#356]: https://github.com/jerus-org/ci-container/pull/356
[#351]: https://github.com/jerus-org/ci-container/pull/351
[#357]: https://github.com/jerus-org/ci-container/pull/357
[#358]: https://github.com/jerus-org/ci-container/pull/358
[#359]: https://github.com/jerus-org/ci-container/pull/359
[#360]: https://github.com/jerus-org/ci-container/pull/360
[#361]: https://github.com/jerus-org/ci-container/pull/361
[#362]: https://github.com/jerus-org/ci-container/pull/362
[#363]: https://github.com/jerus-org/ci-container/pull/363
[#364]: https://github.com/jerus-org/ci-container/pull/364
[#365]: https://github.com/jerus-org/ci-container/pull/365
[#366]: https://github.com/jerus-org/ci-container/pull/366
[#367]: https://github.com/jerus-org/ci-container/pull/367
[#368]: https://github.com/jerus-org/ci-container/pull/368
[#369]: https://github.com/jerus-org/ci-container/pull/369
[#370]: https://github.com/jerus-org/ci-container/pull/370
[#371]: https://github.com/jerus-org/ci-container/pull/371
[#372]: https://github.com/jerus-org/ci-container/pull/372
[#373]: https://github.com/jerus-org/ci-container/pull/373
[#374]: https://github.com/jerus-org/ci-container/pull/374
[#375]: https://github.com/jerus-org/ci-container/pull/375
[#379]: https://github.com/jerus-org/ci-container/pull/379
[#376]: https://github.com/jerus-org/ci-container/pull/376
[#377]: https://github.com/jerus-org/ci-container/pull/377
[#378]: https://github.com/jerus-org/ci-container/pull/378
[#380]: https://github.com/jerus-org/ci-container/pull/380
[#381]: https://github.com/jerus-org/ci-container/pull/381
[#387]: https://github.com/jerus-org/ci-container/pull/387
[#382]: https://github.com/jerus-org/ci-container/pull/382
[#385]: https://github.com/jerus-org/ci-container/pull/385
[#384]: https://github.com/jerus-org/ci-container/pull/384
[#386]: https://github.com/jerus-org/ci-container/pull/386
[#388]: https://github.com/jerus-org/ci-container/pull/388
[#389]: https://github.com/jerus-org/ci-container/pull/389
[0.1.80]: https://github.com/jerus-org/ci-container/compare/v0.1.79...v0.1.80
[0.1.79]: https://github.com/jerus-org/ci-container/compare/v0.1.78...v0.1.79
[0.1.78]: https://github.com/jerus-org/ci-container/compare/v0.1.77...v0.1.78
[0.1.77]: https://github.com/jerus-org/ci-container/compare/v0.1.76...v0.1.77
[0.1.76]: https://github.com/jerus-org/ci-container/compare/v0.1.75...v0.1.76
[0.1.75]: https://github.com/jerus-org/ci-container/compare/v0.1.74...v0.1.75
[0.1.74]: https://github.com/jerus-org/ci-container/compare/v0.1.73...v0.1.74
[0.1.73]: https://github.com/jerus-org/ci-container/compare/v0.1.72...v0.1.73
[0.1.72]: https://github.com/jerus-org/ci-container/compare/v0.1.71...v0.1.72
[0.1.71]: https://github.com/jerus-org/ci-container/compare/v0.1.70...v0.1.71
[0.1.70]: https://github.com/jerus-org/ci-container/compare/v0.1.69...v0.1.70
[0.1.69]: https://github.com/jerus-org/ci-container/compare/v0.1.68...v0.1.69
[0.1.68]: https://github.com/jerus-org/ci-container/compare/v0.1.67...v0.1.68
[0.1.67]: https://github.com/jerus-org/ci-container/compare/v0.1.66...v0.1.67
[0.1.66]: https://github.com/jerus-org/ci-container/compare/v0.1.65...v0.1.66
[0.1.65]: https://github.com/jerus-org/ci-container/compare/v0.1.64...v0.1.65
[0.1.64]: https://github.com/jerus-org/ci-container/compare/v0.1.63...v0.1.64
[0.1.63]: https://github.com/jerus-org/ci-container/compare/v0.1.62...v0.1.63
[0.1.62]: https://github.com/jerus-org/ci-container/compare/v0.1.61...v0.1.62
[0.1.61]: https://github.com/jerus-org/ci-container/compare/v0.1.60...v0.1.61
[0.1.60]: https://github.com/jerus-org/ci-container/compare/v0.1.59...v0.1.60
[0.1.59]: https://github.com/jerus-org/ci-container/compare/v0.1.58...v0.1.59
[0.1.58]: https://github.com/jerus-org/ci-container/compare/v0.1.57...v0.1.58
[0.1.57]: https://github.com/jerus-org/ci-container/compare/v0.1.56...v0.1.57
[0.1.56]: https://github.com/jerus-org/ci-container/compare/v0.1.55...v0.1.56
[0.1.55]: https://github.com/jerus-org/ci-container/compare/v0.1.54...v0.1.55
[0.1.54]: https://github.com/jerus-org/ci-container/compare/v0.1.53...v0.1.54
[0.1.53]: https://github.com/jerus-org/ci-container/compare/v0.1.52...v0.1.53
[0.1.52]: https://github.com/jerus-org/ci-container/compare/v0.1.51...v0.1.52
[0.1.51]: https://github.com/jerus-org/ci-container/compare/v0.1.50...v0.1.51
[0.1.50]: https://github.com/jerus-org/ci-container/compare/v0.1.49...v0.1.50
[0.1.49]: https://github.com/jerus-org/ci-container/compare/v0.1.48...v0.1.49
[0.1.48]: https://github.com/jerus-org/ci-container/compare/v0.1.47...v0.1.48
[0.1.47]: https://github.com/jerus-org/ci-container/compare/v0.1.46...v0.1.47
[0.1.46]: https://github.com/jerus-org/ci-container/compare/v0.1.45...v0.1.46
[0.1.45]: https://github.com/jerus-org/ci-container/compare/v0.1.44...v0.1.45
[0.1.44]: https://github.com/jerus-org/ci-container/compare/v0.1.43...v0.1.44
[0.1.43]: https://github.com/jerus-org/ci-container/compare/v0.1.42...v0.1.43
[0.1.42]: https://github.com/jerus-org/ci-container/compare/v0.1.41...v0.1.42
[0.1.41]: https://github.com/jerus-org/ci-container/compare/v0.1.40...v0.1.41
[0.1.40]: https://github.com/jerus-org/ci-container/compare/v0.1.39...v0.1.40
[0.1.39]: https://github.com/jerus-org/ci-container/compare/v0.1.38...v0.1.39
[0.1.38]: https://github.com/jerus-org/ci-container/compare/v0.1.37...v0.1.38
[0.1.37]: https://github.com/jerus-org/ci-container/compare/v0.1.36...v0.1.37
[0.1.36]: https://github.com/jerus-org/ci-container/compare/v0.1.35...v0.1.36
[0.1.35]: https://github.com/jerus-org/ci-container/compare/v0.1.34...v0.1.35
[0.1.34]: https://github.com/jerus-org/ci-container/compare/v0.1.33...v0.1.34
[0.1.33]: https://github.com/jerus-org/ci-container/compare/v0.1.32...v0.1.33
[0.1.32]: https://github.com/jerus-org/ci-container/compare/v0.1.31...v0.1.32
[0.1.31]: https://github.com/jerus-org/ci-container/compare/v0.1.30...v0.1.31
[0.1.30]: https://github.com/jerus-org/ci-container/compare/v0.1.29...v0.1.30
[0.1.29]: https://github.com/jerus-org/ci-container/compare/v0.1.28...v0.1.29
[0.1.28]: https://github.com/jerus-org/ci-container/compare/v0.1.27...v0.1.28
[0.1.27]: https://github.com/jerus-org/ci-container/compare/v0.1.26...v0.1.27
[0.1.26]: https://github.com/jerus-org/ci-container/compare/v0.1.25...v0.1.26
[0.1.25]: https://github.com/jerus-org/ci-container/compare/v0.1.24...v0.1.25
[0.1.24]: https://github.com/jerus-org/ci-container/compare/v0.1.23...v0.1.24
[0.1.23]: https://github.com/jerus-org/ci-container/compare/v0.1.22...v0.1.23
[0.1.22]: https://github.com/jerus-org/ci-container/compare/v0.1.21...v0.1.22
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
