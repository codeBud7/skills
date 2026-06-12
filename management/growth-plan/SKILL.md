---
name: growth-plan
description: Turn review-prep evidence and the leveling rubric into a forward-looking growth / development plan for a direct. Use when writing a growth or career development plan for a direct. Triggers: "write a growth plan", "what should <name> work on next", "career development plan". Builds on review evidence; flags where data is thin instead of inventing goals.
---

# Growth plan

## Fast path

Direct slug → read profile + `expectations/ladder.md` for target level → gather review evidence per **`review-prep`** → draft forward-looking plan. Heading text: [reference.md](reference.md).

**You get:** A forward-looking development plan with strengths to leverage, gaps vs target level (cited), 2–4 concrete growth goals with progress signals — not final evaluative prose.

**You need:** Direct slug; private Home OS with `directs/<slug>.md`; `expectations/ladder.md` for target-level criteria (or flag gap); optional review window for evidence.

**Done when:** Goals map to ladder criteria for target level; evidence is cited or gaps are explicit; no invented goals when data is thin; plan matches [reference.md](reference.md); goals cite evidence or state thin-data gaps.

**Templates:** [`growth-plan.template.md`](growth-plan.template.md)

Turn review evidence and the leveling rubric into a development plan. Evidence first; goals second. Flag thin data instead of inventing aspirations.

## Inputs

Direct name or slug.

Private Home OS root (resolve per **`home-os`**, **Path resolution order**).

Direct profile at `directs/<slug>.md` — read **Current level** and **Target level** from Identity.

Leveling rubric at `expectations/ladder.md` — read criteria for the target level and track.

Optional review window (default per **`review-prep`**: configured cycle or last 6 months).

Optional links to last review, growth docs, meeting notes, Linear, GitHub, Slack (see `sources.md` and per-direct **Source Links**).

## Evidence Gathering

Run the evidence pass per **`review-prep`** — same MCP conduct, windows, and sensitive-note gates. Produce or reuse an evidence summary; do not write final review prose.

**Shared conduct:** Private Home OS root, Slack, GitHub, and MCP usage — see **`home-os`** (**Path resolution order** and **MCP and source retrieval boundaries**).

Read `expectations/ladder.md` for the direct's **target level** (and current level for context). If ladder is missing or target level is unset, flag under `Missing context` and ask whether to proceed with profile growth areas only.

Map evidence to ladder dimensions: scope/impact, technical, leadership/collaboration, autonomy.

## Sensitive Notes

Ask before reading sensitive-marked sections in `directs/<slug>.md`.

If sensitive notes are used, display output only by default. Save only on explicit request.

## Output

Headings and rules: **[reference.md](reference.md)**.

## Saving

If saving is requested and no sensitive notes were used, write to `outputs/YYYY-MM-DD-growth-plan-<slug>.md`.

Include generated timestamp, time window, target level, and sources checked.

## Kill criteria

If the direct cannot be identified, ask before fetching context.

If no direct profile exists, route to `home-os`.

If `expectations/ladder.md` is missing and target level is unset, flag the gap; do not invent level criteria.

If evidence is too thin for concrete goals, produce strengths + open questions only — flag under `Missing context`.

Do not invent goals, projects, or stretch assignments to fill a template.

Do not write final evaluative ratings or promotion recommendations unless explicitly requested.
