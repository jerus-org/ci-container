#!/bin/bash
# install-wasi-targets.sh
#
# Installs WASI targets for all toolchains in the rolling image.
# Uses the correct target name based on Rust version:
#   - wasm32-wasip1 for Rust 1.78+
#   - wasm32-wasi for older Rust versions

set -euo pipefail

echo "=== Installing WASI Targets ==="

# Install for standard toolchains (always use modern target name)
echo "Installing WASI targets for standard toolchains..."
for toolchain in stable beta nightly; do
    echo "  ${toolchain}: wasm32-wasip1"
    rustup target add wasm32-wasip1 --toolchain "${toolchain}" 2>/dev/null || \
        echo "    [WARN] Failed to add wasm32-wasip1 for ${toolchain}" >&2
done

# Read installed rolling versions
if [[ -f /etc/rolling-rust-versions ]]; then
    ROLLING_VERSIONS=$(cat /etc/rolling-rust-versions)
else
    echo "[WARN] /etc/rolling-rust-versions not found, skipping version-specific WASI targets" >&2
    exit 0
fi

echo ""
echo "Installing WASI targets for rolling versions..."

# shellcheck disable=SC2086
for version in $ROLLING_VERSIONS; do
    # Extract major.minor for comparison
    major=$(echo "$version" | cut -d. -f1)
    minor=$(echo "$version" | cut -d. -f2)

    # Determine correct WASI target name
    # wasm32-wasip1 was introduced in Rust 1.78
    if [[ "$major" -gt 1 ]] || { [[ "$major" -eq 1 ]] && [[ "$minor" -ge 78 ]]; }; then
        target="wasm32-wasip1"
    else
        target="wasm32-wasi"
    fi

    echo "  ${version}: ${target}"
    rustup target add "${target}" --toolchain "${version}" 2>/dev/null || \
        echo "    [WARN] Failed to add ${target} for ${version}" >&2
done

echo ""
echo "=== WASI Targets Installation Complete ==="
