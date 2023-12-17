FROM rust:latest as binaries
RUN cargo install cargo-release
RUN cargo install nextsv

FROM rust:latest as final
COPY --from=binaries $CARGO_HOME/bin/cargo-release $CARGO_HOME/bin/
COPY --from=binaries $CARGO_HOME/bin/nextsv $CARGO_HOME/bin/

ARG MIN_RUST_VERSION=1.56
RUN rustup toolchain install stable --component clippy rustfmt
RUN rustup toolchain install nightly --component clippy rustfmt
RUN rustup toolchain install beta --component clippy rustfmt
RUN rustup toolchain install $MIN_RUST_VERSION --component clippy rustfmt

FROM final AS test
WORKDIR /project
COPY test.sh test.sh
RUN chmod a+x test.sh
ARG MIN_RUST_VERSION=1.56
ENV MIN_RUST=$MIN_RUST_VERSION
ENTRYPOINT [ "/project/test.sh" ]
