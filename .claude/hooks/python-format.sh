#!/bin/bash
INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

# Only process Python files
if [[ "$FILE_PATH" != *.py ]]; then
  exit 0
fi

# Format with Ruff
uv run ruff format "$FILE_PATH" 2>/dev/null

# Check with Ruff (non-blocking — feeds issues back to Claude)
LINT_OUTPUT=$(uv run ruff check "$FILE_PATH" 2>&1)
if [ $? -ne 0 ]; then
  echo "$LINT_OUTPUT"
fi

exit 0
