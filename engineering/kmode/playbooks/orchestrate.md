# orchestrate

**Triggers:** many independent units, program of work, durable orchestration, swarm the backlog
**Capabilities:** `readFiles`, `editFiles`, `spawn`, `waitAgent`, `git`
**Principles:** no-shared-mutable, one-check-per-slice, guard-context, prove-the-artifact
**Mutates:** ledger files; code only inside child units
**Verification:** each unit has a `receipt_path` before `pass`; ledger `status.md` derived, not hand-waved

## Stages

1. Invoke `orchestrate` skill. Init host-neutral store (units, ledger, decisions, receipts).
2. Split work into independently provable units. No two writers on one mutable tree.
3. Spawn units with isolation. Wait. Inspect artifacts, not child summaries.
4. Record pass/blocked per unit. Do not mark the program done with open `blocked`.

## Fallback

No `spawn` → serialize units on the main thread; still one receipt per unit.

## Terminal

`status.md` (or equivalent) with every unit `pass` / `blocked` / `waived`, plus receipt paths.
