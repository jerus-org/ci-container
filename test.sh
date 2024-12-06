#!/bin/bash

set -e

rustup show | grep stable
rustup show | grep beta
rustup show | grep nightly
rustup show | grep "${MIN_RUST}"
rustup show | grep -m 1 "${RUST_VERSION}"
echo "-----------------------------------------"
cargo release --version
echo "-----------------------------------------"
cargo audit --version
cargo llvm-cov --version
cargo nextest --version | sed '2,$s/^/\t/'
cargo expand --version
nextsv --version
pcu --version
circleci-junit-fix --version
wasm-pack --version
wasmtime --version
echo "-----------------------------------------"
ls -l /usr/local/cargo/bin/*
echo "-----------------------------------------"
