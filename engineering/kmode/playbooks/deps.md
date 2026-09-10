# deps

**Triggers:** upgrade X, bump dependencies, is this bump safe
**Capabilities:** `readFiles`, `runCommand`, `git`, `invokeSkill`
**Principles:** smallest-change, reproduce-first, prove-the-artifact
**Mutates:** yes unless assessment-only
**Verification:** `local-quality-gate` executed; `ci-green` after push; `verify` if runtime behavior changed

## Stages

1. Invoke `dep-upgrade` assess.
2. Assessment-only → evidence report; stop.
3. Trivial → inline bump. Risky → `plan` then `ship`.
4. Package manager updates the lockfile. Never hand-edit.

## Fallback

No package manager → `blocked`.

## Terminal

`dep-upgrade` gate, or `harvest` handoff for risky bumps.
