# AIz — Local AI Research Homelab & Software Factory

AIz is a personal engineering/research homelab for evaluating local AI inference, coding-agent harnesses, context management, persistent memory and multi-agent software-development workloads.

The project is intentionally **Research-Grade Lite**: rigorous enough that results are traceable, reproducible and defensible in a portfolio/CV, without turning a personal homelab into academic bureaucracy.

## Operating model

Every technical change follows one loop:

```text
PLAN -> DEPLOY -> VERIFY -> BENCHMARK -> RECORD -> ANALYZE -> DECIDE -> PUBLISH
```

### Operator boundary

The AIz research assistant is deliberately **outside the local AI system under test**:

```text
Mini-PC / Omarchy
  Claude Code + cloud LLM
  Git / GitHub control
  AIz scripts / SSH / evidence collection
              |
              v
        AIz systems under test
  Node1 / future Node2 / local inference
  Pi / Qwen Code / OpenCode / Multica
  llama.cpp / Strata / vLLM / Ollama
```

Claude Code may help plan experiments, invoke approved AIz scripts, inspect evidence and draft reports. It must never fabricate measurements or silently promote a claim. Local inference engines and coding harnesses remain the objects being measured.

See `docs/OPERATOR_WORKFLOW.md`.

## What a measured result must contain

For important comparisons and public/CV claims:

- stable `TEST-ID` and, when useful, a short frozen `PROTO-*`;
- immutable `RUN-*` evidence;
- exact configuration/version snapshot;
- raw artifacts and checksums;
- machine-readable `result.json`;
- human-readable `TEST_REPORT.md`;
- explicit deviations and limitations;
- `FINDINGS.md` for multi-run conclusions;
- ADR only when architecture/operating policy changes.

Smoke checks remain lightweight.

## Start here

1. Prepare the Omarchy mini-PC as the operator workstation.
2. Read `CLAUDE.md`, `PROJECT_PLAN.md`, `RUNBOOK.md`, `docs/OPERATOR_WORKFLOW.md` and `docs/RESEARCH_PRACTICE.md`.
3. Execute P00 baseline/evidence freeze before material infrastructure changes.
4. Track work in GitHub Issues/Project; keep measured RUN evidence in the repository/notebook, not as individual Issues.
