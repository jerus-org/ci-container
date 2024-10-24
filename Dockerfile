FROM rust:1.82.0-slim as binaries
# renovate: datasource=crate depName=wasmtime-cli packageName=wasmtime-cli versioning=semver-coerced
ENV WASMTIME_VERSION=26.0.0
# renovate: datasource=crate depName=cargo-release packageName=cargo-release versioning=semver-coerced
ENV CARGO_RELEASE_VERSION=0.25.12
# renovate: datasource=crate depName=cargo-audit packageName=cargo-audit versioning=semver-coerced
ENV CARGO_AUDIT_VERSION=0.20.1
# renovate: datasource=crate depName=nextsv packageName=nextsv versioning=semver-coerced
ENV NEXTSV_VERSION=0.8.22
# renovate: datasource=crate depName=pcu packageName=pcu versioning=semver-coerced
ENV PCU_VERSION=0.4.12
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
    cargo binstall cargo-release --version ${CARGO_RELEASE_VERSION} --no-confirm; \
    cargo binstall cargo-audit --version ${CARGO_AUDIT_VERSION} --no-confirm; \
    cargo binstall nextsv --version ${NEXTSV_VERSION} --no-confirm; \
    cargo binstall pcu --version ${PCU_VERSION} --no-confirm; 

FROM rust:1.82.0-slim as base
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
    git \
    curl \
    jq \
    unzip \
    ; \
    rm -rf /var/lib/apt/lists/*;

FROM base as final
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
COPY --from=binaries $CARGO_HOME/bin/cargo-release $CARGO_HOME/bin/
COPY --from=binaries $CARGO_HOME/bin/cargo-audit $CARGO_HOME/bin/
COPY --from=binaries $CARGO_HOME/bin/nextsv $CARGO_HOME/bin/
COPY --from=binaries $CARGO_HOME/bin/pcu $CARGO_HOME/bin/
ARG MIN_RUST_VERSION=1.65
RUN rustup component add clippy rustfmt; \
    rustup toolchain install stable --component clippy rustfmt; \
    rustup toolchain install nightly --component clippy rustfmt; \
    rustup toolchain install beta --component clippy rustfmt; \
    rustup toolchain install $MIN_RUST_VERSION --component clippy rustfmt;  

FROM final as wasi
ARG MIN_RUST_VERSION=1.65
ARG MIN_RUST_WASI=wasm32-wasi
COPY --from=binaries $CARGO_HOME/bin/wasmtime $CARGO_HOME/bin/
RUN \
    rustup target add wasm32-wasip1; \
    rustup target add wasm32-wasip1 --toolchain stable; \
    rustup target add wasm32-wasip1 --toolchain nightly; \
    rustup target add wasm32-wasip1 --toolchain beta; \
    rustup target add $MIN_RUST_WASI --toolchain $MIN_RUST_VERSION;

FROM final AS test
WORKDIR /project
COPY test.sh test.sh
RUN chmod a+x test.sh
ARG MIN_RUST_VERSION=1.56
ENV MIN_RUST=$MIN_RUST_VERSION
ENTRYPOINT [ "/project/test.sh" ]
