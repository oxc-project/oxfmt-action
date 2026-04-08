#!/bin/bash

set -e -o pipefail

OXFMT_ARGS="--check"

if [ -n "$OXFMT_CONFIG" ]; then
    if [ ! -f "$OXFMT_CONFIG" ]; then
        echo "::error file={$OXFMT_CONFIG}::Config file not found: $OXFMT_CONFIG"
        exit 1
    fi
    OXFMT_ARGS="$OXFMT_ARGS --config $OXFMT_CONFIG"
fi

if [ -n "$OXFMT_IGNORE_PATH" ]; then
    OXFMT_ARGS="$OXFMT_ARGS --ignore-path $OXFMT_IGNORE_PATH"
fi

# When given an explicit file list (changed files mode), avoid failing on
# unmatched patterns (e.g. files that aren't formattable by oxfmt).
if [ "$#" -gt 0 ]; then
    OXFMT_ARGS="$OXFMT_ARGS --no-error-on-unmatched-pattern"
fi

echo "::debug::Args: $OXFMT_ARGS"

# shellcheck disable=SC2068,SC2086
npx oxfmt@$OXFMT_VERSION $OXFMT_ARGS ${@:1}
