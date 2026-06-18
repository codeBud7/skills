# Team pulse — output structure, tone, and guardrails

Use with [`SKILL.md`](SKILL.md) for metrics definitions, retrieval, and gates.

## Tone and layout

Write an **internal exec brief**, not marketing copy.

- **Structure:** facts → short implication → **`Suggested actions`** (bullet list: concrete next steps, owners when known; use “unknown” when not). At least one `Suggested actions` block where signal is strong enough (e.g. Dependencies, Roadmap and plan risk, Risks and blockers)—do not force empty action lists in thin sections.
- **Headings:** stable `##` titles, neutral and factual (“boring-on-purpose”). No clickbait, puns, emoji, or hook lines that hide the data.
- **Skimmable body:** keep the report readable in one pass before `Sources and methodology`. **Do not** paste CLI strings, caps, or long method prose into the metric body—those belong under **Methodology** at the end.
- **Optional sections:** if there is no data for a section, **omit that `##` heading entirely** and note the gap under `Missing context` instead of placeholder fluff.

## Output headings (in order)

Emit the report under these headings **in this order**. Skip any optional heading when there is nothing defensible to say.

1. **`Window`** — Calendar or rolling window, org/repo/team scope in one short paragraph. Put filters, author lists, and command details only in **Methodology** at the end.

2. **`Comparison to prior period`** — Deltas vs the same metrics from a **prior saved** `outputs/*team-pulse.md` (if present and readable) or a baseline the user supplied this session. If no prior pulse: one honest line (e.g. “No prior team-pulse file to compare.”). **Never** invent prior numbers.

3. **`Delivery flow (metrics)`** — Team-level aggregates for the current window only (see below). Plain sentences; optional compact `N=…` in parentheses where it matters. No source tags like `[GitHub]` in this section body.

4. **`Dependencies and waiting-on`** — Primary bottleneck (other teams, vendors, legal/security, unclear spec); aging (waiting on external / third party past a stated threshold); **who to ping** (names/handles from API or profile—never invented). Evidence from Linear (blocked, labels, assignees), GitHub (review requests, stalled PRs), or Slack **only** within configured scope.

5. **`Roadmap and plan risk`** — Plain “if we miss \<milestone\>, it is likely because …” tied to **observable** work (issues, PRs, incidents). Ground in `context.md` priorities + linked boards—not morale. Do **not** invent a roadmap from Linear alone; respect **`home-os`** / strategy boundaries.

6. **`Reliability and quality`** *(optional)* — Team-level quality vs throughput (incidents, hotfixes, reverts vs merge volume) when linked signals exist. Omit the whole section if there is no data.

7. **`Interrupt and focus load`** *(optional)* — Counts only: pages, prod fires, urgent threads in **scoped** Slack/channels—**load**, not sentiment. Omit if no data.

8. **`Release and change risk`** *(optional)* — Blast radius: releases, migrations, large merges, feature flags shipping or imminent. Omit if unknown.

9. **`Capacity and hiring`** *(optional)* — Open reqs, interview load, onboarding drag **only** from `context.md` or explicit user notes—never invent HR data. Omit if absent.

10. **`Customer or support pressure`** *(optional)* — Top 2–3 themes from linked support/CS Slack or board, configured scope only. Omit if not read.

11. **`Themes for discussion`** — 2–4 **decision-oriented** prompts grounded in the sections above—not generic icebreakers.

12. **`Risks and blockers`** — Observable risks; each item should name **who to ping** (Linear assignee name + handle, PR author or requested reviewers for stuck PRs). If unassigned, state **Unassigned** and use team/PM from ticket fields when present—never invent people.

13. **`Missing context`** — Gaps that blocked stronger conclusions or optional sections.

14. **`Sources and methodology`** — Two subsections:
    - **Sources:** bullets—Home OS paths, org/teams, MCP vs `gh`, links as applicable.
    - **Methodology:** filters (dates, authors, teams/states), per-source caps, field proxies (e.g. `closedAt` as merge), what was skipped and why.

## Delivery flow (metrics)

**Team-level only.** Report aggregates—totals, medians, typical ranges—never per-person breakdowns or rankings in this section.

Include when data exists (one tight lead per bullet type, not a wall of tags):

- PR throughput (merged count in window)
- PR cycle time open→merge (median or typical range; note sample size briefly)
- Review latency (typical range, or one line skipped with reason)
- Issue lead time (team totals + median)
- WIP / in-progress (open PR count + in-progress Linear snapshot counts)

If N is tiny or data missing, say so in one line—do not stretch thin numbers into judgments. Full **N**, caps, queries, and proxies live under **Methodology**.

## Guardrails

- No per-person **ranking** or peer comparison on velocity or output.
- No performance verdicts (“the team is struggling”) without cited, team-level signals.
- No morale diagnosis from Slack volume or tone.
- **Allowed and encouraged:** naming individuals **only** for unblock—ownership on a cited risk, assignee on a ticket, reviewer on a stuck PR. Still no “ahead/behind,” no stack ranks, no velocity verdicts per person.
- Thin evidence → `Missing context` + measured questions under `Themes for discussion`, not drama.
