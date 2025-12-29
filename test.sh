#!/bin/bash

set -e

echo "---------rust versions-------------------"
rustup show | grep stable
rustup show | grep beta
rustup show | grep nightly
rustup show | grep "${MIN_RUST}"
rustup show | grep -m 1 "${RUST_VERSION}"
echo "---------tools versions------------------"
cargo release --version
cargo audit --version
cargo llvm-cov --version
cargo nextest --version | sed '2,$s/^/  /'
cargo expand --version
nextsv --version
pcu --version
circleci-junit-fix --version
wasm-pack --version
# wasmtime requires Rust 1.90+ (MSRV)
# Compare MIN_RUST version to determine if wasmtime should be available
WASMTIME_MSRV="1.90"
if printf '%s\n%s\n' "$WASMTIME_MSRV" "$MIN_RUST" | sort -V | head -n1 | grep -q "^$WASMTIME_MSRV$"; then
    # MIN_RUST >= 1.90, wasmtime must be available
    wasmtime --version
else
    echo "wasmtime check skipped (requires Rust >= $WASMTIME_MSRV, container has $MIN_RUST)"
fi
echo "---------binaries------------------------"
ls -l /usr/local/cargo/bin/*
echo "---------project directory---------------"
pwd
ls -l
ls -l /home/circleci/
ls -l /home/circleci/project
echo "---------end-----------------------------"