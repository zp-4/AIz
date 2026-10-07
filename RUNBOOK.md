# AIz master runbook

This is the operational entry point. Detailed implementation lives in `docs/master/guide.md`; benchmark definitions live in `docs/master/testing.md` and stable IDs in `docs/TEST_CATALOG.md`.

## 1. Operator model

AIz is operated from the mini-PC Omarchy control workstation.

```text
Claude Code / cloud LLM
        |
        v
local AIz repository + scripts
        |
        v
SSH / APIs
        |
        v
Node1 / future Node2 / NAS
```

Claude Code is an external research/engineering assistant. It may plan, execute approved helpers, analyze evidence and draft documentation. It is not part of the local inference benchmark and must not fabricate or infer missing measurements.

Canonical behavior is defined in `CLAUDE.md` and `docs/OPERATOR_WORKFLOW.md`.

## 2. Research checkpoint before benchmarking

Ask:

> Could this result change architecture, be compared publicly, or support a CV/project claim?

If **yes**, freeze a short `PROTO-*` first. If **no**, a smoke/exploratory run can proceed without a separate protocol.

Important noisy A/B comparisons normally use three independent measured runs. Do not repeat deterministic compatibility checks merely to satisfy a rule.

## 3. Phase contract

Every deployment phase answers eight questions:

1. **INSTALL** — What software/files are added?
2. **CONFIGURE** — What settings are changed and where?
3. **VERIFY** — How is basic function proven?
4. **BENCHMARK** — Which tests/experiments are executed?
5. **RECORD** — Which raw artifacts/manifests are retained?
6. **PUBLISH** — What appears in notebook/site?
7. **GATE** — What must pass before continuing?
8. **ROLLBACK** — How is the previous known-good state restored?

## 4. Session checklist

```text
[ ] Pick a single meaningful objective / GitHub Issue
[ ] Create session note
[ ] Read relevant phase + TEST-ID/protocol
[ ] Snapshot versions/config before changing them
[ ] Back up changed configuration
[ ] Use AIz helper/dry-run where available
[ ] Perform install/configuration
[ ] Execute smoke verification
[ ] Freeze PROTO-* first when required
[ ] Start immutable RUN-* for measurements
[ ] Store raw logs/JSON/CSV/config/inventory
[ ] Record deviations immediately
[ ] Complete result.json
[ ] Complete TEST_REPORT.md
[ ] Evaluate hard gates
[ ] Finalize checksums
[ ] Publish sanitized report/artifacts to site
[ ] Update FINDINGS.md when enough comparable runs exist
[ ] Write/update ADR only if architecture/operating policy changed
[ ] Review diff and commit with EXP/TEST/RUN references
```

## 5. Human/AI responsibility boundary

### Claude Code may

- summarize an issue or phase;
- draft a protocol before execution;
- invoke approved non-destructive AIz helpers;
- collect/read logs and structured outputs;
- compute summaries from measured values;
- draft `TEST_REPORT.md`, `FINDINGS.md`, ADRs and site prose;
- detect inconsistencies or missing provenance;
- suggest the smallest useful follow-up test;
- prepare a Git diff/PR.

### Human approval is required for

- destructive or privileged changes beyond an already approved runbook step;
- changing controlled variables during a frozen protocol;
- excluding a run from analysis;
- promoting `EXPLORATORY` -> `SUPPORTED` -> `VALIDATED`;
- accepting an ADR/architecture change;
- publishing potentially sensitive artifacts;
- merging a significant PR.

## 6. Source hierarchy

```text
MEASURED FACTS
immutable RUN/raw artifact > derived aggregate/site view

ARCHITECTURE / OPERATING DECISIONS
accepted ADR > deployment phase > docs/master/guide.md

BENCHMARK DEFINITIONS / METRICS
docs/TEST_CATALOG.md + docs/master/testing.md > experiment prose

OPERATOR PRACTICE
CLAUDE.md + docs/OPERATOR_WORKFLOW.md

PUBLIC PRESENTATION
site prose never overrides evidence
```

If an ADR changes the architecture described by the guide, update the guide in the same change. Never rewrite historical RUN evidence to match newer methodology.

## 7. Evidence strength

```text
EXPLORATORY  informative evidence; not yet strongly confirmed
SUPPORTED    repeated evidence supports the claim on this hardware/workload
VALIDATED    repetitions + reliability gates appropriate to the claim
REJECTED     hard gate failed or evidence contradicts the hypothesis
INCONCLUSIVE confounding/noise prevents a reliable conclusion
```

Use the weakest label justified by the evidence.

## 8. GitHub workflow

GitHub tracks **work**, not individual runs:

```text
Project -> Issue -> local work -> one/many RUNs -> findings -> ADR/PR -> Pages
```

See `docs/GITHUB_WORKFLOW.md`.
