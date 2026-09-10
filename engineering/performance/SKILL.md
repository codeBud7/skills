---
name: performance
description: >
  Performance measures a path, changes the bottleneck, and remeasures the same
  harness. Use for slowness, latency, allocations, and hotspots.
---

# Performance

## Fast path

Baseline command → change the measured bottleneck → same command after → keep both outputs.

**You get:** Before/after numbers from one harness, plus a correctness gate.

**You need:** A slow path you can invoke.

**Done when:** Receipt includes baseline and after; `local-quality-gate` still `pass`; no "feels faster."

## Gate contract

- **`pass`** — same harness run before and after; numbers recorded; correctness checks executed.
- **`blocked`** — no measurable command, or speed "win" with broken tests.
- **`not-applicable`** — investigation-only profile dump with no patch.

## Workflow

1. Write or reuse a timed/profile command. Run it. Save output.
2. Change the owner of the cost. Smallest change.
3. Re-run. If the number did not move, revert the guess.
4. `verify` or tests so behavior did not regress.
