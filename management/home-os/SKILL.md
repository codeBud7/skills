---
name: home-os
description: Set up or update a private management Home OS with EM context, source links (meeting notes, Linear, GitHub, Slack pointers), direct profiles, and optional career ladder. Use when the user wants to create manager/team context, add or update a direct profile, configure management source links, seed expectations/ladder.md, or prepare shared context for 1:1, review prep, growth plan, hiring feedback, strategy skills, or brag-doc (Me subsections in sources.md and optional expectations.md). Triggers: "set up my Home OS", "add a direct profile for ...", "update my source links", "set up career ladder".
---

# Home OS

## Fast path

Create private root → seed `context.md`, `sources.md`, `directs/<slug>.md` from templates → write `Path:` under `## Private Root` in `sources.md`. Workflow, timelines, profile fields, tone: [reference.md](reference.md).

**You get:** A private Home OS tree (`context.md`, `sources.md`, `directs/<slug>.md`, templates) with a recorded **Path:** so every downstream management skill resolves the same root.

**You need:** Rough team and direct notes; optional source links (never secrets in git).

**Done when:** Private root exists with `context.md`, `sources.md`, at least one `directs/<slug>.md` sufficient for **`1on1`**, and canonical `Path:` recorded; unknown root is never written without confirmation; checklist in [reference.md](reference.md) satisfied.

**Templates:** [`context.template.md`](context.template.md), [`direct.template.md`](direct.template.md), [`sources.template.md`](sources.template.md), [`ladder.template.md`](ladder.template.md)

Create and maintain private manager/team context. Public repo files are only skill instructions and blank templates. Real people data, source links, generated briefs, and sensitive notes stay outside git.

Private Home OS data lives at one shared root outside git, default `~/.agents/management/home-os`. Use the same root from Cursor, Claude, or any other host.

Path resolution order for all management skills:

1. `Path:` under `## Private Root` in private `sources.md` — canonical once set
2. Default `~/.agents/management/home-os` if that directory exists
3. Ask the user before first write if still unknown

On first setup: create the private root, seed files from git templates, and write the resolved path into `sources.md` under `## Private Root` → `Path:`.

## MCP and source retrieval boundaries

Downstream management skills (`1on1`, `review-prep`, `strategy-brief`, `brag-doc`, `hiring-feedback`) **must not repeat** long variants of these rules — they point here and add only **skill-specific deltas** in their own `SKILL.md`.

- **Private root:** Always use the **Path resolution order** above.
- **Prefer MCP** for each linked system when the host exposes it.
- **GitHub:** If GitHub MCP is unavailable, use explicit links from `sources.md` / `directs/<slug>.md` or read-only `gh` as fallback.
- **Slack:** Only read channels and threads listed under **Slack scope** in `sources.md` or in `directs/<slug>.md` (see `sources.template.md` / `direct.template.md`). Prefer **channel or thread reads** over workspace-wide search. Use Slack MCP when configured; if Slack MCP is unavailable and the user did not paste an export, skip Slack and note the gap in `Missing context` or ask for a thread link. Do **not** expand Slack scope beyond configured links without an explicit user ask.

**Skill-specific deltas** (document only in that skill): **`brag-doc`** — `### Me` scope, Notion search cap, DMs off unless explicitly listed under Me. **`hiring-feedback`** — no external candidate lookup; pasted interview evidence and private rubric only. **`strategy-brief`** — do not build a roadmap from Linear alone; require decision, audience, and constraints.

## Storage Boundary

Default private root: `~/.agents/management/home-os`. Override only when the user specifies a different path. If no root is known, ask before writing.

Private layout:

```text
context.md
sources.md
expectations.md
expectations/ladder.md
directs/<slug>.md
hiring/rubrics/<role-slug>.md
outputs/YYYY-MM-DD-workflow-slug.md
```

`expectations.md` is optional; create it when using `brag-doc` (criteria or `## Status: declined`). `expectations/ladder.md` is optional; seed from [`ladder.template.md`](ladder.template.md) when setting up leveling for directs — `review-prep` and `growth-plan` read it. `hiring/rubrics/` is created on first write; `hiring-feedback` owns rubric content. `home-os` seeds context, sources, direct profiles, and optionally the career ladder.

Never write filled direct profiles, sensitive notes, generated prep briefs, HR feedback, or source links into git.

## Kill criteria

If private storage is unknown, ask before writing.

If the user asks to store real people data in git, stop and explain the boundary.

If setup starts collecting sensitive notes without explicit consent, stop and ask.

If source links are missing, do not invent them. Leave TODOs.
