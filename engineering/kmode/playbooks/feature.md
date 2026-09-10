# feature

**Triggers:** add, implement, new endpoint, new UI, product slice
**Capabilities:** `readFiles`, `editFiles`, `runCommand`, `git`, `invokeSkill`, `browserDrive` (if UI)
**Principles:** smallest-change, name-the-domain, boundary-check, one-check-per-slice, prove-the-artifact, behavior-not-guts
**Mutates:** yes
**Verification:** `tdd-cycle` plus `verify` of the user path; UI needs a real drive, not a screenshot alone

## Stages

1. No approved plan and the slice is more than one file of obvious work → `plan` first.
2. Invoke `feature`. `repo-safety` continuous.
3. Per slice: `tdd-cycle` → implement → `local-quality-gate` → `verify`.
4. User asked to ship → `ship`.

## Fallback

No `browserDrive` on a UI feature → use project harness or `blocked` on user-path proof.

## Terminal

Verified patch + receipt, `harvest` handoff, or `blocked`.
