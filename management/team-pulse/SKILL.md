---
name: team-pulse
description: Team pulse produces an action-oriented team report from Home OS context plus delivery signals, dependencies, plan risk, and named unblock contacts. Requires a timeframe.
---

# Team pulse

## Fast path

Confirm timeframe → resolve Home OS root → read `context.md` and all `directs/*.md` → optionally read latest `outputs/*team-pulse.md` for **Comparison to prior period** → aggregate delivery metrics and optional signals (dependencies, quality, interrupts, releases, capacity, support themes) → emit report per [reference.md](reference.md) → **ask** whether to save to `outputs/YYYY-MM-DD-team-pulse.md`.

**You get:** A scannable weekly brief: window, optional prior deltas, delivery metrics, EM sections (dependencies, roadmap risk, optional reliability/interrupts/releases/capacity/support), themes, risks with ping targets, missing context, and **Sources and methodology** at the end.

**You need:** A timeframe (required — ask if not given); private Home OS with `context.md` and `directs/*.md`; optional links in `sources.md` for GitHub, Linear, Slack, observability, meeting notes.

**Done when:** Report matches [reference.md](reference.md) heading order and tone; `Window` is explicit; **full sample N, filters, CLI/API detail** appear only under **Sources and methodology**, not cluttering **Delivery flow (metrics)**; optional `##` sections are **omitted** when empty (gaps noted in `Missing context`); **Risks and blockers** include accountable names/handles or honest Unassigned; no per-person ranking; report is written to Home OS `outputs/` or the user declined saving.

**Templates:** [`pulse.template.md`](pulse.template.md)

## Inputs

Timeframe — required. Ask before fetching if the user did not provide one (e.g. "last 7 days", "2026-06-02..2026-06-08", "this sprint"). Do not assume a default without asking.

Private Home OS root (resolve per **`home-os`**, **Path resolution order**).

Team context from `context.md`.

All direct profiles under `directs/*.md`.

Optional source links in `sources.md` and per-direct **Source Links**.

## Retrieval order

**Shared conduct:** Private Home OS root, Slack, GitHub, and MCP usage — see **`home-os`** (**Path resolution order** and **MCP and source retrieval boundaries**).

1. Read `context.md` for team size, priorities, hiring/capacity notes, and any release or roadmap hints.
2. Enumerate all `directs/<slug>.md` profiles. Use **Identity** and **Source Links** for GitHub/Linear/Slack scope.
3. **Prior pulse (optional):** If `<PrivateRoot>/outputs/` contains `*team-pulse*.md`, read the **most recently modified** file to extract prior headline numbers for **Comparison to prior period**. If none or unreadable, skip comparison with one line—do not fabricate baselines.
4. **Delivery flow metrics (team aggregate)** — see below.
5. **Dependencies / roadmap / risks:** Use Linear (states, blocked, labels, assignees, teams), GitHub (open/merged PRs, review requests, staleness), and `context.md`. For every cited Linear issue or stuck PR in **Risks and blockers** (and where useful in **Dependencies and waiting-on**), resolve **assignee(s)**, **author**, or **requested reviewers** from API/tool output. If unassigned, state **Unassigned**; use team or PM from ticket fields when present—**never invent names**.
6. **Optional signals** (only when linked in `sources.md` / directs and tools allow): incidents or error spikes (Sentry/Datadog/PagerDuty or labeled GitHub issues), Slack thread counts in **configured scope** for interrupts or support themes (counts/topics, not sentiment), GitHub releases/tags for **Release and change risk**.
7. **Slack / meeting notes:** Do **not** pull by default for a cadence narrative. Pull only when needed for **Dependencies**, **Risks**, **Customer or support pressure**, or **Interrupt and focus load**, and only within configured channels/threads—otherwise skip and list under `Missing context`.

### Delivery flow metrics (team aggregate)

Reuse definitions from **`1on1`** **Metrics snapshot** and [reference.md](reference.md). Aggregate across all directs with GitHub username + searchable scope; report team-level totals and medians/typical ranges only.

## Output

Headings, tone, optional sections, and guardrails: **[reference.md](reference.md)**.

## Saving

After you output the full report in chat, **always ask** a single yes/no question: whether to write the same markdown to `<PrivateRoot>/outputs/YYYY-MM-DD-team-pulse.md` (use run date for `YYYY-MM-DD`; resolve root per **`home-os`** **Path resolution order**).

- **If yes:** Write the file. Include generated timestamp and window in the file (as in the template). Saving weekly makes the next run’s **Comparison to prior period** easier (agent may read the latest `*team-pulse*.md` in `outputs/`).

- **If no:** Do not write.

## Kill criteria

If timeframe is unknown, ask before fetching.

Do not report per-person metrics, rankings, or standings in the output.

Do not diagnose performance or infer morale from weak evidence.

Do not rank directs against each other or name who is "ahead" or "behind."

Pair thin numbers with questions for discussion, not verdicts.

If no direct profiles exist, route to `home-os`.
