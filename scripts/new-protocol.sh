#!/usr/bin/env bash
set -euo pipefail
EXP="${1:?usage: new-protocol.sh EXP-XXX TEST-ID [PHASE-ID]}"
TEST="${2:?usage: new-protocol.sh EXP-XXX TEST-ID [PHASE-ID]}"
PHASE="${3:-UNSPECIFIED}"
mkdir -p notebook/protocols
SEQ=1
while :; do
  ID=$(printf 'PROTO-%s-%s-%03d' "$EXP" "$TEST" "$SEQ")
  OUT="notebook/protocols/${ID}.md"
  [ ! -e "$OUT" ] && break
  SEQ=$((SEQ+1))
done
NOW=$(date -Is)
sed \
  -e "s/{{PROTOCOL_ID}}/${ID}/g" \
  -e "s/{{EXPERIMENT_ID}}/${EXP}/g" \
  -e "s/{{TEST_ID}}/${TEST}/g" \
  -e "s/{{PHASE_ID}}/${PHASE}/g" \
  -e "s/{{DATE_TIME}}/${NOW//&/\\&}/g" \
  templates/tests/PROTOCOL_TEMPLATE.md > "$OUT"
printf '%s\n' "$OUT"
