#!/usr/bin/env bash
set -euo pipefail
TITLE="${1:-work-session}"
TS=$(date +%Y%m%d-%H%M%S)
DATE=$(date +%F)
SAFE=$(printf '%s' "$TITLE" | tr '[:upper:] ' '[:lower:]-' | tr -cd 'a-z0-9_-')
[ -n "$SAFE" ] || SAFE="session"
ID="JRN-${TS}"
mkdir -p notebook/sessions
FILE="notebook/sessions/${DATE}-${TS#*-}-${SAFE}.md"
cat > "$FILE" <<EOM
# ${ID} — ${TITLE}

- Started: $(date -Is)
- Status: in-progress
- Related phase:
- Related experiment:
- Related runs:

## Goal

## Changes made

## Commands / config changed

## Verification

## Observations

## Problems / failures

## Next step

## Close-out

- Ended:
- Git commit:
EOM
printf '%s\n' "$FILE"
