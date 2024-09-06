FROM rust:1.81.0-slim as binaries
# renovate: datasource=crate depName=cargo-release packageName=cargo-release 
ENV CARGO_RELEASE_VERSION=0.25.10
# renovate: datasource=crate depName=cargo-audit packageName=cargo-audit 
ENV CARGO_AUDIT_VERSION=0.20.1
# renovate: datasource=crate depName=nextsv packageName=nextsv 
ENV NEXTSV_VERSION=0.8.14
# renovate: datasource=crate depName=pcu packageName=pcu 
ENV PCU_VERSION=0.4.2
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
RUN cargo binstall cargo-release --version ${CARGO_RELEASE_VERSION} --no-confirm; \
    cargo binstall cargo-audit --version ${CARGO_AUDIT_VERSION} --no-confirm; \
    cargo binstall nextsv --version ${NEXTSV_VERSION} --no-confirm; \
    cargo binstall pcu --version ${PCU_VERSION} --no-confirm; 

FROM rust:1.81.0-slim as base
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
    git \
    curl \
    jq \
    ; \
    rm -rf /var/lib/apt/lists/*;

FROM rust:1.81.0-slim as final
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
    git \
    pkg-config \
    libssl-dev \
    build-essential \
    gpg \
    gpg-agent \
    openssh-client \
    curl \
    jq \
    ; \
    rm -rf /var/lib/apt/lists/*;
COPY --from=binaries $CARGO_HOME/bin/cargo-release $CARGO_HOME/bin/
COPY --from=binaries $CARGO_HOME/bin/cargo-audit $CARGO_HOME/bin/
COPY --from=binaries $CARGO_HOME/bin/nextsv $CARGO_HOME/bin/
COPY --from=binaries $CARGO_HOME/bin/pcu $CARGO_HOME/bin/

ARG MIN_RUST_VERSION=1.56
RUN rustup component add clippy rustfmt; \
    rustup toolchain install stable --component clippy rustfmt; \
    rustup toolchain install nightly --component clippy rustfmt; \
    rustup toolchain install beta --component clippy rustfmt; \
    rustup toolchain install $MIN_RUST_VERSION --component clippy rustfmt;  

FROM final AS test
WORKDIR /project
COPY test.sh test.sh
RUN chmod a+x test.sh
ARG MIN_RUST_VERSION=1.56
ENV MIN_RUST=$MIN_RUST_VERSION
ENTRYPOINT [ "/project/test.sh" ]
