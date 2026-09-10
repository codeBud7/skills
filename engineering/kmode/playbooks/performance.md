# performance

**Triggers:** slow, latency, alloc, p99, profile, hotspot
**Capabilities:** `readFiles`, `editFiles`, `runCommand`, `git`
**Principles:** reproduce-first, prove-the-artifact, smallest-change, fix-the-cause
**Mutates:** yes after a measured baseline
**Verification:** before/after numbers from the same harness; no "feels faster"

## Stages

1. Invoke `performance`. Baseline the slow path with a command.
2. Change the bottleneck, not a nearby guess.
3. Re-run the same harness. Keep both outputs in the receipt.
4. `local-quality-gate` so correctness did not die for speed.

## Fallback

No profiler → still require a timed user-path command. Missing both → `blocked`.

## Terminal

Receipt with baseline and after, or `blocked`.
