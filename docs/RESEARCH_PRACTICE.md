# AIz Research Practice — Research-Grade Lite

AIz is a personal engineering/research homelab, not an academic thesis and not a regulated validation program.

The objective is to make claims **credible, reproducible and traceable** without turning day-to-day work into bureaucracy.

## 1. Minimum evidence chain

For any important claim:

```text
Protocol / test definition
        ↓
immutable RUN
        ↓
raw data + config + versions
        ↓
TEST_REPORT.md
        ↓
experiment FINDINGS.md
        ↓
ADR when architecture changes
        ↓
public site
```

A blog sentence is never stronger evidence than the run that supports it.

## 2. When a protocol is required

Create a short protocol before running a test when at least one is true:

- the result may change production architecture;
- two engines/harnesses/configurations are being compared;
- the result will be highlighted publicly;
- the test is an endurance/failure/recovery test;
- the result will be used as a CV/project claim.

A smoke check or exploratory debugging session does not need a separate protocol.

## 3. Repetition rule

```text
smoke / compatibility test     1 run is sufficient
exploratory tuning             1 run per candidate + rerun anomalies
important A/B comparison       3 independent measured runs
endurance                      1 full 24h/72h run after shorter validation
failure injection              repeat until behavior is understood; >=3 for promoted recovery claims
```

## 4. Statistics

Default reporting:

- count `n`;
- median/p50;
- p95 for latency distributions;
- mean + standard deviation when useful;
- min/max for small repeated run sets;
- absolute and percentage delta against baseline.

Do not claim statistical significance unless the design and sample size actually support it.

## 5. Observation, interpretation, decision

Always separate direct measurement, proposed explanation and project decision.

## 6. Deviations

Record material differences from protocol as `minor`, `material`, or `invalidating`. Never silently rewrite the protocol after seeing results.

## 7. Provenance

Important runs capture hardware, OS/kernel, ROCm/driver, engine/router/harness versions, model identity/revision/hash/quantization, effective configuration, corpus/repository commit, test/protocol IDs, timestamps, raw outputs/logs and checksums where relevant.

Unknown data is recorded as unknown/null, never guessed.

## 8. FAIR-lite

Use stable IDs, machine-readable JSON/CSV, documented units, provenance and public links for non-sensitive artifacts. Keep private artifacts documented without exposing secrets.

## 9. Claim strength

```text
EXPLORATORY   interesting result; insufficient confirmation
SUPPORTED     repeated evidence supports the claim on this hardware/workload
VALIDATED     repeated + endurance/failure gates appropriate to the claim
REJECTED      evidence contradicts the hypothesis or hard gate failed
INCONCLUSIVE  evidence is insufficient/confounded
```

Use the weakest label justified by the evidence.

## 10. Definition of research-grade enough

Another competent engineer should be able to answer what was tested, what changed, exact hardware/software/model, how metrics were collected, what raw evidence exists, what failed/deviated, what limitations apply, how to repeat the procedure and how the result affected AIz.
