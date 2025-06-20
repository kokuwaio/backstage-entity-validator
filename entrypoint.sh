#!/usr/bin/env bash
set -eu;

echo "Validate: ${PLUGIN_FILES:-catalog-info.yaml}"
echo

# ignore spaces escaping to enable multiple parameter
# shellcheck disable=SC2086
validate-entity ${PLUGIN_FILES:-catalog-info.yaml}
