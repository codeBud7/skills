---
name: architect
description: >
  Architect compares design options and writes a decision, without implementing.
  Use for structure, boundaries, and "how should we build this."
---

# Architect

## Fast path

Constraints from the repo → 2–3 options → pick with explicit criterion → write it down.

**You get:** A design note or `seed` plan, not a product patch.

**You need:** A design question; read access.

**Done when:** Options and pick are on disk or in the plan file; impl has not started.

## Gate contract

- **`pass`** — artifact path recorded; at least two options, one pick, tradeoffs named.
- **`blocked`** — constraints missing and user did not answer.
- **`not-applicable`** — user already has an approved plan and wants code (`feature` / `harvest`).

## Workflow

1. Read AGENTS/CLAUDE/README and existing types.
2. Compare proof cost, failure modes, and scope — not slogans.
3. If they want it built: hand off to `seed` (approval) then `feature`.
