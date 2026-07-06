---
name: grill-with-docs
description: Grill with docs challenges the user's plan against the existing domain model, sharpens terminology, and updates `CONTEXT.md` or ADRs as decisions crystallise. Use when the user asks for docs, domain language, glossary, or documented decisions while grilling a plan.
---

# Grill with docs

## Fast path

One question at a time → challenge plan against domain model and `CONTEXT.md` → update docs inline as terms resolve.

**You get:** Shared understanding with sharpened terminology; `CONTEXT.md` updated inline; ADRs when warranted.

**You need:** A plan to stress-test; repo with discoverable code and optional existing `CONTEXT.md` / ADRs.

**Done when:** Plan branches are resolved or explicitly deferred; terminology conflicts are resolved or logged; `CONTEXT.md` edits match resolved terms per [CONTEXT-FORMAT.md](CONTEXT-FORMAT.md); ADRs offered only when [ADR-FORMAT.md](ADR-FORMAT.md) criteria hold.

**References:** [CONTEXT-FORMAT.md](CONTEXT-FORMAT.md), [ADR-FORMAT.md](ADR-FORMAT.md)

## During

Follow the `grill-me` session loop: one question at a time, recommended answer included, codebase consulted where it can answer. Add the doc-specific checks below before ending.

## Supporting info

### Domain awareness

During codebase exploration, also look for existing documentation. File layout and lazy-create rules live in [CONTEXT-FORMAT.md](CONTEXT-FORMAT.md) and [ADR-FORMAT.md](ADR-FORMAT.md).

### During the session

#### Challenge against the glossary

When the user uses a term that conflicts with the existing language in `CONTEXT.md`, call it out immediately. "Your glossary defines 'cancellation' as X, but you seem to mean Y — which is it?"

#### Sharpen fuzzy language

When the user uses vague or overloaded terms, propose a precise canonical term. "You're saying 'account' — do you mean the Customer or the User? Those are different things."

#### Discuss concrete scenarios

When domain relationships are being discussed, stress-test them with specific scenarios. Invent scenarios that probe edge cases and force the user to be precise about the boundaries between concepts.

#### Cross-reference with code

When the user states how something works, check whether the code agrees. If you find a contradiction, surface it: "Your code cancels entire Orders, but you just said partial cancellation is possible — which is right?"

#### Update CONTEXT.md inline

When a term is resolved, update `CONTEXT.md` right there. Capture resolved terms as they happen. Use the format in [CONTEXT-FORMAT.md](./CONTEXT-FORMAT.md).

`CONTEXT.md` is glossary-only: project terms, canonical names, and avoided synonyms; implementation decisions belong in ADRs.

#### Offer ADRs sparingly

Offer ADRs only per [ADR-FORMAT.md](./ADR-FORMAT.md).
