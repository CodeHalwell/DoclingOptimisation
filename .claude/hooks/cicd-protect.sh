#!/bin/bash
INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

PROTECTED_PATTERNS=(
  ".github/workflows/"
  "azure-pipelines.yml"
  ".gitlab-ci.yml"
)

for pattern in "${PROTECTED_PATTERNS[@]}"; do
  if [[ "$FILE_PATH" == *"$pattern"* ]]; then
    echo "Blocked: '$FILE_PATH' is a CI/CD config. Review changes manually." >&2
    exit 2
  fi
done

exit 0
