FROM rust:1.92.0-slim-trixie AS binaries
# renovate: datasource=crate depName=wasmtime-cli packageName=wasmtime-cli versioning=semver-coerced
ENV WASMTIME_VERSION=36.0.2
# renovate: datasource=crate depName=wasm-pack packageName=wasm-pack versioning=semver-coerced
ENV WASMPACK_VERSION=0.13.1
# renovate: datasource=crate depName=cargo-release packageName=cargo-release versioning=semver-coerced
ENV CARGO_RELEASE_VERSION=0.25.18
# renovate: datasource=crate depName=cargo-audit packageName=cargo-audit versioning=semver-coerced
ENV CARGO_AUDIT_VERSION=0.22.0
# renovate: datasource=crate depName=cargo-llvm-cov packageName=cargo-llvm-cov versioning=semver-coerced
ENV CARGO_LLVM_COV_VERSION=0.6.19
# renovate: datasource=crate depName=circleci_junit_fix packageName=circleci_junit_fix versioning=semver-coerced
ENV CIRCLECI_JUNIT_FIX_VERSION=0.2.3
# renovate: datasource=crate depName=cull-gmail packageName=cull-gmail versioning=semver-coerced
ENV CULL_GMAIL_VERSION=0.0.15
# renovate: datasource=crate depName=gen-changelog packageName=gen-changelog versioning=semver-coerced
ENV GEN_CHANGELOG_VERSION=0.1.3
# renovate: datasource=crate depName=nextsv packageName=nextsv versioning=semver-coerced
ENV NEXTSV_VERSION=0.19.24
# renovate: datasource=crate depName=pcu packageName=pcu versioning=semver-coerced
ENV PCU_VERSION=0.6.0
# renovate: datasource=crate depName=cargo-fuzz packageName=cargo-fuzz versioning=semver-coerced
ENV CARGO_FUZZ_VERSION=0.12.0
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN set -eux; 
RUN apt-get update; \
    apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    libssl-dev \
    pkg-config \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN \
    curl \
    --proto '=https' \
    --tlsv1.2 \
    -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash
RUN \
    cargo binstall cargo-audit --version ${CARGO_AUDIT_VERSION} --no-confirm; \
    cargo binstall --locked --version 1.0.95 cargo-expand --no-confirm; \
    cargo binstall cargo-fuzz --version ${CARGO_FUZZ_VERSION} --no-confirm; \
    cargo binstall cargo-llvm-cov --version ${CARGO_LLVM_COV_VERSION} --no-confirm; \
    cargo binstall cargo-nextest --no-confirm; \
    cargo binstall cargo-release --version ${CARGO_RELEASE_VERSION} --no-confirm; \
    cargo binstall circleci-junit-fix --locked --version ${CIRCLECI_JUNIT_FIX_VERSION} --no-confirm; \
    cargo binstall cull-gmail --version ${CULL_GMAIL_VERSION} --no-confirm; \
    cargo binstall gen-changelog --version ${GEN_CHANGELOG_VERSION} --no-confirm; \
    cargo binstall nextsv --version ${NEXTSV_VERSION} --no-confirm; \
    cargo binstall pcu --version ${PCU_VERSION} --no-confirm; \
    cargo binstall wasm-pack --version ${WASMPACK_VERSION} --no-confirm; \
    cargo binstall wasmtime-cli --version ${WASMTIME_VERSION} --no-confirm; 

FROM rust:1.92.0-slim-trixie AS base
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
    adduser \
    curl \
    git \
    jq \
    unzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && adduser circleci
COPY --from=binaries $CARGO_HOME/bin/cull-gmail $CARGO_HOME/bin/
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
    $CARGO_HOME/bin/nextsv \
    $CARGO_HOME/bin/pcu \
    $CARGO_HOME/bin/circleci-junit-fix $CARGO_HOME/bin/
ARG MIN_RUST_VERSION=1.65
RUN rustup component add clippy rustfmt llvm-tools; \
    rustup toolchain install stable --component clippy --component rustfmt; \
    rustup toolchain install nightly --component clippy --component rustfmt --component miri --component rust-src; \
    rustup toolchain install beta --component clippy --component rustfmt; \
    rustup toolchain install "$MIN_RUST_VERSION" --component clippy --component rustfmt;  
USER circleci
WORKDIR /home/circleci/project

FROM final AS wasi
ARG MIN_RUST_VERSION=1.65
ARG MIN_RUST_WASI=wasm32-wasi
USER root
COPY --from=binaries $CARGO_HOME/bin/wasmtime \
    $CARGO_HOME/bin/wasm-pack $CARGO_HOME/bin/
RUN \
    rustup target add wasm32-wasip1; \
    rustup target add wasm32-wasip1 --toolchain stable; \
    rustup target add wasm32-wasip1 --toolchain nightly; \
    rustup target add wasm32-wasip1 --toolchain beta; \
    rustup target add "$MIN_RUST_WASI" --toolchain "$MIN_RUST_VERSION";
USER circleci
WORKDIR /home/circleci/project

FROM wasi AS test
USER root
WORKDIR /project
COPY test.sh test.sh
RUN chmod a+x test.sh
ARG MIN_RUST_VERSION=1.56
ENV MIN_RUST=$MIN_RUST_VERSION
USER circleci
ENTRYPOINT [ "/project/test.sh" ]
