# AIz Operator Workstation & AI Research Assistant

## Purpose

Keep the project understandable by separating three roles:

1. **Human operator** — owns goals, approvals and final decisions.
2. **Claude Code + cloud LLM** — external research/engineering assistant.
3. **AIz lab systems** — the local hardware/software being built and measured.

This separation prevents the benchmark target from also being required to operate or analyze its own experiment.

## Physical/logical placement

The mini-PC Omarchy machine is both the daily workstation and Node0 host for lightweight control-plane services.

```text
MINI-PC / OMARCHY
├── human terminal / optional VS Code
├── Claude Code -> cloud LLM
├── AIz Git working tree
├── AIz scripts
├── gh
├── SSH client
└── Node0 services
    ├── Redis
    ├── PostgreSQL
    ├── Qdrant
    └── observability/control services

                   SSH / APIs
                       |
                       v
NODE1 / DEBIAN ---------------- future NODE2
RX7900XTX                        RX6600
local inference                  auxiliary workloads
build/test workspaces
systems under test
```

The N100 does **not** perform heavy local LLM inference for the research assistant.

## Systems under test

Depending on the experiment:

- inference: Ollama baseline, llama.cpp, Strata, vLLM, optional LM Studio/llmster;
- routing/lifecycle: llama-swap;
- coding harnesses: Pi, Qwen Code, OpenCode;
- orchestration/harness layer: Multica AI;
- context/memory/RAG mechanisms;
- multi-agent workloads;
- Node1/Node2 resource placement.

Claude Code/cloud is not included in local-inference performance claims unless a future experiment explicitly defines a separate comparison.

## Interface policy

**Terminal is canonical; VS Code is optional review/editing comfort.**

Canonical operations should eventually look like:

```text
AI / human -> AIz helper -> SSH/API -> remote node
```

rather than undocumented ad-hoc commands. Direct SSH remains acceptable during bootstrap or investigation, but exact commands must be captured when they affect evidence.

## Three assistant modes

These are behavioral modes, not three separate agents.

### PLAN

No infrastructure mutation.

Claude Code may:
- read phase/test/protocol;
- inspect current configuration;
- draft commands and risks;
- identify required evidence;
- draft/freeze a protocol after human approval.

### EXECUTE

Follow an approved phase/protocol.

Claude Code may:
- invoke approved AIz helpers;
- execute expected remote commands;
- collect artifacts;
- stop on a material deviation or unsafe ambiguity.

It must not silently alter controlled variables to “make the test pass”.

### ANALYZE

No infrastructure mutation by default.

Claude Code may:
- read one or more runs;
- compute summaries from recorded values;
- draft reports/findings;
- identify confounders/anomalies;
- recommend a follow-up.

## Required evidence behavior

Claude Code must:

```text
never fabricate measurements
never substitute expected values for observed values
cite RUN IDs behind findings
keep failed/invalid runs visible
separate OBSERVATION / INTERPRETATION / DECISION
record protocol deviations
use null/unknown when provenance is missing
avoid stronger claims than the evidence supports
```

## Approval boundary

A human approves:

- destructive actions;
- material deviations from protocol;
- run exclusion;
- architecture changes;
- claim-strength changes;
- public release of potentially sensitive evidence;
- significant GitHub merges.

## Daily pattern

```text
1. choose objective
2. Claude drafts plan/protocol
3. human approves
4. Claude/human invokes AIz helpers
5. lab generates immutable evidence
6. Claude drafts TEST_REPORT
7. human reviews interpretation
8. repeated runs -> Claude drafts FINDINGS
9. human accepts/rejects finding/ADR
10. commit / PR / GitHub Pages publication
```

The aim is to automate clerical work while keeping experimental judgment explicit.
