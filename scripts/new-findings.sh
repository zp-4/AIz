#!/usr/bin/env bash
set -euo pipefail
EXP="${1:?usage: new-findings.sh EXP-XXX}"
OUT="notebook/findings/${EXP}.md"
if [ -e "$OUT" ]; then
  echo "Refusing to overwrite existing findings: $OUT" >&2
  exit 1
fi
mkdir -p notebook/findings
sed "s/{{EXPERIMENT_ID}}/${EXP}/g" templates/tests/FINDINGS_TEMPLATE.md > "$OUT"
printf '%s\n' "$OUT"
