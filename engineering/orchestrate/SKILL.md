---
name: orchestrate
description: >
  Orchestrate runs a program of independent units with a durable ledger and
  per-unit proof. Use when work is too large for one harvest slice.
disable-model-invocation: true
---

# Orchestrate

## Fast path

Init store → split independently provable units → isolate → spawn or serialize → inspect artifacts → derive status.

**You get:** A ledger where every `pass` has a receipt path.

**You need:** A program of work (many units), not a single-file fix.

**Done when:** Every unit is `pass`, `blocked`, or `waived`; `status.md` matches `units.tsv`; no `in_progress` left unless paused via `handoff`.

## Gate contract

- **`pass`** — all units terminal; each `pass` has a receipt; no shared-mutable overlap while in flight.
- **`blocked`** — a unit failed proof, isolation was violated, or the store is corrupt.
- **`not-applicable`** — a single route (`bugfix`, `feature`, `harvest`) is enough.

## Workflow

1. Create `kmode-orch/<slug>/` per [schemas.md](../kmode/orchestration/schemas.md).
2. Units must be independently provable. If A must finish before B, sequence them; do not fake parallelism.
3. Spawn with isolation when `spawn` exists. Else one unit at a time on the main thread.
4. Verify by reading receipts and diffs, not child summaries.
5. Pause → `handoff` writes `pause.md`. Do not leave dirty units without a note.

## Stop

Never merge child branches unless the user asked. Never mark `pass` with an empty `receipt_path`.
