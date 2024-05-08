FROM rust:1.77.2-slim as binaries
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
    pkg-config \
    libssl-dev \
    build-essential \
    ; \
    rm -rf /var/lib/apt/lists/*;
RUN cargo install cargo-release; \
    cargo install nextsv;

FROM rust:1.77.2-slim as final
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
    git \
    pkg-config \
    libssl-dev \
    build-essential \
    gpg \
    ; \
    rm -rf /var/lib/apt/lists/*;
COPY --from=binaries $CARGO_HOME/bin/cargo-release $CARGO_HOME/bin/
COPY --from=binaries $CARGO_HOME/bin/nextsv $CARGO_HOME/bin/

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
