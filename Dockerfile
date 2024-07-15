FROM rust:1.79.0-slim as binaries
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
RUN cargo binstall cargo-release --version 0.25.8 --no-confirm; \
    cargo binstall cargo-audit --version 0.20.0 --no-confirm; \
    cargo binstall nextsv --version 0.8.5 --no-confirm; \
    cargo binstall pcu --version 0.1.10 --no-confirm; 

FROM rust:1.79.0-slim as base
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
    git \
    curl \
    jq \
    ; \
    rm -rf /var/lib/apt/lists/*;

FROM rust:1.79.0-slim as final
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
