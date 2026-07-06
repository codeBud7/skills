---
name: 1on1
description: 1on1 prepares a short manager-readable brief from Home OS context, meeting notes, Linear, GitHub, optional metrics, and Slack when linked. Use when prepping a direct-report 1:1 or generating follow-ups, wins, career prompts, and feedback check-in questions.
---

# 1on1

## Fast path

Resolve direct slug + private root → read `directs/<slug>.md` → pull linked sources in default window → emit tagged brief. Radical Candor stance and heading text: [reference.md](reference.md).

**You get:** A concise, source-tagged 1:1 brief (recent facts, optional delivery pulse metrics, follow-ups, questions, RC-aligned feedback prompts).

**You need:** Direct slug or name; private Home OS with `directs/<slug>.md` and optional links in `sources.md` / profile.

**Done when:** Headings through `Sources checked` are filled from profile + linked sources within the time window; `Delivery pulse (metrics)` is filled, explicitly skipped with a one-line reason, or marked thin sample; gaps are explicit in `Missing context`; no invented performance claims; brief matches [reference.md](reference.md) heading and evidence rules; numeric delivery lines labeled with N and method, never peer comparison.

**Templates:** [`brief.template.md`](brief.template.md)

## Inputs

Direct name or slug.

Private Home OS root (resolve per **`home-os`**, **Path resolution order**).

Direct profile at `directs/<slug>.md`.

Optional source links for meeting notes, Linear, GitHub, and Slack (see `sources.md` and per-direct **Source Links**).

## Default Window

Use context since the last 1:1 if known. Otherwise use the last 14 days.

Read the last meeting note plus unresolved follow-ups by default.

## Retrieval Order

**Shared conduct:** Private Home OS root, Slack, GitHub, and MCP usage — see **`home-os`** (**Path resolution order** and **MCP and source retrieval boundaries**).

Read the direct profile first.

Read the **previous local** `outputs/YYYY-MM-DD-1on1-<slug>.md` when it exists — **first** for follow-ups: prioritize `Carry-forward follow-ups` and the post-meeting log from the latest prior brief. Keep Notion 1:1s DB / meeting notes as a **secondary** source for the same topics.

Fetch meeting notes from explicit profile links (Notion 1:1s DB under Source Links).

Fetch Linear project/team links plus assigned or owned issues when a Linear user id exists.

Fetch GitHub authored PRs, reviews, and comments within linked repos and the time window.

### Metrics snapshot (optional)

Use the metrics definitions in [reference.md](reference.md). Keep metrics as conversation signals, not ratings.

Fetch Slack **inside the same time window** as this brief when scope is listed under `sources.md` or the direct profile.

## Missing Context

If the direct cannot be identified, ask.

If no direct profile exists, route to `home-os`.

If missing context blocks the brief, ask for the exact missing source.

If context is useful but incomplete, continue and add a short missing-context paragraph.

## Sensitive Notes

Use the shared sensitive-notes boundary in `home-os` [reference.md](../home-os/reference.md).

## Output

Headings, RC stance, tags: **[reference.md](reference.md)**.

## Saving

If saving is requested and no sensitive notes were used, write to `outputs/YYYY-MM-DD-1on1-<slug>.md`.

Include generated timestamp, time window, and sources checked.

## Kill criteria

Weak evidence becomes questions and labeled gaps, not sentiment or performance diagnosis.

Ambiguous person → ask before fetching private Home OS or MCP data.

Sensitive-derived output follows the `home-os` shared boundary.

Metrics become conversation signals; thin numbers pair with questions, not verdicts or peer comparison.
