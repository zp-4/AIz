# Canonical Test Catalog

This file owns stable public test IDs. The detailed procedures live in `docs/master/testing.md`; implementation commands live in `docs/master/guide.md`.

Do not reuse an ID for a different purpose. Historical run IDs keep the test ID that was valid when the run was executed.

| ID | Canonical purpose | Phase |
|---|---|---|
| T00 | System inventory / health / baseline evidence | P00 |
| T01 | Network throughput / latency / naming / time | P01 |
| T02 | NAS throughput, integrity, backup and restore readiness | P02 |
| T03 | GPU / ROCm / backend validation | P04/P05 |
| T04 | Ollama known-good baseline | P04 |
| T05 | llama.cpp direct baseline | P05 |
| T06 | KV cache matrix | P05 |
| T07 | Context length + needle retrieval matrix | P05 |
| T08 | Speculative / MTP decoding | P05/P07 |
| T09 | Engine/client concurrency matrix | P05/P07/P13 |
| T10 | Coding-quality corpus | P05/P08/P09/P13 |
| T11 | Multi-agent useful-throughput workload | P13 |
| T12 | Coding harness/runtime comparison (Pi/Qwen Code/OpenCode/Multica) | P09 |
| T13 | Context deduplication / token-budget optimization umbrella | P10 |
| T14 | Persistent-memory handoff | P11 |
| T15 | RAG retrieval/groundedness quality | P11 |
| T16 | llama-swap routing/lifecycle behavior | P06 |
| T16A | llama-swap routing overhead | P06 |
| T16B | cold swap/load cost | P06 |
| T16C | TTL experiment | P06 |
| T16D | overload / HTTP 429 / back-pressure | P06 |
| T17 | Strata specialized-engine evaluation | P07 |
| T17A | Strata parallelism matrix | P07 |
| T18 | GPU residency and application coexistence | P12 |
| T19 | Agent executor sandbox/isolation | P13 |
| T20 | Failure injection and recovery | P14 |
| T20A | inference engine/router failure | P14 |
| T20B | Node 0/control-plane failure | P14 |
| T21 | Backup/restore acceptance | P02/P14 |
| T22 | 24-hour endurance | P14 |
| T23 | 72-hour endurance | P14 |
| T24 | Upgrade / canary / rollback | P15 |
| T30 | Future Node 2 RX6600 validation/offload | P16 |
| T31 | Future Node 2 failure/recovery | P16 |
| T32 | Future embedding/reranking/STT offload A/B | P16 |
| T33 | Future llama-swap peer/spillover experiment | P16 |
| T34 | Future full-cluster 72-hour endurance | P16 |

## Context optimization sub-series

`CTX-*` IDs are stable sub-experiments under T13:

```text
CTX-00 baseline decomposition
CTX-01 exact duplicate removal / duplicate-brief proof
CTX-02 project-policy canonicalization
CTX-03 lazy skill disclosure
CTX-04 MCP role/task filtering
CTX-05 repository retrieval strategy
CTX-06 tool-output compaction
CTX-07 structured/selective memory recall
CTX-08 conversation compaction
CTX-09 semantic deduplication (experimental/human-reviewed)
CTX-10 combined candidate
CTX-11 24-hour representative workload
```
