---
name: review-prep
description: Review prep prepares performance evidence briefs from Home OS context, last review, growth docs, meetings, Linear, GitHub, and Slack when linked. Use when starting performance review prep for a direct report.
---

# Review prep

## Fast path

Direct slug + review window → read profile + last review/growth links if any → MCP per `home-os` → evidence brief first. Heading text and RC rules: [reference.md](reference.md).

**You get:** An evidence-first review packet (frame, summaries, growth/collaboration signals, optional outline) with source tags — not final evaluative prose unless explicitly requested later.

**You need:** Direct slug; private Home OS with `directs/<slug>.md`; review cycle or dates; optional last review / growth doc links.

**Done when:** Evidence sections cite observable work; ladder criteria are used when `expectations/ladder.md` and Current level exist; `Open questions` and `Missing context` are honest where data is thin; no final ratings prose without an explicit separate ask; packet matches [reference.md](reference.md).

**Templates:** [`evidence-brief.template.md`](evidence-brief.template.md)

## Inputs

Direct name or slug.

Private Home OS root (resolve per **`home-os`**, **Path resolution order**).

Direct profile at `directs/<slug>.md`.

Review cycle dates from `context.md`, or manual dates.

Optional links to last review, career expectations, growth docs, meeting notes, Linear, GitHub, and Slack (see `sources.md` and per-direct **Source Links**).

Leveling rubric at `expectations/ladder.md` — read criteria for the direct's **Current level** from Identity when present.

## Default Window

Use configured review cycle dates.

Fallback to last 6 months.

Treat last review as separate context, not part of the same evidence bucket.

## MCP Use

**Shared conduct:** Private root, Slack, GitHub, and MCP usage — see **`home-os`** (**Path resolution order** and **MCP and source retrieval boundaries**).

Fetch last review if linked.

Fetch career expectations and growth docs if linked.

Read `expectations/ladder.md` for the direct's current level criteria when the file exists and **Current level** is set in the profile.

Fetch meeting notes inside the review window.

Fetch Linear projects, initiatives, assigned or owned issues, and status signals inside the review window.

Fetch GitHub authored PRs, reviews, and comments within linked repos and the review window.

Fetch Slack inside the review window when `sources.md` or the direct profile lists **Slack scope**.

## Sensitive Notes

Use the shared sensitive-notes boundary in `home-os` [reference.md](../home-os/reference.md).

## Output

Headings and RC rules: **[reference.md](reference.md)**.

## Saving

If saving is requested and no sensitive notes were used, write to `outputs/YYYY-MM-DD-review-prep-<slug>.md`.

Include generated timestamp, time window, and sources checked.

## Kill criteria

If the direct cannot be identified, ask before fetching context.

If no direct profile exists, route to `home-os`.

If evidence is too thin for an outline, produce evidence brief only.

If final review prose is requested, require an explicit user ask after the evidence brief.
