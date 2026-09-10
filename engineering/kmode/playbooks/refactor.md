# refactor

**Triggers:** refactor, extract, rename structure, same behavior cleaner
**Capabilities:** `readFiles`, `editFiles`, `runCommand`, `git`
**Principles:** subtract-first, smallest-change, behavior-not-guts, prove-the-artifact
**Mutates:** yes
**Verification:** characterization tests or existing suite executed before and after; behavior receipt

## Stages

1. Invoke `refactor`. Characterization coverage first if tests are thin.
2. Subtract dead code. Then reshape.
3. Re-run the same tests. `cultivate` only on touched files.
4. No feature add in this route. New behavior → `feature`.

## Fallback

No tests and no harness → `blocked` unless user waives with risk **and** a named manual proof.

## Terminal

Verified patch with same-behavior proof, or `blocked`.
