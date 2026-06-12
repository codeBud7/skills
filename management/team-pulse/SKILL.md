---
name: team-pulse
description: Produce a short team-health pulse from delivery flow metrics (GitHub + Linear), meeting cadence, and linked Slack activity. Use for weekly leadership updates or team-health rollups. Requires a timeframe. Triggers: "how is the team doing", "summarize the team's week", "team pulse". Reports team-level signals for conversation, never performance verdicts or peer ranking.
---

# Team pulse

## Fast path

Confirm timeframe → enumerate directs from Home OS → aggregate delivery flow metrics + cadence signals → emit team-level pulse. Heading text: [reference.md](reference.md).

**You get:** A short team-health pulse with delivery flow metrics, cadence signals, themes for discussion, and explicit gaps — team-level only, never per-person ranking.

**You need:** A timeframe (required — ask if not given); private Home OS with `context.md` and `directs/*.md`; optional links in `sources.md` for GitHub, Linear, Slack, meeting notes.

**Done when:** `Window` is explicit; `Delivery flow (metrics)` reports team totals with sample N and method or states skipped/thin; no per-person ranking; gaps are in `Missing context`; pulse matches [reference.md](reference.md); all metrics are team-level with N and method stated.

**Templates:** [`pulse.template.md`](pulse.template.md)

Produce a team-level health pulse. Aggregate signals across all directs; report team totals and trends, not individual standings.

## Inputs

Timeframe — required. Ask before fetching if the user did not provide one (e.g. "last 7 days", "2026-06-02..2026-06-08", "this sprint"). Do not assume a default without asking.

Private Home OS root (resolve per **`home-os`**, **Path resolution order**).

Team context from `context.md`.

All direct profiles under `directs/*.md`.

Optional source links in `sources.md` and per-direct **Source Links**.

## Retrieval Order

**Shared conduct:** Private Home OS root, Slack, GitHub, and MCP usage — see **`home-os`** (**Path resolution order** and **MCP and source retrieval boundaries**).

Read `context.md` for team size, priorities, and meeting cadences.

Enumerate all `directs/<slug>.md` profiles. Use **Identity** and **Source Links** for scope.

Fetch meeting notes and Slack inside the stated window when linked.

### Delivery flow metrics (team aggregate)

Reuse definitions from **`1on1`** **Metrics snapshot** — aggregate across all directs with GitHub username + searchable scope. Report **team-level** totals and medians/typical ranges only.

**PR throughput:** Count of merged PRs authored by team members in window.

**PR cycle time (open→merge):** For merged PRs in window, duration = `createdAt` → `mergedAt`. Report team median or typical range with sample N.

**Review latency:** Time from PR open to first review comment, when GitHub data exposes it. Team median or typical range; skip with one line if unavailable.

**Issue lead time:** Closed issues assigned to team members in window; duration = `createdAt` → `closedAt`. Team totals and median.

**WIP / in-progress:** Open PRs and in-progress Linear issues at snapshot time. Count only — no per-person breakdown in output.

**Linear:** If Linear is linked and MCP exposes cycle or lead-time fields, add tagged team-level lines (`[Linear]`). If unavailable, omit — do not block the pulse.

**Execution:** Cap raw rows per source (e.g. 50–100). State **sample N** and **method** in output. Prefer **GitHub MCP** when available; otherwise read-only `gh` per **`home-os`** GitHub fallback.

**When to omit:** No auth, empty results, or N so small that summaries mislead — one line ("thin sample" / "skipped") is enough.

### Cadence signals

From `context.md` **Meeting cadences** and meeting notes in window: 1:1 frequency, standup/recurring meeting themes, Slack activity level in configured scope (not sentiment diagnosis).

## Output

Headings and guardrails: **[reference.md](reference.md)**.

## Saving

If saving is requested, write to `outputs/YYYY-MM-DD-team-pulse.md`.

Include generated timestamp, time window, and sources checked.

## Kill criteria

If timeframe is unknown, ask before fetching.

Do not report per-person metrics, rankings, or standings in the output.

Do not diagnose performance or infer morale from weak evidence.

Do not rank directs against each other or name who is "ahead" or "behind."

Pair thin numbers with questions for discussion, not verdicts.

If no direct profiles exist, route to `home-os`.
