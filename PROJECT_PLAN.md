# AIz deployment plan

## Goal

Build a reproducible local AI software factory and research homelab around the existing hardware:

- **Control workstation / Node0:** N100 / 16 GB / Omarchy — operator workstation plus lightweight control-plane services.
- **Node1:** i9-13900K / 128 GB / RX 7900 XTX 24 GB / Debian 13 — primary compute and local inference.
- **NAS:** UGREEN DX4600 — durable backups, archives and published/raw artifacts.
- **Future Node2:** refurbished workstation + existing RX 6600 8 GB — auxiliary worker.

The primary systems-under-test workloads are local coding agents/harnesses (Pi, Qwen Code, OpenCode, optionally Multica), local inference engines (llama.cpp, Strata, vLLM, Ollama baseline) and 3–8-agent software-development workloads.

## Operator bootstrap — before P00, not a project phase

Keep this lightweight:

```text
Mini-PC Omarchy
├── AIz Git working tree
├── Claude Code -> cloud LLM
├── terminal/tmux + optional VS Code for review
├── AIz scripts
└── SSH/API access to lab nodes
```

Rules:

1. Claude Code/cloud is the **research/engineering assistant**, not a benchmark target.
2. Local models/harnesses are systems under test and must not be required to operate the research assistant.
3. Prefer `AIz scripts -> SSH/API -> node` over arbitrary ad-hoc remote commands when a canonical helper exists.
4. Human approval remains required for architecture decisions, claim-strength promotion, publication of sensitive artifacts, and destructive operations.
5. GitHub tracks work and review; immutable measured evidence remains in AIz RUN artifacts.

See `docs/OPERATOR_WORKFLOW.md`.

## Research-Grade Lite rules

Before an important A/B comparison or a test that can change architecture, freeze a short protocol from `templates/tests/PROTOCOL_TEMPLATE.md`. Smoke tests remain lightweight. Important noisy comparisons normally use three independent measured runs; deterministic compatibility checks normally require one.

Every measured phase produces machine evidence (`RUN-*`) plus a human `TEST_REPORT.md`. Multiple comparable runs are synthesized in `FINDINGS.md`. Material deviations from a frozen protocol are recorded, never silently edited away.

## Phase map

| Phase | Purpose | Production-changing? | Required evidence |
|---|---|---:|---|
| P00 | Freeze baseline/project | No | inventory + current-state evidence + hashes |
| P01 | Network/DNS/time | Low | latency/throughput/DNS/time evidence |
| P02 | NAS/backup/restore | Yes | successful backup + restore |
| P03 | Node0 control-plane services | Yes | health + persistence + recovery |
| P04 | Node1 observability/baseline | No | current Ollama/application baseline |
| P05 | llama.cpp candidate | No | direct benchmark + gates |
| P06 | llama-swap routing | Yes after gate | routing/swap/back-pressure/lifecycle |
| P07 | Strata specialized Qwen candidate | No | RX7900XTX direct/routed tests |
| P08 | vLLM + LM Studio challengers | No | comparative runs |
| P09 | Coding harnesses + Multica as SUTs | No | context/discovery/resume/jobs-per-hour |
| P10 | Context optimization | No | token/prefill savings without correctness loss |
| P11 | Persistent memory + RAG | Yes after gate | handoff/retrieval/grounding tests |
| P12 | OpenWebUI + ComfyUI integration | Yes | coexistence/residency tests |
| P13 | Multi-agent software factory | Yes after gate | 1/2/4/6/8-agent matrix |
| P14 | Failure, restore, endurance | Yes | failure injection + 24h/72h where justified |
| P15 | Freeze/publication | Yes | pinned versions + reports/findings + scorecard + ADRs |
| P16 | Future RX6600 Node2 | Future | auxiliary offload A/B + cluster soak |

## Promotion rule

A candidate moves to production only when:

```text
functional smoke PASS
AND required protocol/report evidence exists
AND hard gates PASS
AND correctness is non-inferior for the intended workload
AND operational rollback exists
AND configuration/version is pinned
AND evidence is traceable from finding -> report -> run -> raw artifact
```

## Work cycle

```text
GitHub Issue / research question
        |
        v
session note + plan
        |
        +--> important comparison -> freeze PROTO-*
        |
        v
approved AIz command / remote execution
        |
        v
RUN-* + raw evidence + TEST_REPORT.md
        |
        v
FINDINGS.md when comparable evidence is sufficient
        |
        +--> ADR only when architecture/policy changes
        |
        v
Astro/Starlight publication
```

Claude Code may draft the plan, protocol, report and findings from evidence, but the human operator approves interpretation/decision and any strong public claim.
