# Team pulse — output headings and guardrails

Use with [`SKILL.md`](SKILL.md) for metrics definitions, retrieval, and gates.

## Output headings

Use short paragraphs under these headings:

`Window`

`Delivery flow (metrics)`

`Cadence & collaboration`

`Themes for discussion`

`Risks / blockers`

`Missing context`

`Sources checked`

## Delivery flow (metrics)

**Team-level only.** Report aggregates — totals, medians, typical ranges — never per-person breakdowns or rankings.

Include when data exists:

- PR throughput (merged count in window)
- PR cycle time open→merge (median or typical range, sample N, method)
- Review latency (median or typical range, or "skipped" with reason)
- Issue lead time (team totals + median)
- WIP / in-progress (open PR count + in-progress Linear issues at snapshot)

Tag lines with `[GitHub]` and, when used, `[Linear]`. State sample N and method (e.g. "GitHub search, 2026-06-02..2026-06-08, N=23 merged PRs").

If N is tiny or data missing, say so — do not stretch thin numbers into judgments.

## Cadence & collaboration

Meeting cadence vs configured norms (from `context.md`). Recurring themes from meeting notes in window. Slack activity level in configured scope — volume and topics, not sentiment diagnosis.

## Themes for discussion

2–4 conversation starters grounded in metrics and cadence signals. Questions, not verdicts. Example: "PR cycle time median rose this week — worth asking if review bandwidth or scope changed?"

## Guardrails

- No per-person ranking or peer comparison.
- No performance verdicts ("the team is struggling" without cited signals).
- No morale diagnosis from Slack volume alone.
- Thin evidence → explicit gaps and exploratory questions under `Themes for discussion`.

Use lightweight source tags like `[meeting]`, `[Linear]`, `[GitHub]`, `[Slack]`, `[profile]`. Keep links in `Sources checked`.
