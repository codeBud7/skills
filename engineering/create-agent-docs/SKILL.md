---
name: create-agent-docs
description: Set up or improve a repo's AGENTS.md and docs/ to a consistent layout for humans and coding agents (agents.md-style entry + architecture, runbook, decisions under docs/). Read-only first, change plan for approval, Markdown docs only. Use when setting up or improving agent docs. Triggers: "@create-agent-docs", "setup agent docs", "agent docs layout".
disable-model-invocation: true
---

# Create agent docs

## Fast path

Read-only inventory → **Plan** (approval) → apply from [`templates/`](templates/) per [reference.md](reference.md) → review gate; no commit unless asked.

Triggers: `@create-agent-docs` | setup agent docs | improve `AGENTS.md` / `docs/`.

Bring a repo in line with this **core agent-docs layout**: check what exists, add gaps, tidy links. New repo → create from templates; existing repo → keep real content, fill gaps, move misplaced files. Output is portable Markdown ([agents.md](https://agents.md/) shape + Diátaxis-style `docs/` + ADR log). **Markdown only** — no source, no build config edits. Does not replace [docs-sync](../docs-sync/SKILL.md) on a feature branch (that skill is for drift vs diff before ship); this skill is for **standing structure** of agent/human docs.

**Hard gate:** Do not move, delete, or overwrite any existing file until step 2 is approved. New files on an empty repo are fine; still summarize. Ground claims in what you read; use `TODO` + ask when you cannot infer. Do not commit or open a PR unless the user asks.

Always use the AskQuestion tool when you need a structured choice.

Layout, tables, self-check, templates: **[reference.md](reference.md)**.

**You get:** Repo `AGENTS.md` + `docs/` aligned to the agent-docs layout with gaps filled from templates.

**You need:** Target repo; user approval before destructive or overwrite ops.

**Done when:** Explore → approved plan → apply → review gate complete; [reference.md](reference.md) **Self-check** bullets satisfied; only Markdown docs touched unless user asked otherwise.

**Templates:** [`templates/`](templates/)

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

## References

- [agents.md](https://agents.md/)
- [Diátaxis](https://www.diataxis.fr/)
- [MADR / ADR](https://adr.github.io/madr/)
