#!/bin/sh

set +ex

rustup show | grep stable
rustup show | grep beta
rustup show | grep nightly
rustup show | grep "${MIN_RUST}"
rustup show | grep "${RUST_VERSION}"
cargo release --version
nextsv --version
