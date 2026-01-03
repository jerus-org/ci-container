#!/usr/bin/env bash
#
# Migration script for circleci-toolkit v4.0.0
#
# This script updates CircleCI config files to be compatible with
# circleci-toolkit v4.0.0, which requires underscores instead of
# hyphens in parameter names.
#
# Usage:
#   ./migrate-toolkit-v4.sh [--dry-run] [--path /path/to/repo]
#
# Options:
#   --dry-run    Show what would be changed without making changes
#   --path       Path to repository (default: current directory)
#
# The script will:
#   1. Update the toolkit orb version to 4.0.0
#   2. Convert hyphenated parameter names to use underscores
#   3. Update all references to those parameters
#

set -euo pipefail

# Configuration
DRY_RUN=false
REPO_PATH="."
CONFIG_FILE=".circleci/config.yml"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Parameter mappings (hyphen -> underscore)
declare -A PARAM_MAPPINGS=(
    ["min-rust-version"]="min_rust_version"
    ["validation-flag"]="validation_flag"
    ["success-flag"]="success_flag"
    ["release-flag"]="release_flag"
    ["rust-min-version"]="rust_min_version"
)

usage() {
    echo "Usage: $0 [--dry-run] [--path /path/to/repo]"
    echo ""
    echo "Options:"
    echo "  --dry-run    Show what would be changed without making changes"
    echo "  --path       Path to repository (default: current directory)"
    echo ""
    echo "This script migrates CircleCI config to toolkit v4.0.0"
    exit 1
}

log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --dry-run)
            DRY_RUN=true
            shift
            ;;
        --path)
            REPO_PATH="$2"
            shift 2
            ;;
        --help|-h)
            usage
            ;;
        *)
            log_error "Unknown option: $1"
            usage
            ;;
    esac
done

# Validate config file exists
FULL_CONFIG_PATH="${REPO_PATH}/${CONFIG_FILE}"
if [[ ! -f "$FULL_CONFIG_PATH" ]]; then
    log_error "Config file not found: $FULL_CONFIG_PATH"
    exit 1
fi

log_info "Processing: $FULL_CONFIG_PATH"
if [[ "$DRY_RUN" == "true" ]]; then
    log_warn "DRY RUN MODE - No changes will be made"
fi

# Create backup
if [[ "$DRY_RUN" == "false" ]]; then
    cp "$FULL_CONFIG_PATH" "${FULL_CONFIG_PATH}.backup"
    log_info "Backup created: ${FULL_CONFIG_PATH}.backup"
fi

# Track changes
CHANGES_MADE=0

# Function to perform sed replacement
do_replace() {
    local pattern="$1"
    local replacement="$2"
    local description="$3"

    if grep -q "$pattern" "$FULL_CONFIG_PATH"; then
        if [[ "$DRY_RUN" == "true" ]]; then
            log_info "[DRY-RUN] Would replace: $description"
            grep -n "$pattern" "$FULL_CONFIG_PATH" | head -5
        else
            sed -i "s|$pattern|$replacement|g" "$FULL_CONFIG_PATH"
            log_info "Replaced: $description"
        fi
        ((CHANGES_MADE++)) || true
    fi
}

# Step 1: Update toolkit version
log_info "Step 1: Updating toolkit orb version..."
do_replace \
    "circleci-toolkit@[0-9]\+\.[0-9]\+\.[0-9]\+" \
    "circleci-toolkit@4.0.0" \
    "toolkit version -> 4.0.0"

# Step 2: Convert parameter definitions and references
log_info "Step 2: Converting parameter names (hyphen -> underscore)..."

for old_param in "${!PARAM_MAPPINGS[@]}"; do
    new_param="${PARAM_MAPPINGS[$old_param]}"

    # Parameter definition (at start of line or after whitespace)
    do_replace \
        "^\([[:space:]]*\)${old_param}:" \
        "\1${new_param}:" \
        "parameter definition: ${old_param} -> ${new_param}"

    # Parameter references in pipeline.parameters
    do_replace \
        "pipeline\.parameters\.${old_param}" \
        "pipeline.parameters.${new_param}" \
        "pipeline reference: ${old_param} -> ${new_param}"

    # Parameter references with << parameters. >>
    do_replace \
        "<< parameters\.${old_param} >>" \
        "<< parameters.${new_param} >>" \
        "parameters reference: ${old_param} -> ${new_param}"

    # Parameter references with <<parameters.X>> (no spaces, various contexts)
    # This catches inline uses like TAG=<<parameters.rust-min-version>>
    do_replace \
        "<<parameters\.${old_param}>>" \
        "<<parameters.${new_param}>>" \
        "parameters reference (no space): ${old_param} -> ${new_param}"

    # Parameter usage in job/command calls (indented parameter: value)
    do_replace \
        "^\([[:space:]]*\)${old_param}:" \
        "\1${new_param}:" \
        "parameter usage: ${old_param} -> ${new_param}"
done

# Step 3: Handle any remaining hyphenated parameter references that might have been missed
# This is a catch-all for edge cases
log_info "Step 3: Checking for any remaining hyphenated references..."

for old_param in "${!PARAM_MAPPINGS[@]}"; do
    new_param="${PARAM_MAPPINGS[$old_param]}"

    # Global replacement for any remaining occurrences
    if grep -q "${old_param}" "$FULL_CONFIG_PATH"; then
        if [[ "$DRY_RUN" == "true" ]]; then
            remaining=$(grep -c "${old_param}" "$FULL_CONFIG_PATH" || echo "0")
            if [[ "$remaining" -gt 0 ]]; then
                log_warn "[DRY-RUN] Found $remaining remaining occurrence(s) of '${old_param}':"
                grep -n "${old_param}" "$FULL_CONFIG_PATH" | head -10
            fi
        fi
    fi
done

# Step 4: Summary
echo ""
if [[ "$CHANGES_MADE" -gt 0 ]]; then
    if [[ "$DRY_RUN" == "true" ]]; then
        log_info "DRY RUN complete. $CHANGES_MADE change(s) would be made."
        log_info "Run without --dry-run to apply changes."
    else
        log_info "Migration complete. $CHANGES_MADE change(s) made."
        log_info "Backup saved to: ${FULL_CONFIG_PATH}.backup"
        log_info ""
        log_info "Next steps:"
        log_info "  1. Review the changes: git diff ${CONFIG_FILE}"
        log_info "  2. Validate config: circleci config validate ${CONFIG_FILE}"
        log_info "  3. Remove backup if satisfied: rm ${FULL_CONFIG_PATH}.backup"
    fi
else
    log_info "No changes needed - config appears to be already migrated."
fi
