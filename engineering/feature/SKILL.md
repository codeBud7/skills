---
name: feature
description: >
  Feature implements a product slice with tests and user-path proof. Use for
  new behavior after an approved plan, or a tiny obvious slice the user scoped.
---

# Feature

## Fast path

Confirm scope → per-slice TDD → implement → local gate → verify user path.

**You get:** New behavior with tests and a receipt.

**You need:** Approved `seed` plan, or a user-scoped slice small enough to skip planning (one obvious behavior).

**Done when:** Each slice has executed tests and user-path proof (or `not-applicable` why); scope did not grow silently.

## Gate contract

- **`pass`** — behavior exists; `tdd-cycle` and `verify` (or named test that is the user path) executed.
- **`blocked`** — no plan for multi-file work, tests/proof missing, or scope grew.
- **`not-applicable`** — user asked design-only (`architect` / `seed`).

## Workflow

1. Multi-file or risky → require approved plan. Else proceed.
2. `repo-safety` continuous.
3. Slice loop: red → green → refactor → `local-quality-gate` → `verify`.
4. UI: drive the real surface. Screenshot is not enough.
5. User wants PR → `harvest`.
