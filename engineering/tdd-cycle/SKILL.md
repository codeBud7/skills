---
name: tdd-cycle
description: Implement a fixed-scope change via strict red, green, refactor TDD. Use when adding a feature, fixing a bug, or refactoring test-first, or when CI reveals missing coverage. Referenced by harvest and ci-green.
disable-model-invocation: true
---

# TDD cycle

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
