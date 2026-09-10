# ship

**Triggers:** harvest, ship it, open draft PR, execute the approved plan
**Capabilities:** `readFiles`, `editFiles`, `runCommand`, `git`, `openPullRequest`, `watchChecks`, `invokeSkill`
**Principles:** one-check-per-slice, prove-the-artifact, behavior-not-guts, smallest-change
**Mutates:** yes
**Verification:** harvest gates plus `verify` when tests did not drive the user path

## Stages

1. Confirm plan approved per `seed`.
2. Invoke `harvest`. Do not merge unless user said so.
3. After each impl slice: `tdd-cycle` + `local-quality-gate`; `verify` if the observable path is untested.
4. Stop on any `blocked`. Never imply green checks that were not executed.

## Fallback

No `openPullRequest` → stop after local proof; leave commits unpushed; `blocked` on PR.

## Terminal

`harvest` done when, or `blocked` with the failing gate.
