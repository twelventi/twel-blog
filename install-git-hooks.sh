#!/bin/sh
set -eu

ROOT="$(cd "$(dirname "$0")" && pwd)"
HOOK_SRC="$ROOT/.githooks/pre-commit"
HOOK_DST="$ROOT/.git/hooks/pre-commit"

install -m 755 "$HOOK_SRC" "$HOOK_DST"
echo "Installed pre-commit hook -> $HOOK_DST"
