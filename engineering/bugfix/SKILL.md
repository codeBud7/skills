---
name: bugfix
description: >
  Bugfix reproduces a defect, traces the cause, applies a minimal patch, and
  proves the same path is green. Use for bugs, regressions, and flakes.
---

# Bugfix

## Fast path

Reproduce fail → find cause → failing test if possible → smallest patch → same path green → receipt.

**You get:** A scoped fix with a receipt, not a symptom wrapper.

**You need:** A defect description or failing command; repo write access.

**Done when:** Repro existed before the patch; cause named; `verify` or equivalent executed green; `repo-safety` held.

## Gate contract

- **`pass`** — pre-patch fail observed; post-patch same command/path green; receipt on disk.
- **`blocked`** — cannot reproduce, cause unknown after investigate, or proof missing.
- **`waived`** — user accepted a named gap (e.g. no automated test) **and** a manual receipt exists.

## Workflow

1. Reproduce. No repro → `blocked` or `investigate`.
2. `tdd-cycle` when a test can lock the fail. Else name why and still capture a command.
3. Patch the owner of the broken invariant. No catch-all, no extra timeout-as-fix.
4. `local-quality-gate`. `verify` the user path.
5. Ship only if asked (`harvest`).
