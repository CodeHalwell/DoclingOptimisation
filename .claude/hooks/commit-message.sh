#!/bin/bash
INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

# Only intercept git commit commands
if ! echo "$COMMAND" | grep -q 'git commit'; then
  exit 0
fi

# Extract the commit message
MSG=$(echo "$COMMAND" | grep -oP '(?<=-m\s["\x27])[^"\x27]+')

if [ -z "$MSG" ]; then
  exit 0
fi

# Validate conventional commit format
if ! echo "$MSG" | grep -qE '^(feat|fix|docs|style|refactor|perf|test|build|ci|chore|revert)(\(.+\))?: .{3,}'; then
  echo "Blocked: commit message doesn't follow conventional commits format." >&2
  echo "Expected: type(scope): description" >&2
  echo "Types: feat, fix, docs, style, refactor, perf, test, build, ci, chore, revert" >&2
  exit 2
fi

exit 0
