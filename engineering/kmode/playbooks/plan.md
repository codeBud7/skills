# plan

**Triggers:** seed, write a plan, don't code yet, need approval
**Capabilities:** `readFiles`, `spawn`, `planFile`, `askUser`
**Principles:** smallest-change, exhaust-options, boundary-check
**Mutates:** plan file only
**Verification:** plan file on disk with todos and done criteria; approval gate recorded; no impl

## Stages

1. Invoke `seed`. Discovery via read-only spawn.
2. Options (2–3) + pick. Auth/money/PII/contract risks explicit.
3. Write plan. Wait for approval before any product edit.

## Fallback

No `planFile` → `plans/<slug>.md` plus text gate.

## Terminal

Approved plan path, or `blocked` waiting for the user.
