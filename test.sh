#!/bin/bash
# test.sh - Validation script for rolling 6-month multi-version image
#
# Validates that all expected Rust versions are installed, all tools are
# available, and each pinned tool binary matches its expected version.

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
echo "---------version fallback test-----------"
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
OLDEST_VERSION=$(rustup toolchain list | grep -E '^[0-9]+\.[0-9]+' | sort -V | head -1 | sed 's/-.*//')
echo "Oldest available version: $OLDEST_VERSION"

echo ""
echo "=== Binary version validation ==="
FAILED=0

check_version() {
    local bin="$1"
    local expected="$2"
    local flag="${3:---version}"
    if ! command -v "$bin" > /dev/null 2>&1; then
        echo "FAIL  $bin: not found in PATH"
        FAILED=1
        return
    fi
    # $flag may be multi-word (e.g. "llvm-cov --version") — word splitting is intentional
    # shellcheck disable=SC2086
    actual=$("$bin" $flag 2>&1 | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | head -1)
    if [[ "$actual" = "$expected" ]]; then
        echo "OK    $bin ${actual}"
    else
        echo "FAIL  $bin: expected ${expected}, got '${actual}'"
        FAILED=1
    fi
}

check_version cargo-binstall     "${CARGO_BINSTALL_VERSION}"
check_version cargo-audit        "${CARGO_AUDIT_VERSION}"
check_version cargo-expand       "${CARGO_EXPAND_VERSION}"
check_version cargo-fuzz         "${CARGO_FUZZ_VERSION}"
# cargo-llvm-cov and cargo-release are cargo plugins; invoke via the subcommand name
check_version cargo-llvm-cov     "${CARGO_LLVM_COV_VERSION}" "llvm-cov --version"
check_version cargo-nextest      "${CARGO_NEXTEST_VERSION}"
check_version cargo-release      "${CARGO_RELEASE_VERSION}"  "release --version"
# circleci-junit-fix has no --version flag (reads stdin); check presence only
if command -v circleci-junit-fix > /dev/null 2>&1; then
    echo "OK    circleci-junit-fix (pinned: ${CIRCLECI_JUNIT_FIX_VERSION})"
else
    echo "FAIL  circleci-junit-fix: not found in PATH"
    FAILED=1
fi
check_version cull-gmail         "${CULL_GMAIL_VERSION}"
check_version gen-changelog      "${GEN_CHANGELOG_VERSION}"
check_version gen-orb-mcp        "${GEN_ORB_MCP_VERSION}"
check_version kdeets             "${KDEETS_VERSION}"
check_version nextsv             "${NEXTSV_VERSION}"
check_version pcu                "${PCU_VERSION}"
check_version rsign              "${RSIGN2_VERSION}"
check_version wasm-pack          "${WASMPACK_VERSION}"
check_version wasmtime           "${WASMTIME_VERSION}"

if [[ "${CI_RUST_IMAGE_VERSION:-dev}" = "dev" ]]; then
    echo "INFO  CI_RUST_IMAGE_VERSION not set (test/local build)"
else
    echo "OK    CI_RUST_IMAGE_VERSION=${CI_RUST_IMAGE_VERSION}"
fi

[[ "$FAILED" = "0" ]] || { echo ""; echo "FAILED: binary version validation"; exit 1; }
echo "=== All binary versions validated ==="

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
