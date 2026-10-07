# Test Protocol — {{PROTOCOL_ID}}

> Freeze this lightweight protocol before an important comparison. Amendments are append-only.

## Identity

- **Protocol ID:** `{{PROTOCOL_ID}}`
- **Experiment ID:** `{{EXPERIMENT_ID}}`
- **Test ID:** `{{TEST_ID}}`
- **Phase:** `{{PHASE_ID}}`
- **Created:** `{{DATE_TIME}}`
- **State:** `draft | frozen | superseded`

## Research question

What decision-relevant question will this test answer?

## Hypothesis

State a falsifiable hypothesis.

## Baseline / comparator

- Baseline:
- Candidate:
- Why comparison is fair:

## Variables

### Changed intentionally

- 

### Held constant

- 

### Known unavoidable confounders

- 

## Inputs / corpus

- Corpus/repository:
- Commit/revision:
- Sample/task selection:
- Planned sample count:

## Metrics

| Metric | Unit | Collection method | Primary/secondary | Why it matters |
|---|---|---|---|---|
| | | | | |

## Acceptance criteria / hard gates

| Criterion | Threshold / expected behavior |
|---|---|
| | |

## Repetition plan

Choose one and explain:

```text
[ ] one compatibility/smoke run
[ ] exploratory run + anomaly reruns
[ ] three independent measured runs
[ ] endurance protocol
[ ] other
```

## Inclusion / exclusion rules

Include:

- 

Exclude only when:

- 

Never exclude a valid run because its result is inconvenient.

## Procedure

1. 
2. 
3. 

## Required artifacts

```text
manifest.json
result.json
TEST_REPORT.md
config/
raw/
logs/
SHA256SUMS
```

## Analysis plan

Describe the comparison before seeing results.

Default:

- individual run values;
- p50/p95 for request latency distributions;
- mean/std only where meaningful;
- baseline delta;
- practical significance;
- hard-gate outcome.

## Protocol freeze

- Frozen at:
- Git commit:

## Amendments

Do not edit the frozen plan silently.

| Date | Amendment | Reason | Before/after data collection? | Impact |
|---|---|---|---|---|
| | | | | |
