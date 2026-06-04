---
name: local-quality-gate
description: Discover and run repo lint, format, typecheck, build, and test until green or blocked. Use before opening a PR, after code changes, or when verifying local checks pass. Referenced by harvest and docs-sync.
disable-model-invocation: true
---

# Local quality gate

## Discover

From `package.json`, CI workflows, `AGENTS.md`, `README`, repo scripts — lint, format, typecheck, test, build. Prefer repo-native commands.

## Order

1. targeted tests (changed behavior)
2. affected suite
3. lint
4. format check
5. typecheck
6. build (if applicable)
7. full suite (if feasible)

## Parallel subagent

Steps 3–6 independent of targeted tests → run parallel (terminals or subagent) while 1–2 run. Main thread merges results, fixes failures.

## On fail

Root cause → minimal fix → rerun affected → rerun impacted surface. Don't ignore lint/typecheck/new flakiness.

## Done

All relevant checks pass; new tests pass isolated + in-suite. Skipped → say why + risk.
