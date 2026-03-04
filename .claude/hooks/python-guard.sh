#!/bin/bash
INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

BLOCKED_PATTERNS=(
  "pip install"
  "python -m pip"
  "poetry "
  "conda "
  "rm -rf"
  "DROP TABLE"
  "DROP DATABASE"
)

for pattern in "${BLOCKED_PATTERNS[@]}"; do
  if echo "$COMMAND" | grep -qi "$pattern"; then
    echo "Blocked: command matches dangerous pattern '$pattern'" >&2
    if echo "$pattern" | grep -qiE "pip|poetry|conda"; then
      echo "Use 'uv add <package>' or 'uv run' instead." >&2
    fi
    exit 2
  fi
done

exit 0
