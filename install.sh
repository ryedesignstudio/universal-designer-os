#!/usr/bin/env bash
# Link the canonical Designer skill into Cursor (project) and Claude Code (user) skill paths.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE="${REPO_ROOT}/skills/designer"
CURSOR_DEST="${REPO_ROOT}/.cursor/skills/designer"
CLAUDE_DEST="${HOME}/.claude/skills/designer"

if [[ ! -f "${SOURCE}/SKILL.md" ]]; then
  echo "error: expected ${SOURCE}/SKILL.md (edit the skill only under skills/designer/)." >&2
  exit 1
fi

replace_with_symlink() {
  local dest="$1"
  local target="$2"
  mkdir -p "$(dirname "$dest")"
  if [[ -e "$dest" ]] || [[ -L "$dest" ]]; then
    rm -rf "$dest"
  fi
  ln -s "$target" "$dest"
  echo "linked: $dest -> $target"
}

replace_with_symlink "$CURSOR_DEST" "$SOURCE"
replace_with_symlink "$CLAUDE_DEST" "$SOURCE"

echo "done. Cursor uses ${CURSOR_DEST}; Claude Code uses ${CLAUDE_DEST}."
