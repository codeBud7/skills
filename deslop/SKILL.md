---
name: deslop
description: >-
  Removes code bloat: trims redundant or AI-ish comments, aligns style with each
  file, prunes inner-layer defensive bloat and odd try/catch only when clearly
  redundant, merges duplicate tests, simplifies TypeScript (no as-any; avoid cast
  gymnastics). Prefers if/early return over nested ternary. Framework-agnostic.
  Use when the user says or writes the command deslop.
disable-model-invocation: true
---

# Deslop

**deslop** = leaner code, **same behavior** unless user says otherwise. **Minimal diff**; no unrelated modules or repo-wide style passes.

## Workflow

1. Skim **whole target file** — set “normal” for comments, guards, errors, TS style in *this* file.
2. Classify each smell: **comment noise** | **defense/error bloat** | **test duplication** | **TS slop** | **control flow** | **dead code**.
3. Apply rules below; **default keep** when not obvious.
4. Run **project checks** for touched code (tests/lint/typecheck if available); fix what breaks.
5. **Summarize**: what removed/simplified + what skipped as risky.

## Scope

- **Framework-agnostic** — no stack assumptions unless files show them.
- **Local consistency** — touched code matches **neighbors in the same file** (patterns, validation depth, error style).

## Comments

- **Delete**: restates code; section banners with no signal; **AI filler** or tone mismatched to file; duplicate doc above same code; mixed language without local precedent.
- **Keep**: non-obvious **why**, invariants, security/perf, ticket/spec pointers with substance.
- Prefer **delete whole block** over trimming word-by-word.

## Defense and errors

- **Remove guards / broad catches** only when **evidence in this file** shows redundancy: e.g. same check repeated, impossible branch after typed narrow, inner private fn while **callers already validate** and siblings don’t re-validate. If caller proof **not** visible here → **keep**.
- **Remove try/catch** (or **narrow catch**) when peers use simpler flow **and** catch only logs/rethrows generically without recovery; **keep** for I/O, parse, network, user/plugin boundaries.
- **Never strip** user/network/fs/public API/plugin surfaces to “clean up”.

## Tests

- **No new test sprawl**; when editing tests, **merge/delete** obvious duplicates (same branch/assert path). **Keep** unique regression/branch cover. **If unsure → keep.**

## TypeScript (`.ts` / `.tsx`)

- **Ban `as any`** (incl. chained) to silence errors — fix source types, **boundary type**, typed helper, or **type guard**.
- **OK**: `unknown` in → **narrow** with guard, schema parse, or discriminant; single-hop assert only **right after** proven narrow (same fn).
- **Avoid**: `as unknown as T`, long generic/cast pipelines, conditional types used once to “look clever”. **Keep** real safety types (exhaustive unions, branded ids); simplify only when easy.

## Control flow

- Prefer **`if` / `switch` / early return** over nested ternary. Prefer **named locals** over dense one-liners. Drop **dead code**, unused imports, debug leftovers in touched areas.

## Micro-examples (calibration)

**Comments** — delete:

```ts
// This function adds a and b together
return a + b;
```

**Guards** — delete inner duplicate if file already ensures non-null above:

```ts
if (!items.length) return;
if (!items) return; // redundant
```

**TS** — delete `any` escape; replace with narrow:

```ts
// bad: (data as any).id
// good: typed parse + guard, or schema validation → typed value
```

## Done when

Noise down; behavior unchanged; types honest (**no `any` silencing**); tests still meaningful; **skipped items** named if risky.
