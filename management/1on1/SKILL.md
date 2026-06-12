---
name: 1on1
description: Prepare a short manager-readable 1:1 brief from private Home OS context, meeting notes, Linear work, GitHub activity, optional delivery metrics (PR open→merge, issue lead times), and Slack when linked. Use when prepping for a one-on-one, when the user asks to prep for a direct report, or when the user wants follow-ups, wins, career prompts, or feedback check-in questions for a 1:1. Triggers: "prep my 1:1", "prep for a direct report", "1:1 brief".
---

# 1on1

## Fast path

Resolve direct slug + private root → read `directs/<slug>.md` → pull linked sources in default window → emit tagged brief. Radical Candor stance and heading text: [reference.md](reference.md).

**You get:** A concise, source-tagged 1:1 brief (recent facts, optional delivery pulse metrics, follow-ups, questions, RC-aligned feedback prompts).

**You need:** Direct slug or name; private Home OS with `directs/<slug>.md` and optional links in `sources.md` / profile.

**Done when:** Headings through `Sources checked` are filled from profile + linked sources within the time window; `Delivery pulse (metrics)` is filled, explicitly skipped with a one-line reason, or marked thin sample; gaps are explicit in `Missing context`; no invented performance claims; brief matches [reference.md](reference.md) heading and evidence rules; numeric delivery lines labeled with N and method, never peer comparison.

**Templates:** [`brief.template.md`](brief.template.md)

Prepare a concise 1:1 brief. Use private Home OS context first, then fetch recent facts from linked sources.

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

Fetch meeting notes from explicit profile links.

Fetch Linear project/team links plus assigned or owned issues when a Linear user id exists.

Fetch GitHub authored PRs, reviews, and comments within linked repos and the time window.

### Metrics snapshot (optional)

Per-direct, in-window **signals for conversation** — not evaluative scores. Prefer **GitHub MCP** when the host exposes it; otherwise read-only **`gh search prs`** / **`gh search issues`** (see **`home-os`** GitHub fallback).

**Prerequisites:** GitHub username from `directs/<slug>.md` (**Identity**); searchable scope from **Source Links** (repos, org, or search hints) plus `sources.md` **GitHub** section when the profile is thin. Without username + scope, skip this subsection and note the gap under `Missing context` or in `Delivery pulse (metrics)`.

**PR time (default definition):** For **merged** PRs **authored** by the direct in the brief window, duration = **`createdAt` → `mergedAt`**. Other definitions (e.g. first review to merge) only if the user explicitly asks.

**Issues (GitHub):** Closed issues **assigned to** the direct in window; duration = **`createdAt` → `closedAt`**. If assignee-based search returns nothing relevant, do not substitute a different filter without noting the limitation.

**Linear:** If Linear is linked and MCP exposes cycle or lead-time fields for their issues in window, add a short tagged line under `Delivery pulse (metrics)` (`[Linear]`). If unavailable, omit — do not block the brief.

**Execution:** Cap raw rows (e.g. 50–100). In the brief, state **sample N** and **method** (e.g. GitHub search, date range). Compute a simple summary (counts + median or typical range in human-readable units).

**When to omit:** No `gh`/MCP auth, empty results, or N so small that summaries mislead — then one line (“thin sample” / “skipped”) is enough.

Fetch Slack **inside the same time window** as this brief when scope is listed under `sources.md` or the direct profile.

## Missing Context

If the direct cannot be identified, ask.

If no direct profile exists, route to `home-os`.

If missing context blocks the brief, ask for the exact missing source.

If context is useful but incomplete, continue and add a short missing-context paragraph.

## Sensitive Notes

Do not read sensitive notes by default.

Read sensitive-marked sections in `directs/<slug>.md` only when the user explicitly asks for difficult or sensitive 1:1 prep.

If sensitive notes are used, display the brief only by default. Save only on explicit request.

## Output

Headings, RC stance, tags: **[reference.md](reference.md)**.

## Saving

If saving is requested and no sensitive notes were used, write to `outputs/YYYY-MM-DD-1on1-<slug>.md`.

Include generated timestamp, time window, and sources checked.

## Kill criteria

Do not infer sentiment or diagnose performance from weak evidence.

Do not make performance claims when a question would be more accurate.

Do not fetch private Home OS or MCP data for an ambiguous person.

Do not store sensitive-derived output unless explicitly requested.

Do not diagnose performance, rank against peers, or imply team standing from metrics alone; pair thin numbers with questions, not verdicts.
