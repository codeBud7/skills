---
name: tdd-cycle
description: TDD cycle runs strict red, green, refactor for a fixed-scope change.
disable-model-invocation: true
---

# TDD cycle

## Fast path

Red → green → refactor for a fixed-scope change; failing test first.

**You get:** Passing tests protecting the scoped change with regression coverage.

**You need:** Known expected behavior, modules touched, and test patterns/fixtures.

**Done when:** Red → green → refactor cycle complete; tests pass; handoff criteria in **Handoff** met.

## Gate contract

- **`pass`** — failing test confirmed for the right reason; then green; refactor rerun; tests executed, not assumed.
- **`blocked`** — red never confirmed, green not executed, or tests skipped with no alternate proof.
- **`not-applicable`** — no production behavior change; state why. Alternate verification must still be named.
- **`waived`** — user recorded skip of TDD with risk. Skip-all with no executed check is not `pass`.

## Before red

Know all **You need** inputs plus test level (unit | integration | e2e). Ambiguous → stop, clarify.

## Red

Add/modify tests → run → confirm fail for **right reason**. Meaningful failure; deterministic; no over-mock; keep coverage. Bugfix = repro test; feature = behavior test; refactor = characterization test first.

Implement only after a confirmed failing test. If automation is impossible, say why before implementation.

## Green

Minimal code to pass. Smallest change; match repo patterns; no speculative abstraction. Rerun affected tests; no unrelated regressions.

## Refactor

Tests green → readability, dedupe, naming, structure. Rerun after each meaningful refactor. No coverage drop without reason.

## Handoff

Tests pass; edges covered; regressions protected. No tests added → explain why + alternate verification.
