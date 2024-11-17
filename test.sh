#!/bin/bash

set -e

rustup show | grep stable
rustup show | grep beta
rustup show | grep nightly
rustup show | grep "${MIN_RUST}"
rustup show | grep -m 1 "${RUST_VERSION}"
cargo release --version
nextsv --version
