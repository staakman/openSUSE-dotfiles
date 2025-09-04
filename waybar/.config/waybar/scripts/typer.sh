#!/usr/bin/env bash
set -euo pipefail

# Prefer a custom buffer file if you want (optional)
BUF="${HOME}/.cache/typer.txt"

# Choose source text: custom buffer > clipboard
if [[ -s "$BUF" ]]; then
  # -s means file exists and is non-empty
  TEXT="$(cat "$BUF")"
else
  # --no-newline avoids an extra Enter at the end
  TEXT="$(wl-paste --no-newline || true)"
fi

# Nothing to type? exit quietly
[[ -z "${TEXT}" ]] && exit 0

# Type it into the currently focused window
# The dash means "read from stdin"
printf '%s' "$TEXT" | ydotool type -