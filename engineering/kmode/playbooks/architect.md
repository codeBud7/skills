# architect

**Triggers:** design, architecture, options for, how should we structure
**Capabilities:** `readFiles`, `spawn`, `planFile`, `askUser`
**Principles:** exhaust-options, name-the-domain, boundary-check, illegal-states
**Mutates:** plan or design note only
**Verification:** written options with tradeoffs; pick recorded; no silent impl

## Stages

1. Invoke `architect`. Map constraints from repo docs.
2. Two or three designs. Compare proof cost, failure, scope.
3. If the user wants it built → `plan` then `feature` / `ship`.

## Fallback

No `planFile` → chat + `plans/<slug>.md`.

## Terminal

Design note or `seed` plan, unapproved for impl until the plan gate.
