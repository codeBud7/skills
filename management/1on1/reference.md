# 1:1 — Radical Candor and output headings

Use with [`SKILL.md`](SKILL.md) for retrieval order and gates.

## Radical Candor (default stance)

- **Care personally**: Tie warmth to specifics — praise and curiosity grounded in observable facts, not generic cheer.
- **Challenge directly**: When evidence shows a pattern or gap, say it plainly with source tags; do not sandbag or bury the lead.
- **Evidence binding**: Radical Candor is not bluntness without facts. Weak evidence → direct questions and labeled gaps, not performance claims or diagnoses.
- **Avoid**: Ruinous empathy (kind but vague), obnoxious aggression (harsh without care), manipulative insincerity (spin or politics).

## Output headings

Use short paragraphs under these headings:

`Recent facts`

`Delivery pulse (metrics)`

`Follow-ups`

`Wins to celebrate`

`Questions to ask`

`Career check-in`

`Feedback to consider`

`Missing context`

`Sources checked`

Under **`Delivery pulse (metrics)`**, use **numeric facts only** (counts, durations, sample N, method). Tag lines with `[GitHub]` and, when used, `[Linear]`. These are conversation signals, not ratings. If N is tiny or data missing, say so in that section — do **not** stretch into `Feedback to consider`; add a grounded **question** under `Questions to ask` instead.

### Metrics snapshot definitions

Per-direct, in-window metrics are **signals for conversation**. Prefer GitHub MCP when the host exposes it; otherwise use read-only `gh search prs` / `gh search issues` per `home-os` fallback.

**Prerequisites:** GitHub username from `directs/<slug>.md` (**Identity**); searchable scope from **Source Links** (repos, org, or search hints) plus `sources.md` **GitHub** section when the profile is thin. Without username + scope, skip and note the gap under `Missing context` or in `Delivery pulse (metrics)`.

**PR time:** For merged PRs authored by the direct in the brief window, duration = `createdAt` to `mergedAt`. Other definitions only when the user explicitly asks.

**Issues:** Closed GitHub issues assigned to the direct in window; duration = `createdAt` to `closedAt`. If assignee-based search returns nothing relevant, note the limitation before using another filter.

**Linear:** If Linear is linked and MCP exposes cycle or lead-time fields for in-window issues, add a short tagged line under `Delivery pulse (metrics)`. If unavailable, omit.

**Execution:** Cap raw rows (e.g. 50-100). In the brief, state sample N and method. Compute counts plus median or typical range in human-readable units. If auth is missing, results are empty, or N is too small, write one thin-sample or skipped line.

Always include career expectations.

Always include a specific feedback check-in question. If evidence is thin, ground the question in goals or projects instead of making a critique.

Always include a specific appreciation question. If recent evidence is thin, ground it in profile strengths or goals instead of making an unverified claim.

In `Feedback to consider`, pair **specific appreciation** (when recent evidence supports it) with **specific challenge or growth nudge** when observable evidence supports it; if evidence is thin, use grounded questions only — never invent a critique to sound “candid.”

Use lightweight source tags like `[meeting]`, `[Linear]`, `[GitHub]`, and `[Slack]` when Slack was checked. Keep links in `Sources checked`.
