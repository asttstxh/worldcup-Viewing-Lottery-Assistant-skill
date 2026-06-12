#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILL_SRC="$REPO_ROOT/skills/worldcup-match-report"
CODEX_HOME="${CODEX_HOME:-$HOME/.codex}"
SKILL_DEST="$CODEX_HOME/skills/worldcup-match-report"

if [ ! -f "$SKILL_SRC/SKILL.md" ]; then
  echo "Cannot find skill source at: $SKILL_SRC" >&2
  exit 1
fi

mkdir -p "$CODEX_HOME/skills"

if [ -e "$SKILL_DEST" ] || [ -L "$SKILL_DEST" ]; then
  BACKUP="$SKILL_DEST.backup.$(date +%Y%m%d%H%M%S)"
  mv "$SKILL_DEST" "$BACKUP"
  echo "Existing skill moved to: $BACKUP"
fi

cp -R "$SKILL_SRC" "$SKILL_DEST"

echo "Installed worldcup-match-report to: $SKILL_DEST"
echo "Restart Codex to refresh the skill list."
