---
name: review-prep
description: Prepare performance review evidence briefs from private Home OS context, last review, growth docs, meeting notes, Linear work, and GitHub activity. Use when starting performance review prep, gathering review evidence, or creating a review outline for a direct report.
---

# Review Prep

Prepare a factual performance review packet. Evidence brief first. Optional outline second. Do not write final review prose by default.

## Inputs

Direct name or slug.

Private Home OS root.

Direct profile at `directs/<slug>.md`.

Review cycle dates from `context.md`, or manual dates.

Optional links to last review, career expectations, growth docs, meeting notes, Linear, and GitHub.

## Default Window

Use configured review cycle dates.

Fallback to last 6 months.

Treat last review as separate context, not part of the same evidence bucket.

## MCP Use

Fetch last review if linked.

Fetch career expectations and growth docs if linked.

Fetch meeting notes inside the review window.

Fetch Linear projects, initiatives, assigned or owned issues, and status signals inside the review window.

Fetch GitHub authored PRs, reviews, and comments within linked repos and the review window.

Prefer MCP. If no GitHub MCP is available, use explicit GitHub links or read-only `gh` commands as fallback.

## Sensitive Notes

Ask before reading `directs/private/<slug>-sensitive.md`.

If sensitive notes are used, display output only by default. Save only on explicit request.

## Output

Use short paragraphs under these headings:

`Review frame`

`Evidence summary`

`Impact evidence`

`Growth evidence`

`Collaboration evidence`

`Open questions`

`Optional outline`

`Missing context`

`Sources checked`

Only include `Optional outline` when evidence is sufficient.

## Rules

Do not write final evaluative claims without cited evidence.

If evidence is mixed or thin, state the gap.

Use lightweight source tags like `[meeting]`, `[Linear]`, and `[GitHub]`.

Keep links in `Sources checked`.

## Saving

If saving is requested and no sensitive notes were used, write to `outputs/YYYY-MM-DD-review-prep-<slug>.md`.

Include generated timestamp, time window, and sources checked.

## Kill Criteria

If the direct cannot be identified, ask before fetching context.

If no direct profile exists, route to `home-os`.

If sensitive notes are needed, ask before reading them.

If evidence is too thin for an outline, produce evidence brief only.

If final review prose is requested, require an explicit user ask after the evidence brief.
