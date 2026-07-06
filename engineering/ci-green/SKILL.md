---
name: ci-green
description: CI green watches PR checks, triages failures, fixes, and pushes until required checks are green or clearly blocked. Use when PR checks fail or after pushing a branch with required checks.
---

# CI green

## Fast path

`gh pr checks --watch` → on fail dig logs, minimal fix, push → loop until green or blocked.

**You get:** Required PR checks green or a clear blocked report.

**You need:** An open PR with required CI checks; `gh` access.

**Done when:** Required PR checks green, or **Stop** conditions reported with clear user-visible status (blocked, not hidden).

## Monitor

```bash
gh pr checks --watch
# or
gh pr view --json statusCheckRollup,url
```

## On fail

1. inspect checks + logs
2. **Delegate** read-only subagent: dig logs (`gh run view`, `gh run list`), return root cause + repro hints
3. main thread: repro local if possible → minimal fix → local checks → commit → push → re-monitor

Loop until green | blocked | user stops.

## TDD gap

Missing coverage from CI → see `tdd-cycle` (failing test first). No blind patch.

## Flaky

Gather evidence, selectively rerun, and report real failures or instability in blocked status.

## Stop

CI infra down | creds missing | third-party outage | can't repro local — report clear.
