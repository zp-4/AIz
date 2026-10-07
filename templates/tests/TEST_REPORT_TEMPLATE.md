# Test Report — {{TEST_ID}}

> One report per executed test/run. Keep measured facts separate from interpretation.

## 1. Identity

- **Test ID:** `{{TEST_ID}}`
- **Experiment ID:** `{{EXPERIMENT_ID}}`
- **Run ID:** `{{RUN_ID}}`
- **Phase:** `{{PHASE_ID}}`
- **Protocol ID:** `{{PROTOCOL_ID}}`
- **Claim strength:** `EXPLORATORY | SUPPORTED | VALIDATED | REJECTED | INCONCLUSIVE`
- **Date/time:** `{{DATE_TIME}}`
- **Operator:** `{{OPERATOR}}`
- **Status:** `planned | running | pass | fail | invalid | inconclusive`

## 2. Objective

What question does this test answer?

## 3. Hypothesis

State a falsifiable hypothesis before looking at results.

## 4. Baseline / comparator

- Baseline run:
- Comparator configuration:
- Why this is a fair comparison:

## 5. Acceptance criteria and hard gates

| Criterion | Threshold / expected behavior | Result | Pass? |
|---|---|---:|---|
| | | | |

## 6. Environment and provenance

- Node / hardware profile:
- OS / kernel:
- ROCm / driver:
- Engine + version/commit:
- Router + version:
- Coding harness/runtime + version:
- Model + revision/hash:
- Quantization / format:
- Corpus/repository commit:

## 7. Effective configuration

```text
context:
KV:
parallelism:
request concurrency:
agent concurrency:
warm/cold state:
sampling:
other relevant settings:
```

Attach exact effective configs under `config/`.

## 8. Protocol conformance / deviations

- Protocol followed as frozen? `yes/no/not-applicable`

| Deviation | Severity (`minor/material/invalidating`) | Reason | Likely effect on result | Action |
|---|---|---|---|---|
| | | | | |

## 9. Repetition and inclusion/exclusion

- Planned repetitions:
- Completed repetitions:
- Included runs:
- Excluded/invalid runs:
- Exclusion reason(s):

Never remove a valid run because it weakens the preferred conclusion.

## 10. Procedure

1. 
2. 
3. 

Commands/scripts used:

```bash
# exact commands or links to captured scripts/configs
```

## 11. Measurements

| Metric | Definition | Unit | Collection method | Why it matters |
|---|---|---|---|---|
| | | | | |

## 12. Raw results

| Metric | Baseline | Candidate | Delta | Notes |
|---|---:|---:|---:|---|
| | | | | |

Raw artifacts live under `raw/`, `logs/`, `context/`, `config/` and `SHA256SUMS`.

## 13. Error analysis

| Error/failure class | Count | Frequency | Impact | Example artifact | Suspected cause |
|---|---:|---:|---|---|---|
| | | | | | |

## 14. OBSERVATIONS — measured facts only

- 

## 15. INTERPRETATION — explanation/hypothesis

- 

## 16. FINDINGS

### Strengths observed

- 

### Weaknesses observed

- 

### Risks discovered

- 

## 17. DECISION / recommendation

Choose one:

`PROMOTE | KEEP TESTING | HOLD | REJECT | ROLLBACK | INCONCLUSIVE`

## 18. Follow-up tests

| Follow-up test | Why | Dependency | Priority |
|---|---|---|---|
| | | | |

## 19. Limitations / threats to validity

- Sample-size limitations:
- Model/config equivalence limitations:
- Measurement noise:
- Environmental confounders:
- Generalization limits:

## 20. Reproducibility checklist

```text
[ ] hardware profile captured
[ ] versions/commits captured
[ ] model hash captured
[ ] configuration archived
[ ] corpus/repository commit captured
[ ] commands captured
[ ] raw logs retained
[ ] raw metrics retained
[ ] checksums generated
[ ] invalid runs retained and explained
[ ] observation separated from interpretation
[ ] hard gates evaluated
```
