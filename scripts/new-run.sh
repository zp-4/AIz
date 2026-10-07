#!/usr/bin/env bash
set -euo pipefail
EXP="${1:?usage: new-run.sh EXP-XXX engine [hardware-profile] [TEST-ID] [PHASE-ID] [PROTOCOL-ID]}"
ENGINE="${2:?usage: new-run.sh EXP-XXX engine [hardware-profile] [TEST-ID] [PHASE-ID] [PROTOCOL-ID]}"
PROFILE="${3:-${HARDWARE_PROFILE:-unspecified}}"
TEST_ID="${4:-UNSPECIFIED}"
PHASE_ID="${5:-UNSPECIFIED}"
PROTOCOL_ID="${6:-UNSPECIFIED}"
TS=$(date +%Y%m%d-%H%M%S)
SEQ=1
while :; do
  RUN=$(printf 'RUN-%s-%03d' "$TS" "$SEQ")
  ROOT="notebook/runs/${RUN}"
  [ ! -e "$ROOT" ] && break
  SEQ=$((SEQ+1))
done
mkdir -p "$ROOT"/{inventory,config,logs,raw,context}
cat > "$ROOT/manifest.json" <<EOM
{
  "run_id": "${RUN}",
  "experiment_id": "${EXP}",
  "test_id": "${TEST_ID}",
  "phase_id": "${PHASE_ID}",
  "protocol_id": "${PROTOCOL_ID}",
  "started_at": "$(date -Is)",
  "status": "running",
  "hardware_profile": "${PROFILE}",
  "cpu": null,
  "gpu": null,
  "ram_gb": null,
  "os": null,
  "kernel": null,
  "rocm": null,
  "engine": "${ENGINE}",
  "engine_version": null,
  "router": null,
  "router_version": null,
  "model": null,
  "model_revision": null,
  "model_sha256": null,
  "model_format": null,
  "quantization": null,
  "context_tokens": null,
  "kv": null,
  "engine_parallel": null,
  "request_concurrency": null,
  "agent_concurrency": null,
  "warm_state": "mixed",
  "sample_count": null,
  "corpus_commit": null
}
EOM
if [ -f templates/tests/TEST_REPORT_TEMPLATE.md ]; then
  sed \
    -e "s/{{TEST_ID}}/${TEST_ID}/g" \
    -e "s/{{EXPERIMENT_ID}}/${EXP}/g" \
    -e "s/{{RUN_ID}}/${RUN}/g" \
    -e "s/{{PHASE_ID}}/${PHASE_ID}/g" \
    -e "s/{{PROTOCOL_ID}}/${PROTOCOL_ID}/g" \
    -e "s/{{DATE_TIME}}/$(date -Is | sed 's/[&]/\\&/g')/g" \
    -e "s/{{OPERATOR}}/${USER:-unknown}/g" \
    templates/tests/TEST_REPORT_TEMPLATE.md > "$ROOT/TEST_REPORT.md"
fi
cat > "$ROOT/result.json" <<EOM
{
  "run_id": "${RUN}",
  "status": "pending",
  "invalid_reason": null,
  "metrics": {},
  "hard_gates": {
    "pass": null,
    "gpu_reset": null,
    "oom": null,
    "critical_regression": null,
    "notes": null
  },
  "score_total": null,
  "grade": null,
  "production_ready": null,
  "observation": "",
  "interpretation": "",
  "decision": ""
}
EOM
printf '%s\n' "$RUN"
