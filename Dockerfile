FROM rust:1.83.0-slim AS binaries
# renovate: datasource=crate depName=wasmtime-cli packageName=wasmtime-cli versioning=semver-coerced
ENV WASMTIME_VERSION=28.0.0
# renovate: datasource=crate depName=wasmpack packageName=wasmpack versioning=semver-coerced
ENV WASMPACK_VERSION=0.13.1
# renovate: datasource=crate depName=cargo-release packageName=cargo-release versioning=semver-coerced
ENV CARGO_RELEASE_VERSION=0.25.15
# renovate: datasource=crate depName=cargo-audit packageName=cargo-audit versioning=semver-coerced
ENV CARGO_AUDIT_VERSION=0.21.0
# renovate: datasource=crate depName=cargo-llvm-cov packageName=cargo-llvm-cov versioning=semver-coerced
ENV CARGO_LLVM_COV_VERSION=0.6.15
# renovate: datasource=crate depName=nextsv packageName=nextsv versioning=semver-coerced
ENV NEXTSV_VERSION=0.19.2
# renovate: datasource=crate depName=pcu packageName=pcu versioning=semver-coerced
ENV PCU_VERSION=0.4.23
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
    pkg-config \
    libssl-dev \
    build-essential \
    curl \
    ; \
    rm -rf /var/lib/apt/lists/*;
RUN \
    curl -L \
    --proto '=https' \
    --tlsv1.2 \
    -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash
RUN \
    cargo binstall wasmtime-cli --version ${WASMTIME_VERSION} --no-confirm; \
    cargo binstall wasm-pack --version ${WASMPACK_VERSION} --no-confirm; \
    cargo binstall cargo-release --version ${CARGO_RELEASE_VERSION} --no-confirm; \
    cargo binstall cargo-audit --version ${CARGO_AUDIT_VERSION} --no-confirm; \
    cargo binstall cargo-llvm-cov --version ${CARGO_LLVM_COV_VERSION} --no-confirm; \
    cargo binstall nextsv --version ${NEXTSV_VERSION} --no-confirm; \
    cargo binstall pcu --version ${PCU_VERSION} --no-confirm; \
    cargo binstall cargo-nextest --no-confirm; \ 
    cargo binstall --locked --version 1.0.95 cargo-expand --no-confirm; \
    cargo binstall circleci-junit-fix --locked --version 0.2.0 --no-confirm;

FROM rust:1.83.0-slim AS base
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
    git \
    curl \
    jq \
    unzip \
    ; \
    rm -rf /var/lib/apt/lists/*;
RUN adduser circleci
USER circleci
WORKDIR /home/circleci/project

FROM base AS final
USER root
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
    pkg-config \
    libssl-dev \
    build-essential \
    gpg \
    gpg-agent \
    openssh-client \
    ; \
    rm -rf /var/lib/apt/lists/*;
COPY --from=binaries $CARGO_HOME/bin/cargo-release \
    $CARGO_HOME/bin/cargo-audit \
    $CARGO_HOME/bin/cargo-llvm-cov \
    $CARGO_HOME/bin/nextsv \
    $CARGO_HOME/bin/pcu \
    $CARGO_HOME/bin/cargo-nextest \
    $CARGO_HOME/bin/cargo-expand \
    $CARGO_HOME/bin/circleci-junit-fix $CARGO_HOME/bin/
ARG MIN_RUST_VERSION=1.65
RUN rustup component add clippy rustfmt llvm-tools; \
    rustup toolchain install stable --component clippy rustfmt; \
    rustup toolchain install nightly --component clippy rustfmt; \
    rustup toolchain install beta --component clippy rustfmt; \
    rustup toolchain install $MIN_RUST_VERSION --component clippy rustfmt;  
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
    rustup target add $MIN_RUST_WASI --toolchain $MIN_RUST_VERSION;
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
