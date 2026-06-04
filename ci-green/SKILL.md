---
name: ci-green
description: Watch PR CI, triage failures, fix, and push until checks are green or blocked. Use when getting CI green, when PR checks fail, or after pushing a branch with required checks. Referenced by harvest.
disable-model-invocation: true
---

# CI green

## Monitor

```bash
gh pr checks --watch
# or
gh pr view --json statusCheckRollup,url
```

Until required checks green.

## On fail

1. inspect checks + logs
2. **Delegate** read-only subagent: dig logs (`gh run view`, `gh run list`), return root cause + repro hints
3. main thread: repro local if possible → minimal fix → local checks → commit → push → re-monitor

Loop until green | blocked | user stops.

## TDD gap

Missing coverage from CI → see `tdd-cycle` (failing test first). No blind patch.

## Flaky

Gather evidence, selective rerun, document instability. Don't hide real failures.

## Stop

CI infra down | creds missing | third-party outage | can't repro local — report clear.
