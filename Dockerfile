# Dockerfile - Multi-version Rust image for 6-month rolling window
#
# This image contains all stable Rust versions from the last 6 months,
# plus beta and nightly. It enables digest-pinned immutable builds while
# supporting automatic version fallback for older MSRVs.
#
# The 6-month window is calculated automatically based on the current stable
# Rust version. Rust releases every ~6 weeks, so 6 months = ~4 releases.
# We include 4 prior versions plus current stable (5 total stable versions).
#
# Published as:
#   jerusdp/ci-rust:rolling-6mo
#   jerusdp/ci-rust:rolling-6mo-wasi
#
# Usage:
#   docker build -t jerusdp/ci-rust:rolling-6mo --target final .
#   docker build -t jerusdp/ci-rust:rolling-6mo-wasi --target wasi .

# nosonar(docker:S8431) - tag required for Renovate version tracking; digest provides immutability
FROM docker.io/library/rust:1.94.0@sha256:7e322aa1b876cbb977e0df46812af6c4e8be2efbfb2ce3712c28a93ba2968726 AS binaries
# renovate: datasource=crate depName=cargo-binstall packageName=cargo-binstall versioning=semver-coerced
ENV CARGO_BINSTALL_VERSION=1.17.7
# renovate: datasource=crate depName=cargo-audit packageName=cargo-audit versioning=semver-coerced
ENV CARGO_AUDIT_VERSION=0.22.1
# renovate: datasource=crate depName=cargo-expand packageName=cargo-expand versioning=semver-coerced
ENV CARGO_EXPAND_VERSION=1.0.95
# renovate: datasource=crate depName=cargo-fuzz packageName=cargo-fuzz versioning=semver-coerced
ENV CARGO_FUZZ_VERSION=0.13.1
# renovate: datasource=crate depName=cargo-llvm-cov packageName=cargo-llvm-cov versioning=semver-coerced
ENV CARGO_LLVM_COV_VERSION=0.8.4
# renovate: datasource=crate depName=cargo-nextest packageName=cargo-nextest versioning=semver-coerced
ENV CARGO_NEXTEST_VERSION=0.9.130
# renovate: datasource=crate depName=cargo-release packageName=cargo-release versioning=semver-coerced
ENV CARGO_RELEASE_VERSION=1.1.1
# renovate: datasource=crate depName=circleci-junit-fix packageName=circleci-junit-fix versioning=semver-coerced
ENV CIRCLECI_JUNIT_FIX_VERSION=0.2.3
# renovate: datasource=crate depName=cull-gmail packageName=cull-gmail versioning=semver-coerced
ENV CULL_GMAIL_VERSION=0.1.7
# renovate: datasource=crate depName=gen-changelog packageName=gen-changelog versioning=semver-coerced
ENV GEN_CHANGELOG_VERSION=0.1.7
# renovate: datasource=crate depName=gen-orb-mcp packageName=gen-orb-mcp versioning=semver-coerced
ENV GEN_ORB_MCP_VERSION=0.1.1
# renovate: datasource=crate depName=kdeets packageName=kdeets versioning=semver-coerced
ENV KDEETS_VERSION=0.1.29
# renovate: datasource=crate depName=nextsv packageName=nextsv versioning=semver-coerced
ENV NEXTSV_VERSION=0.19.29
# renovate: datasource=crate depName=pcu packageName=pcu versioning=semver-coerced
ENV PCU_VERSION=0.6.13
# renovate: datasource=crate depName=rsign2 packageName=rsign2 versioning=semver-coerced
ENV RSIGN2_VERSION=0.6.6
# renovate: datasource=crate depName=wasm-pack packageName=wasm-pack versioning=semver-coerced
ENV WASMPACK_VERSION=0.14.0
# renovate: datasource=crate depName=wasmtime-cli packageName=wasmtime-cli versioning=semver-coerced
ENV WASMTIME_VERSION=42.0.1
SHELL ["/bin/bash", "-euxo", "pipefail", "-c"]
RUN apt-get update; \
    apt-get install -y --no-install-recommends \
    build-essential \
    libssl-dev \
    pkg-config \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN cargo install cargo-binstall --version "${CARGO_BINSTALL_VERSION}" --locked
RUN \
    cargo binstall --locked cargo-audit --version "${CARGO_AUDIT_VERSION}" --no-confirm; \
    cargo binstall --locked cargo-expand --version "${CARGO_EXPAND_VERSION}" --no-confirm; \
    cargo binstall --locked cargo-fuzz --version "${CARGO_FUZZ_VERSION}" --no-confirm; \
    cargo binstall --locked cargo-llvm-cov --version "${CARGO_LLVM_COV_VERSION}" --no-confirm; \
    cargo binstall --locked cargo-nextest --version "${CARGO_NEXTEST_VERSION}" --no-confirm; \
    cargo binstall --locked cargo-release --version "${CARGO_RELEASE_VERSION}" --no-confirm; \
    cargo binstall --locked circleci-junit-fix --version "${CIRCLECI_JUNIT_FIX_VERSION}" --no-confirm; \
    cargo binstall --locked cull-gmail --version "${CULL_GMAIL_VERSION}" --no-confirm; \
    cargo binstall --locked gen-changelog --version "${GEN_CHANGELOG_VERSION}" --no-confirm; \
    cargo binstall --locked gen-orb-mcp --version "${GEN_ORB_MCP_VERSION}" --no-confirm; \
    cargo binstall --locked kdeets --version "${KDEETS_VERSION}" --no-confirm; \
    cargo binstall --locked nextsv --version "${NEXTSV_VERSION}" --no-confirm; \
    cargo binstall --locked pcu --version "${PCU_VERSION}" --no-confirm; \
    cargo binstall --locked rsign2 --version "${RSIGN2_VERSION}" --no-confirm; \
    cargo binstall --locked wasm-pack --version "${WASMPACK_VERSION}" --no-confirm; \
    cargo binstall --locked wasmtime-cli --version "${WASMTIME_VERSION}" --no-confirm;

# nosonar(docker:S8431) - tag required for Renovate version tracking; digest provides immutability
FROM docker.io/library/rust:1.94.0@sha256:7e322aa1b876cbb977e0df46812af6c4e8be2efbfb2ce3712c28a93ba2968726 AS base
ARG RELEASE_VERSION="dev"
ARG VCS_REF="unknown"
ARG BUILD_DATE="unknown"
ENV CI_RUST_IMAGE_VERSION=${RELEASE_VERSION}
LABEL org.opencontainers.image.version=${RELEASE_VERSION} \
      org.opencontainers.image.source="https://github.com/jerus-org/ci-container" \
      org.opencontainers.image.revision=${VCS_REF} \
      org.opencontainers.image.created=${BUILD_DATE}
# Tool versions — duplicated from binaries stage so they are available at
# runtime in all downstream stages (final, wasi, test). Renovate keeps both
# sets in sync via the datasource comments.
# renovate: datasource=crate depName=cargo-binstall packageName=cargo-binstall versioning=semver-coerced
ENV CARGO_BINSTALL_VERSION=1.17.7
# renovate: datasource=crate depName=cargo-audit packageName=cargo-audit versioning=semver-coerced
ENV CARGO_AUDIT_VERSION=0.22.1
# renovate: datasource=crate depName=cargo-expand packageName=cargo-expand versioning=semver-coerced
ENV CARGO_EXPAND_VERSION=1.0.95
# renovate: datasource=crate depName=cargo-fuzz packageName=cargo-fuzz versioning=semver-coerced
ENV CARGO_FUZZ_VERSION=0.13.1
# renovate: datasource=crate depName=cargo-llvm-cov packageName=cargo-llvm-cov versioning=semver-coerced
ENV CARGO_LLVM_COV_VERSION=0.8.4
# renovate: datasource=crate depName=cargo-nextest packageName=cargo-nextest versioning=semver-coerced
ENV CARGO_NEXTEST_VERSION=0.9.130
# renovate: datasource=crate depName=cargo-release packageName=cargo-release versioning=semver-coerced
ENV CARGO_RELEASE_VERSION=1.1.1
# renovate: datasource=crate depName=circleci-junit-fix packageName=circleci-junit-fix versioning=semver-coerced
ENV CIRCLECI_JUNIT_FIX_VERSION=0.2.3
# renovate: datasource=crate depName=cull-gmail packageName=cull-gmail versioning=semver-coerced
ENV CULL_GMAIL_VERSION=0.1.7
# renovate: datasource=crate depName=gen-changelog packageName=gen-changelog versioning=semver-coerced
ENV GEN_CHANGELOG_VERSION=0.1.7
# renovate: datasource=crate depName=gen-orb-mcp packageName=gen-orb-mcp versioning=semver-coerced
ENV GEN_ORB_MCP_VERSION=0.1.1
# renovate: datasource=crate depName=kdeets packageName=kdeets versioning=semver-coerced
ENV KDEETS_VERSION=0.1.29
# renovate: datasource=crate depName=nextsv packageName=nextsv versioning=semver-coerced
ENV NEXTSV_VERSION=0.19.29
# renovate: datasource=crate depName=pcu packageName=pcu versioning=semver-coerced
ENV PCU_VERSION=0.6.13
# renovate: datasource=crate depName=rsign2 packageName=rsign2 versioning=semver-coerced
ENV RSIGN2_VERSION=0.6.6
# renovate: datasource=crate depName=wasm-pack packageName=wasm-pack versioning=semver-coerced
ENV WASMPACK_VERSION=0.14.0
# renovate: datasource=crate depName=wasmtime-cli packageName=wasmtime-cli versioning=semver-coerced
ENV WASMTIME_VERSION=42.0.1
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
    adduser \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && adduser circleci
COPY --from=binaries $CARGO_HOME/bin/cull-gmail \
    $CARGO_HOME/bin/pcu $CARGO_HOME/bin/
USER circleci
WORKDIR /home/circleci/project

FROM base AS final
USER root
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
    build-essential \
    gpg \
    gpg-agent \
    libssl-dev \
    llvm \
    openssh-client \
    pkg-config \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
COPY --from=binaries $CARGO_HOME/bin/cargo-release \
    $CARGO_HOME/bin/cargo-audit \
    $CARGO_HOME/bin/cargo-expand \
    $CARGO_HOME/bin/cargo-fuzz \
    $CARGO_HOME/bin/cargo-llvm-cov \
    $CARGO_HOME/bin/cargo-nextest \
    $CARGO_HOME/bin/gen-changelog \
    $CARGO_HOME/bin/gen-orb-mcp \
    $CARGO_HOME/bin/kdeets \
    $CARGO_HOME/bin/nextsv \
    $CARGO_HOME/bin/pcu \
    $CARGO_HOME/bin/rsign \
    $CARGO_HOME/bin/circleci-junit-fix $CARGO_HOME/bin/

# Install standard toolchains with all components
RUN rustup component add clippy rustfmt llvm-tools; \
    rustup toolchain install stable --component clippy --component rustfmt; \
    rustup toolchain install nightly --component clippy --component rustfmt --component miri --component rust-src; \
    rustup toolchain install beta --component clippy --component rustfmt

# Calculate and install rolling 6-month Rust versions
#
# Strategy:
#   - Detect current stable version from rustc
#   - Calculate oldest version in 6-month window (current minor - 4)
#   - Install all versions from oldest to current
#
# Rust releases every ~6 weeks, so 6 months ≈ 4 releases back
# We install versions: (current - 4) through (current - 1)
# Current stable is already installed from base image
#
# The calculated versions are saved to ROLLING_RUST_VERSIONS env var
# for runtime detection by the select_rust_version command
COPY calculate-rolling-versions.sh /tmp/
RUN chmod +x /tmp/calculate-rolling-versions.sh && \
    /tmp/calculate-rolling-versions.sh && \
    rm /tmp/calculate-rolling-versions.sh

USER circleci
WORKDIR /home/circleci/project

FROM final AS wasi
USER root
COPY --from=binaries $CARGO_HOME/bin/wasmtime \
    $CARGO_HOME/bin/wasm-pack $CARGO_HOME/bin/

# Install WASI targets for all toolchains
# Note: wasm32-wasip1 is the modern target name (Rust 1.78+)
#       wasm32-wasi is the legacy target name (older Rust versions)
COPY install-wasi-targets.sh /tmp/
RUN chmod +x /tmp/install-wasi-targets.sh && \
    /tmp/install-wasi-targets.sh && \
    rm /tmp/install-wasi-targets.sh

USER circleci
WORKDIR /home/circleci/project

FROM wasi AS test
USER root
WORKDIR /project
COPY test.sh .
RUN chmod a+x test.sh
USER circleci
ENTRYPOINT ["/project/test.sh"]
