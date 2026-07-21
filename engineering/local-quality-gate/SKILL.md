---
name: local-quality-gate
description: Local quality gate discovers and runs repo lint, format, typecheck, build, and test until green or blocked. Use before opening a PR, after code changes, or when verifying local checks pass.
---

# Local quality gate

## Fast path

Discover repo checks from `package.json`, CI, `AGENTS.md` → run in order → green or blocked.

**You get:** Lint, format, typecheck, test, and build checks run to green or a clear failure report.

**You need:** A repo with discoverable check commands; code changes to verify.

**Done when:** All relevant checks **pass from execution** or have documented skip + risk; new tests pass isolated + in-suite when added; at least one meaningful check ran for behavior-changing edits. Relevant = changed surface plus repo-required CI parity.

## Gate contract

- **`pass`** — every relevant check executed and green, **or** skip + risk documented per check with at least one executed meaningful verification on the changed surface.
- **`blocked`** — any relevant check failed, or behavior changed with zero executed checks.
- **`not-applicable`** — no behavior change and no repo-required checks apply; state why.
- **Never** report `pass` when every relevant check was skipped. Skip-all = `blocked` unless user explicitly waives with recorded risk.
- Unavailable tooling (missing runner, broken env) → `blocked` with reason — not `pass`.

## Discover

From `package.json`, CI workflows, `AGENTS.md`, `README`, repo scripts — lint, format, typecheck, test, build. Prefer repo-native commands.

## Phases

1. Phase 1: targeted tests (changed behavior), then affected suite.
2. Phase 2: lint, format check, typecheck, and build (if applicable) in parallel when independent.
3. Phase 3: full suite when feasible.

## Parallel subagent

Phase 2 checks may run in terminals or subagents. Main thread merges results and fixes failures.

## On fail

Root cause → minimal fix → rerun affected → rerun impacted surface. Report lint/typecheck failures and new flakiness as blockers until fixed.
