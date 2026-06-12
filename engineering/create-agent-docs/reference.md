# Create agent docs — standard layout and self-check

## Standard (core)

| Artifact | Role |
|----------|------|
| `AGENTS.md` | Entry point: what this repo is, read order, folder map, rules, gotchas. Single source of truth; ~≤150 lines; push component detail to `docs/architecture.md`. |
| `docs/architecture.md` | System shape: components, data flow, key modules, how to build/regenerate. |
| `docs/runbook.md` | Operations: auth, secrets, env, run/deploy, common failures. |
| `docs/decisions.md` | ADR-style log ([MADR](https://adr.github.io/madr/)): id, date, owner, status, context, decision, consequences. Do not rewrite accepted entries; supersede. |

**Layout (required):**

```text
AGENTS.md
docs/
  architecture.md
  runbook.md
  decisions.md
```

**Optional under `docs/`:** e.g. `context.md`, `todo.md`, or other `*.md` — must be linked from `AGENTS.md`.

**Conventions:** Contract = which paths exist, what each is for, and links from `AGENTS.md`, not exact headings inside files. No tool-specific instruction files (`CLAUDE.md`, `.cursorrules`, copilot-instructions); consolidate into `AGENTS.md` with user OK. Decisions carry **date** + **owner**; do not invent — `TODO` + ask. Link README/CI instead of duplicating. Same core layout for all repo types in v1. Monorepos: nested `AGENTS.md` where a sub-package really differs; root links to them.

## Self-check (before review gate)

- No overwrite/delete without approval.
- No invented architecture, decisions, or ops; gaps are `TODO`.
- New `AGENTS.md` grounded (summary, folder map, commands), not empty shells.
- `AGENTS.md` has read order, ~≤150 lines, states docs stay current with code.
- Every `docs/` file linked from `AGENTS.md`.
- Only Markdown docs touched.
- Re-run would be ~no-op; CI rules not duplicated into prose.

## Templates

| Template | Target |
|----------|--------|
| [`templates/AGENTS.md`](templates/AGENTS.md) | `AGENTS.md` |
| [`templates/ARCHITECTURE.md`](templates/ARCHITECTURE.md) | `docs/architecture.md` |
| [`templates/RUNBOOK.md`](templates/RUNBOOK.md) | `docs/runbook.md` |
| [`templates/DECISIONS.md`](templates/DECISIONS.md) | `docs/decisions.md` |

If a target file already exists with its own structure, keep it; the standard cares about presence, path, links, and purpose.
