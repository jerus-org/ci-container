#!/bin/bash
# test-rolling.sh - Validation script for rolling 6-month multi-version image
#
# This script validates that all expected Rust versions are installed
# and all tools are available in the rolling image.

set -e

echo "========= Rolling Image Validation ========="
echo ""

# Load rolling versions from file or environment
if [[ -f /etc/rolling-rust-versions ]]; then
    ROLLING_RUST_VERSIONS=$(cat /etc/rolling-rust-versions)
    export ROLLING_RUST_VERSIONS
elif [[ -z "$ROLLING_RUST_VERSIONS" ]]; then
    echo "WARNING: No rolling versions configured" >&2
    ROLLING_RUST_VERSIONS=""
fi

echo "---------rust versions-------------------"
echo "Checking standard toolchains..."
rustup show | grep stable || { echo "ERROR: stable toolchain not found" >&2; exit 1; }
rustup show | grep beta || { echo "ERROR: beta toolchain not found" >&2; exit 1; }
rustup show | grep nightly || { echo "ERROR: nightly toolchain not found" >&2; exit 1; }

echo ""
echo "Checking rolling versions..."
if [[ -n "$ROLLING_RUST_VERSIONS" ]]; then
    echo "Expected versions: $ROLLING_RUST_VERSIONS"
    # shellcheck disable=SC2086
    for version in $ROLLING_RUST_VERSIONS; do
        if rustup toolchain list | grep -q "^${version}"; then
            echo "  [OK] Rust ${version} installed"
        else
            echo "  [FAIL] Rust ${version} NOT installed" >&2
            exit 1
        fi
    done
else
    echo "WARNING: ROLLING_RUST_VERSIONS not set, skipping version check" >&2
fi

echo ""
echo "---------list all installed toolchains---"
rustup toolchain list

echo ""
echo "---------tools versions------------------"
cargo release --version
cargo audit --version
cargo llvm-cov --version
cargo nextest --version | sed '2,$s/^/  /'
cargo expand --version
cargo fuzz --version || echo "cargo-fuzz check skipped"
gen-orb-mcp --version
nextsv --version
pcu --version
circleci-junit-fix --version
wasm-pack --version
wasmtime --version

echo ""
echo "---------miri check----------------------"
# Verify miri is available on nightly
if cargo +nightly miri --version 2>/dev/null; then
    echo "  [OK] miri available on nightly"
else
    echo "  [WARN] miri not available on nightly"
fi

echo ""
echo "---------WASI targets--------------------"
echo "Checking WASI targets for each toolchain..."
for version in stable beta nightly; do
    if rustup target list --toolchain "$version" 2>/dev/null | grep -q "wasm32-wasi"; then
        echo "  [OK] $version has WASI target"
    else
        echo "  [WARN] $version may not have WASI target"
    fi
done

if [[ -n "$ROLLING_RUST_VERSIONS" ]]; then
    # shellcheck disable=SC2086
    for version in $ROLLING_RUST_VERSIONS; do
        if rustup target list --toolchain "$version" 2>/dev/null | grep -q "wasm32-wasi"; then
            echo "  [OK] $version has WASI target"
        else
            echo "  [WARN] $version may not have WASI target" >&2
        fi
    done
fi

echo ""
echo "---------binaries------------------------"
ls -l /usr/local/cargo/bin/*

echo ""
echo "---------project directory---------------"
pwd
ls -l
ls -l /home/circleci/
ls -l /home/circleci/project

echo ""
echo "---------version fallback test-----------"
# Test that we can switch between versions
echo "Testing version switching..."
# shellcheck disable=SC2086
for version in stable $ROLLING_RUST_VERSIONS; do
    if cargo "+${version}" --version >/dev/null 2>&1; then
        echo "  [OK] cargo +${version} works"
    else
        echo "  [FAIL] cargo +${version} failed" >&2
        exit 1
    fi
done

echo ""
echo "---------oldest version detection--------"
# Test the version detection that select_rust_version will use
OLDEST_VERSION=$(rustup toolchain list | grep -E '^[0-9]+\.[0-9]+' | sort -V | head -1 | sed 's/-.*//')
echo "Oldest available version: $OLDEST_VERSION"

echo ""
echo "========= All Checks Passed ========="
echo ""
VERSION_COUNT=$(echo "$ROLLING_RUST_VERSIONS" | wc -w)
echo "Rolling image contains ${VERSION_COUNT} version(s):"
echo "  $ROLLING_RUST_VERSIONS"
echo "  + stable, beta, nightly"
echo ""
echo "Oldest version (for MSRV fallback): $OLDEST_VERSION"
echo ""
echo "---------end-----------------------------"
