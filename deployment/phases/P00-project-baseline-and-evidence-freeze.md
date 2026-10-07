# P00 — Project baseline and evidence freeze

## Objective

Freeze the current working system before any architecture change, and confirm the operator/research-assistant boundary before the first measurement.

## INSTALL / CONFIGURE

Confirm the Omarchy mini-PC control workstation, Claude Code/cloud assistant boundary, and SSH access model. Then inventory all nodes; back up current configs; record network/storage/GPU state; hash master docs.

Use `docs/master/guide.md` for the detailed commands and implementation notes. Record every exact command/version used in the session note and run manifest.

## VERIFY / BENCHMARK

T00 system inventory/health plus known-good Ollama/OpenWebUI/ComfyUI smoke.

Use `docs/master/testing.md` for metric definitions and hard-gate methodology.

## RECORD

Baseline run and backup manifest.

Minimum artifacts:

```text
manifest.json
result.json
inventory/
config/
logs/
raw/
SHA256SUMS
```

## PUBLISH

1. Finalize the run.
2. Copy it into the site with `scripts/publish-run.sh RUN-ID`.
3. Update/create the Experiment page.
4. Add a Journal note summarizing what happened.
5. Create/update an ADR if this phase changes the preferred architecture.

## GATE

Do not continue until current services and restore sources are known.

## ROLLBACK

Restore the previous pinned configuration/service version and verify the previous real-decode/application smoke test before continuing.

## Research baseline

Before the first public comparison:

```text
[ ] read docs/RESEARCH_PRACTICE.md
[ ] freeze the initial benchmark corpus/repository commit
[ ] confirm canonical test IDs in docs/TEST_CATALOG.md
[ ] confirm metric definitions in docs/master/testing.md
[ ] decide which initial comparisons require PROTO-*
[ ] confirm Claude Code uses cloud inference and is outside local benchmark results
[ ] read docs/OPERATOR_WORKFLOW.md
[ ] record Git commit of this research baseline
```

Do not over-formalize smoke tests. The goal is to make important claims traceable from the start.
