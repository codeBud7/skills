---
name: refactor
description: >
  Refactor changes shape without changing behavior. Use when the user wants
  extract, rename structure, or cleanup with the same observables.
---

# Refactor

## Fast path

Characterization coverage → subtract dead code → reshape → same tests green.

**You get:** A behavior-preserving diff with executed proof.

**You need:** Existing tests or a harness; a bounded area.

**Done when:** Before/after the same suite (or harness) is green; no feature added.

## Gate contract

- **`pass`** — suite or harness executed before and after; behavior match.
- **`blocked`** — no proof and no user waiver; or tests failed after.
- **`waived`** — user accepted a named manual proof in a `verify` receipt.

## Workflow

1. If tests are thin, add characterization tests first (`tdd-cycle`).
2. Subtract obsolete code. Then move types/functions.
3. `cultivate` on touched files only.
4. New behavior leaking in → stop and reclassify as `feature`.
