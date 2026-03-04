#!/usr/bin/env bash
set -euo pipefail

HISTORY_DIR="$CLAUDE_PROJECT_DIR/.history"
HISTORY_FILE="$HISTORY_DIR/changes.json"

mkdir -p "$HISTORY_DIR"

if [ ! -f "$HISTORY_FILE" ]; then
  PROJECT_NAME=$(basename "$CLAUDE_PROJECT_DIR")
  cat > "$HISTORY_FILE" << EOF
{
  "version": "1.0.0",
  "project": "$PROJECT_NAME",
  "entries": []
}
EOF
fi

ENTRY_COUNT=$(jq '.entries | length' "$HISTORY_FILE" 2>/dev/null || echo "0")

if [ "$ENTRY_COUNT" -gt 0 ]; then
  echo "## Recent Change History"
  echo ""
  echo "Last changes recorded in .history/changes.json:"
  echo ""
  jq -r '
    .entries[-10:] | reverse | .[] |
    "- [\(.timestamp | split("T")[0])] **\(.type)** (\(.scope)): \(.summary)"
  ' "$HISTORY_FILE" 2>/dev/null
  echo ""
  echo "Read .history/changes.json for full details. Update it after significant changes."
else
  echo "## Change History"
  echo ""
  echo "No changes recorded yet. After making medium-to-large changes, update .history/changes.json."
fi
