---
name: prototype
description: >
  Prototype spikes two or three approaches against one shared proof command,
  then picks a winner. Use for spikes, throwaways, and "try both."
---

# Prototype

## Fast path

Name options → one proof command → spike each → pick → delete losers unless asked to keep.

**You get:** Receipts per option and a documented winner.

**You need:** A question with more than one plausible shape.

**Done when:** Each option has a short receipt; winner named; no merged compromise.

## Gate contract

- **`pass`** — ≥2 options exercised against the same command; each receipt path and the pick recorded.
- **`blocked`** — only one option built, or no proof command.
- **`not-applicable`** — the path is already known; use `feature`.

## Workflow

1. Isolate if possible (separate dirs/branches). Serial if not; say so.
2. Shared proof command first so comparison is fair.
3. Productionize only via `seed` if the spike graduates.
