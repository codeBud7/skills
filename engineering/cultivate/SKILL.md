---
name: cultivate
description: Cultivate deslops AI code after implementation: trim noise, match file style, keep honest TypeScript, merge duplicate tests, preserve behavior. Use when code needs deslop cleanup after local checks are green.
---

# Cultivate

## Fast path

After code complete and local checks green: locate smells in touched files → minimal edits preserving behavior → re-run targeted tests/lint.

**Same behavior** unless user says else. Minimal diff; no repo-wide style pass.

**You get:** Cleaner touched code with same behavior — noise down, style matched, no `any` silencing.

**You need:** Code complete and local checks green on touched files.

**Done when:** Touched files have obvious noise removed; behavior-preserving diff only; no new `any` or skipped tests; targeted tests/lint **re-executed** after edits (or skip + risk with at least one other executed check on touched code); risky cleanup left in place is named.

## Gate contract

- **`pass`** — deslop edits made (or legitimately none needed); post-edit verification executed on touched surface.
- **`blocked`** — edits made but re-verification failed, or edits made with zero executed checks.
- **`not-applicable`** — no cultivate edits needed; state why (already clean / no touched smells).
- Skip re-run only with documented reason + risk; skip-all after behavior-touching edits = `blocked`.

## Workflow

1. Skim whole target file — set local norm (comments, guards, errors, TS); optional read-only subagent returns smell map per file.
2. Classify smells; **default keep** when not obvious.
3. Apply rules; run tests/lint/typecheck for touched code.
4. Optional review subagent verifies behavior preserved and no boundaries stripped.
5. Summarize: removed/simplified + skipped (risky).

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
