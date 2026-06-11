---
name: review-prep
description: Prepare performance review evidence briefs from private Home OS context, last review, growth docs, meeting notes, Linear work, GitHub activity, and Slack when linked. Use when starting performance review prep, gathering review evidence, or creating a review outline for a direct report.
---

# Review Prep

Prepare a factual performance review packet. Evidence brief first. Optional outline second. Do not write final review prose by default.

## Inputs

Direct name or slug.

Private Home OS root.

Direct profile at `directs/<slug>.md`.

Review cycle dates from `context.md`, or manual dates.

Optional links to last review, career expectations, growth docs, meeting notes, Linear, GitHub, and Slack (see `sources.md` and per-direct **Source Links**).

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

When `sources.md` or the direct profile lists **Slack scope**, pull Slack **inside the review window**. Prefer **channel or thread reads** over workspace-wide search. Use Slack MCP when configured; if Slack MCP is unavailable and the user did not paste an export, skip Slack and note the gap in `Missing context` or ask for a thread link. Do **not** expand Slack scope beyond configured links without an explicit user ask.

Prefer MCP for each linked system. If no GitHub MCP is available, use explicit GitHub links or read-only `gh` commands as fallback.

## Sensitive Notes

Ask before reading sensitive-marked sections in `directs/<slug>.md`.

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

### Radical Candor (default stance)

- **Care personally**: Acknowledge impact and context; keep praise specific and evidence-backed.
- **Challenge directly**: Name gaps or risks the evidence supports; do not soften mixed evidence into false harmony.
- **Evidence binding**: Candor without citations is opinion — state gaps and questions instead of evaluative claims when evidence is thin.
- **Avoid**: Ruinous empathy (vague positivity), obnoxious aggression (harsh labels), manipulative insincerity (strategic ambiguity).

Do not write final evaluative claims without cited evidence.

If evidence is mixed or thin, state the gap.

`Open questions` may include what to **challenge directly** next cycle when the evidence supports a clear growth or alignment gap; otherwise keep questions exploratory, not accusatory.

Use lightweight source tags like `[meeting]`, `[Linear]`, `[GitHub]`, and `[Slack]` when Slack was checked.

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
