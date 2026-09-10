---
name: investigate
description: >
  Investigate locates code, reproduces failures, and reports evidence without
  mutating product code. Use for why/where/how, root cause, and call graphs.
---

# Investigate

## Fast path

Split the question → parallel read-only search → reproduce if a fail is claimed → evidence report. No product patch.

**You get:** Path:line findings, commands run, and a confidence-labelled cause or map.

**You need:** A question about the repo or a claimed failure.

**Done when:** Report delivered; no product files edited; next-route suggestion only if asked.

## Gate contract

- **`pass`** — evidence report with paths and commands; repro captured when a fail was claimed.
- **`blocked`** — cannot read the repo, or claimed fail could not be attempted at all.
- **`not-applicable`** — user already named the exact file:line and only wants a patch (`bugfix`).

## Workflow

1. Guard context: spawn read-only children for defs vs callers vs tests when the search is wide.
2. Findings format: `path:line` — `symbol` — short note.
3. If they claimed a bug: run the failing command before theorizing.
4. Do not fix in this skill. Chain `bugfix` only when the user asked for a fix and the cause is named.

## Output

```markdown
## Findings
- path:line — `symbol` — note

## Repro
`<command>` → <observed>

## Confidence
high | medium | low — <why>
```
