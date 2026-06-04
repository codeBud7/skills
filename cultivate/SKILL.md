---
name: cultivate
description: Deslop AI code — trim noise, match file style, honest TS, merge dup tests; same behavior. Use when the user says deslop, or as the harvest post-impl cleanup step after code is complete and local checks are green.
disable-model-invocation: true
---

# Cultivate

Trigger: deslop. **Same behavior** unless user says else. Minimal diff; no repo-wide style pass.

## Subagents

- **Locate** — read-only subagent: smell map per file (comment | defense | test dup | TS | control flow | dead).
- **Review** (optional) — subagent verify diff: behavior preserved, no stripped boundaries.

Main thread: edits + project checks.

## Workflow

1. Skim whole target file — set local norm (comments, guards, errors, TS).
2. Classify smells; **default keep** when not obvious.
3. Apply rules; run tests/lint/typecheck for touched code.
4. Summarize: removed/simplified + skipped (risky).

## Scope

Framework-agnostic. Match **neighbors in same file**.

## Comments

Delete: restates code; empty banners; AI filler; duplicate doc; mixed language w/o precedent.
Keep: non-obvious why, invariants, security/perf, substantive ticket/spec refs.
Prefer delete whole block.

## Defense & errors

Remove guards/catches only with **file evidence** (duplicate check, impossible branch, inner fn while callers validate). No caller proof here → keep.
Remove try/catch when peers simpler and catch only logs/rethrows — no recovery. Keep: I/O, parse, network, user/plugin/API boundaries.

## Tests

Merge/delete obvious dupes (same branch/assert). Keep unique regression cover. Unsure → keep.

## TypeScript

Ban `as any` — fix types, boundary type, guard, schema. OK: `unknown` + narrow; single-hop assert after proven narrow. Avoid `as unknown as T`, cast pipelines, one-off clever generics. Keep real safety types.

## Control flow

`if` / `switch` / early return over nested ternary. Named locals over dense one-liners. Drop dead code, unused imports, debug in touched areas.

## Micro-examples

Comments — delete:

```ts
// This function adds a and b together
return a + b;
```

Guards — delete inner duplicate if file already ensures non-null above:

```ts
if (!items.length) return;
if (!items) return; // redundant
```

TS — delete `any` escape; narrow instead:

```ts
// bad: (data as any).id
// good: typed parse + guard, or schema validation → typed value
```

## Done

Noise down; behavior unchanged; no `any` silencing; tests meaningful; risky skips named.
