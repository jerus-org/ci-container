#!/bin/bash
# calculate-rolling-versions.sh
#
# Calculates and installs Rust versions for the 6-month rolling window.
# This script:
#   1. Detects the current stable Rust version
#   2. Calculates the oldest version in the 6-month window (4 releases back)
#   3. Installs all versions from oldest to (current - 1)
#   4. Saves the version list to /etc/rolling-rust-versions for runtime use

set -euo pipefail

echo "=== Calculating Rolling Rust Versions ==="

# Get current stable version
CURRENT_VERSION=$(rustc --version | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | head -1)
CURRENT_MAJOR=$(echo "$CURRENT_VERSION" | cut -d. -f1)
CURRENT_MINOR=$(echo "$CURRENT_VERSION" | cut -d. -f2)

echo "Current stable Rust: ${CURRENT_MAJOR}.${CURRENT_MINOR}"

# Calculate oldest version in 6-month window
# Rust releases every ~6 weeks, 6 months ≈ 4 releases
RELEASES_IN_WINDOW=4
OLDEST_MINOR=$((CURRENT_MINOR - RELEASES_IN_WINDOW))

# Ensure we don't go below a reasonable minimum (1.70 is a safe floor)
MIN_SUPPORTED_MINOR=70
if [ "$OLDEST_MINOR" -lt "$MIN_SUPPORTED_MINOR" ]; then
    OLDEST_MINOR=$MIN_SUPPORTED_MINOR
fi

echo "Oldest version in 6-month window: ${CURRENT_MAJOR}.${OLDEST_MINOR}"
echo ""

# Build list of versions to install
VERSIONS_TO_INSTALL=""
INSTALLED_VERSIONS=""

for minor in $(seq "$OLDEST_MINOR" "$((CURRENT_MINOR - 1))"); do
    version="${CURRENT_MAJOR}.${minor}"
    VERSIONS_TO_INSTALL="${VERSIONS_TO_INSTALL} ${version}"
done

echo "Versions to install: ${VERSIONS_TO_INSTALL}"
echo ""

# Install each version
for version in $VERSIONS_TO_INSTALL; do
    echo "Installing Rust ${version}..."
    if rustup toolchain install "${version}" --component clippy --component rustfmt 2>/dev/null; then
        echo "  [OK] Rust ${version} installed"
        INSTALLED_VERSIONS="${INSTALLED_VERSIONS} ${version}"
    else
        echo "  [SKIP] Rust ${version} not available (may not exist or be too old)"
    fi
done

# Add current stable to the list (already installed)
INSTALLED_VERSIONS="${INSTALLED_VERSIONS} ${CURRENT_MAJOR}.${CURRENT_MINOR}"

# Trim leading/trailing whitespace
INSTALLED_VERSIONS=$(echo "$INSTALLED_VERSIONS" | xargs)

echo ""
echo "=== Rolling Versions Summary ==="
echo "Installed versions: ${INSTALLED_VERSIONS}"
echo "Total versions: $(echo "$INSTALLED_VERSIONS" | wc -w)"

# Save versions for runtime detection
echo "$INSTALLED_VERSIONS" > /etc/rolling-rust-versions

# Also set as environment variable in profile for interactive shells
echo "export ROLLING_RUST_VERSIONS=\"${INSTALLED_VERSIONS}\"" >> /etc/profile.d/rolling-rust.sh

echo ""
echo "Versions saved to /etc/rolling-rust-versions"
echo "Environment variable ROLLING_RUST_VERSIONS will be available at runtime"

# Show all installed toolchains
echo ""
echo "=== All Installed Toolchains ==="
rustup toolchain list
