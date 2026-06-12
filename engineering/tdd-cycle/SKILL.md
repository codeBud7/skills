---
name: tdd-cycle
description: Implement a fixed-scope change via strict red, green, refactor TDD. Use when driving a feature, bugfix, or refactor test-first, or when CI reveals missing coverage. Triggers: "@tdd-cycle". Orchestrated step — invoke explicitly or via harvest/ci-green.
disable-model-invocation: true
---

# TDD cycle

## Fast path

Red → green → refactor for a fixed-scope change; failing test first.

**You get:** Passing tests protecting the scoped change with regression coverage.

**You need:** Known expected behavior, modules touched, and test patterns/fixtures.

**Done when:** Red → green → refactor cycle complete; tests pass; handoff criteria in **Handoff** met.

Referenced by `harvest`, `ci-green`.

## Before red

Know: expected behavior, modules touched, test patterns/fixtures/mocks, level (unit | integration | e2e). Ambiguous → stop, clarify.

## Red

Add/modify tests → run → confirm fail for **right reason**. Meaningful failure; deterministic; no over-mock; keep coverage. Bugfix = repro test; feature = behavior test; refactor = characterization test first.

No impl before failing tests — unless automation impossible (say why).

## Green

Minimal code to pass. Smallest change; match repo patterns; no speculative abstraction. Rerun affected tests; no unrelated regressions.

## Refactor

Tests green → readability, dedupe, naming, structure. Rerun after each meaningful refactor. No coverage drop without reason.

## Handoff

Tests pass; edges covered; regressions protected. No tests added → explain why + alternate verification.
