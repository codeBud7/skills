---
name: home-os
description: Set up or update a private management Home OS with EM context, source links, direct profiles, and optional sensitive notes. Use when the user wants to create manager/team context, add or update a direct profile, configure management source links, or prepare shared context for 1:1, review prep, hiring feedback, or strategy skills.
---

# Home OS

Create and maintain private manager/team context. Public repo files are only skill instructions and blank templates. Real people data, source links, generated briefs, and sensitive notes stay outside git.

## Agent Hosts and Private Storage

Skills are host-agnostic instructions in git. Install location depends on the agent host (`~/.cursor/skills`, `~/.claude/skills`, or `~/.agents/skills`). Never store filled profiles, briefs, or source links in skill install dirs.

Private Home OS data lives at one shared root outside git, default `~/.agents/management/home-os`. Use the same root from Cursor, Claude, or any other host.

Path resolution order for all management skills:

1. `Path:` under `## Private Root` in private `sources.md` — canonical once set
2. Default `~/.agents/management/home-os` if that directory exists
3. Ask the user before first write if still unknown

On first setup: create the private root, seed files from git templates, and write the resolved path into `sources.md` under `## Private Root` → `Path:`.

## Storage Boundary

Default private root: `~/.agents/management/home-os`. Override only when the user specifies a different path. If no root is known, ask before writing.

Private layout:

```text
context.md
sources.md
directs/<slug>.md
directs/private/<slug>-sensitive.md
hiring/rubrics/<role-slug>.md
outputs/YYYY-MM-DD-workflow-slug.md
```

`hiring/rubrics/` is created on first write; `hiring-feedback` owns rubric content. `home-os` seeds context, sources, and direct profiles only.

Never write filled direct profiles, sensitive notes, generated prep briefs, HR feedback, or source links into git.

## Workflow

Start with compact full-context intake. Then refine one section or one direct at a time. The setup must be resumable.

Use short questions. Prefer asking for rough notes first, then clean them into the templates.

Create or update:

`context.md`: manager, team, org, priorities, norms, review cycle, management style.

`sources.md`: shared MCP/source pointers for meeting notes, Linear, GitHub, hiring rubric paths, and strategy context. Rubric setup for open positions is owned by `hiring-feedback`, not `home-os`.

`directs/<slug>.md`: one normal profile per direct.

`directs/private/<slug>-sensitive.md`: optional sensitive manager notes, only after explicit consent.

## Required Direct Identity

Each direct needs a stable slug and explicit handles when available.

Capture display name, slug, title, level, tenure, work email, GitHub username, Linear profile, meeting notes links, Linear links, GitHub repos/searches, current projects, goals, working style, feedback preference, strengths, and growth areas.

Source links are optional during setup. If a later artifact requires a missing source, that skill should pause and ask for it.

## Sensitive Notes

Sensitive notes are private and separate. Do not collect them unless the user explicitly asks or agrees.

Sensitive notes must not be committed to git. If a generated artifact uses sensitive notes, display it only by default. Save only on explicit request.

## Output Style

Use short paragraphs by default.

Avoid tables.

Avoid nested bullets.

Prefer facts over interpretation. If evidence is thin, leave a blank, mark TODO, or write a question.

## Done

Home OS setup is done when the private root has `context.md`, `sources.md`, and at least one direct profile sufficient for `1on1`.

## Kill Criteria

If private storage is unknown, ask before writing.

If the user asks to store real people data in git, stop and explain the boundary.

If setup starts collecting sensitive notes without explicit consent, stop and ask.

If source links are missing, do not invent them. Leave TODOs.
