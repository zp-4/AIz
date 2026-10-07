# GitHub workflow for AIz

## Purpose

GitHub provides version control/review, roadmap/work tracking, experiment traceability, CI validation and publication of the Astro/Starlight lab notebook.

The local AIz repository and immutable RUN artifacts remain the evidence source.

## Repository model

Use one repository: `AIz`.

## GitHub Project

One Project: **AIz — Research & Engineering**.

Minimal fields:

| Field | Values |
|---|---|
| Status | Backlog / Ready / In progress / Blocked / Review / Done |
| Type | Infrastructure / Implementation / Experiment / Documentation / Bug / Decision |
| Phase | P00–P16 |
| Priority | P0 / P1 / P2 / P3 |
| Evidence | None / Exploratory / Supported / Validated / Rejected / Inconclusive |
| Target | Node0 / Node1 / Node2 / NAS / Site / Cluster / N/A |

Useful views: Roadmap, Current Work, Experiments, Evidence, Publication.

## Issues

Issues track meaningful work, **not individual RUNs**.

An Experiment issue may reference many `RUN-*` artifacts.

## Milestones

```text
M0 Foundation             P00-P03
M1 Local Inference        P04-P08
M2 Agentic Runtime        P09-P11
M3 Software Factory       P12-P13
M4 Reliability/Release    P14-P15
M5 Distributed Expansion  P16
```

## Pull requests

Direct commits are acceptable for trivial personal edits. Prefer PRs for production configuration, benchmark methodology/test-ID changes, new inference engines, accepted ADRs, automation scripts and site architecture/publication logic.

Claude Code may prepare changes/PRs, but significant merges remain human-approved.

## GitHub Pages

The Astro/Starlight site in `site/` is the public presentation layer.

```text
main merge -> validation -> build site/ -> GitHub Pages
```

The site may publish runbook documentation, experiments, per-run reports, findings, ADRs, sanitized artifacts/checksums and journal entries.

Secrets, credentials, private corpus/code and sensitive raw artifacts remain excluded.

## Evidence rule

GitHub adds tracking/review/publication around the evidence workflow; it does not redefine evidence.

```text
Project -> Issue -> local work -> one/many RUNs -> findings -> ADR/PR -> Pages
```
