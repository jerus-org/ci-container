FROM cimg/rust:1.63 as binaries
RUN cargo install cargo-release
RUN cargo install nextsv

FROM cimg/rust:1.63 as base
COPY --from=binaries /home/circleci/.cargo/bin/cargo-release /home/circleci/.cargo/bin/
COPY --from=binaries /home/circleci/.cargo/bin/nextsv /home/circleci/.cargo/bin/
ARG MIN_RUST_VERSION=1.56.0
RUN rustup update stable
RUN rustup update nightly
RUN rustup update beta
RUN rustup update $MIN_RUST_VERSION

FROM base AS test
COPY test.sh test.sh
RUN sudo chmod a+x test.sh
ENV MIN_RUST=$MIN_RUST_VERSION
ENTRYPOINT [ "/home/circleci/project/test.sh" ]

FROM base as final 
