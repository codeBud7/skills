---
name: harvest
description: Ship fixed-scope work end-to-end — TDD, local gates, draft PR, CI green.
disable-model-invocation: true
---

# Harvest

Triggers: ship it | open draft PR | get CI green | finalize | prepare for review.

Orchestrate sub-skills in order. **No merge** unless user says so.

## Subagent rule

Read-only or independent stage → delegate subagent(s). Main thread: scope decisions, edits, gating.

## Pipeline

| # | Skill | Done gate |
|---|-------|-----------|
| 0 | `repo-safety` | continuous — see skill |
| 1 | `tdd-cycle` | red → green → refactor |
| 2 | `local-quality-gate` | lint/format/type/test/build green |
| 3 | `draft-pr` | draft PR URL + scoped commits |
| 4 | `ci-green` | required checks green or blocked |

Independent stages (1–4) may run delegated; orchestrator verifies gates before next step.

## Stop

No force-push, no bypass required checks, no hide flaky/env failures — without approval.

## Done

Impl complete | tests-first when feasible | local green | CI green | draft PR | scoped diff | limits documented.
