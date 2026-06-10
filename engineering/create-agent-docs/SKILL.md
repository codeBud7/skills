---
name: create-agent-docs
description: >-
  Set up or improve a repo's AGENTS.md and docs/ to a consistent layout for
  humans and coding agents (agents.md-style entry + architecture, runbook,
  decisions under docs/). Read-only first, change plan for approval, Markdown
  docs only. Triggers: @create-agent-docs | setup agent docs | agent docs layout.
disable-model-invocation: true
---

# Create agent docs

Triggers: `@create-agent-docs` | setup agent docs | improve `AGENTS.md` / `docs/`.

Bring a repo in line with this **core agent-docs layout**: check what exists, add gaps, tidy links. New repo → create from templates; existing repo → keep real content, fill gaps, move misplaced files. Output is portable Markdown ([agents.md](https://agents.md/) shape + Diátaxis-style `docs/` + ADR log). **Markdown only** — no source, no build config edits. Does not replace [docs-sync](../docs-sync/SKILL.md) on a feature branch (that skill is for drift vs diff before ship); this skill is for **standing structure** of agent/human docs.

**Hard gate:** Do not move, delete, or overwrite any existing file until step 2 is approved. New files on an empty repo are fine; still summarize. Ground claims in what you read; use `TODO` + ask when you cannot infer. Do not commit or open a PR unless the user asks.

Always use the AskQuestion tool when you need a structured choice.

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

## Workflow

Complete in order:

1. **Explore** — Read-only. Inventory `AGENTS.md`, `CLAUDE.md`, `.cursorrules`, `README.md`, `CONTRIBUTING.md`, `docs/`, stray top-level `*.md`. Classify empty / partial / off-standard. Note oversized `AGENTS.md` (split targets). Pull evidence for "what this repo is" (README, manifests, CI, layout).
2. **Plan** — Say what you will create, move, link, split, or leave untouched. Approval before any destructive or overwrite op.
3. **Apply** — Use [`templates/`](templates/) and **Authoring rules** below. Add read order to `AGENTS.md`; link every `docs/*.md` from it. Idempotent on a conforming repo.
4. **Review gate** — Show diffs; revise on request; **do not commit** unless asked.

### Authoring rules

- **`AGENTS.md`:** Real content from repo evidence, not an all-`TODO` shell.
- **Core `docs/`:** Skeletons + fill what the repo proves; `TODO` where unknown.
- **Existing files:** Edit in place, fix links, move if misplaced; do not wipe content.
- **Long `AGENTS.md`:** Split into the right `docs/` file; leave links; preserve moved headings when appending.

## Templates

| Template | Target |
|----------|--------|
| [`templates/AGENTS.md`](templates/AGENTS.md) | `AGENTS.md` |
| [`templates/ARCHITECTURE.md`](templates/ARCHITECTURE.md) | `docs/architecture.md` |
| [`templates/RUNBOOK.md`](templates/RUNBOOK.md) | `docs/runbook.md` |
| [`templates/DECISIONS.md`](templates/DECISIONS.md) | `docs/decisions.md` |

If a target file already exists with its own structure, keep it; the standard cares about presence, path, links, and purpose.

## Self-check (before review gate)

- No overwrite/delete without approval.
- No invented architecture, decisions, or ops; gaps are `TODO`.
- New `AGENTS.md` grounded (summary, folder map, commands), not empty shells.
- `AGENTS.md` has read order, ~≤150 lines, states docs stay current with code.
- Every `docs/` file linked from `AGENTS.md`.
- Only Markdown docs touched.
- Re-run would be ~no-op; CI rules not duplicated into prose.

## References

- [agents.md](https://agents.md/)
- [Diátaxis](https://www.diataxis.fr/)
- [MADR / ADR](https://adr.github.io/madr/)
