# bug

**Triggers:** bug, broken, regression, flake, defect, exception, 500, does nothing, doesn't work
**Capabilities:** `readFiles`, `editFiles`, `runCommand`, `git`, `invokeSkill`
**Principles:** reproduce-first, fix-the-cause, prove-the-artifact, behavior-not-guts, smallest-change
**Mutates:** yes
**Verification:** failing repro exists first; after patch, same command/path is green; `verify` receipt

## Stages

1. Invoke `bugfix`. Reproduce. Confirm fail.
2. If cause unknown, run `investigate` first.
3. `tdd-cycle` with a repro test when automation is possible.
4. Minimal fix. `repo-safety`. `local-quality-gate`. `verify` the user path.
5. Ship only if user asked → `ship` / `harvest`.

## Fallback

Cannot reproduce → `blocked` with what was tried.

## Terminal

Verified patch + receipt, or `blocked`.
