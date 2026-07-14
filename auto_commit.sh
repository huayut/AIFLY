#!/usr/bin/env bash
set -euo pipefail

repo_root=$(git rev-parse --show-toplevel 2>/dev/null || true)
if [[ -z "$repo_root" ]]; then
  echo "Error: This script must be run from inside a git repository." >&2
  exit 1
fi

cd "$repo_root"

commit_message=${1:-"Auto commit from script"}

echo "Staging all changes..."
git add -A

if git diff --cached --quiet; then
  echo "No changes to commit."
  exit 0
fi

echo "Committing with message: $commit_message"
git commit -m "$commit_message"

current_branch=$(git rev-parse --abbrev-ref HEAD)
if [[ -z "$current_branch" || "$current_branch" == "HEAD" ]]; then
  echo "Error: Unable to determine current branch." >&2
  exit 1
fi

echo "Pushing branch $current_branch to origin..."
git push origin "$current_branch"

echo "Auto commit complete."
