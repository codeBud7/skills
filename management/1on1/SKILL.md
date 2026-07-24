---
name: 1on1
description: 1on1 prepares a short manager-readable brief from Home OS context, meeting notes, Linear, GitHub, delivery pulse metrics with trend vs the prior 1:1, and Slack when linked. Use when prepping a direct-report 1:1 or generating follow-ups, wins, career prompts, and feedback check-in questions.
---

# 1on1

## Fast path

Resolve direct slug + private root → read `directs/<slug>.md` → pull linked sources in default window → emit source-backed brief. Radical Candor stance, heading text, and citation layout: [reference.md](reference.md).

**You get:** A concise 1:1 brief (recent facts, delivery pulse metrics with trend vs the prior 1:1 when a prior snapshot exists, follow-ups, questions, RC-aligned feedback prompts). Narrative sections stay tag-free; sources sit at each section end and links in `Sources checked`.

**You need:** Direct slug or name; private Home OS with `directs/<slug>.md` and optional links in `sources.md` / profile.

**Done when:** Headings through `Sources checked` are filled from profile + linked sources within the time window; `Sources checked` is the **last** heading with concrete links; narrative sections (`Recent facts`, factual `Follow-ups`) use end-of-section `Sources:` lines and **no** inline `[meeting]` / `[GitHub]` / `[Linear]` / `[Slack]` tags in prose; `Delivery pulse (metrics)` is filled, explicitly skipped with a one-line reason, or marked thin sample; when a prior brief had a metrics snapshot, trend lines compare the same metrics or state why comparison was skipped; gaps are explicit in `Missing context`; no invented performance claims; brief matches [reference.md](reference.md) heading and evidence rules; numeric delivery lines labeled with N and method, never peer comparison.

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

Read the **previous local** `outputs/YYYY-MM-DD-1on1-<slug>.md` when it exists — **first** for follow-ups: prioritize `Carry-forward follow-ups` and the post-meeting log from the latest prior brief. From the same file, extract the prior `Delivery pulse (metrics)` block (counts, medians, sample N, method, and brief `Window` / `Generated at` from the header) as the **prior snapshot** for trend comparison. Keep Notion 1:1s DB / meeting notes as a **secondary** source for the same topics.

Fetch meeting notes from explicit profile links (Notion 1:1s DB under Source Links).

Fetch Linear project/team links plus assigned or owned issues when a Linear user id exists.

Fetch GitHub authored PRs, reviews, and comments within linked repos and the time window.

### Metrics snapshot (optional)

Use the metrics definitions in [reference.md](reference.md). Keep metrics as conversation signals, not ratings.

Compute the **current snapshot**, then compare to the **prior snapshot** from the latest prior brief when one exists. Trend rules: [reference.md](reference.md) (**Trend vs prior 1:1**).

Fetch Slack **inside the same time window** as this brief when scope is listed under `sources.md` or the direct profile.

## Missing Context

If the direct cannot be identified, ask.

If no direct profile exists, route to `home-os`.

If missing context blocks the brief, ask for the exact missing source.

If context is useful but incomplete, continue and add a short missing-context paragraph.

## Sensitive Notes

Use the shared sensitive-notes boundary in `home-os` [reference.md](../home-os/reference.md).

## Output

Headings, RC stance, citation layout: **[reference.md](reference.md)**.

## Saving

If saving is requested and no sensitive notes were used, write to `outputs/YYYY-MM-DD-1on1-<slug>.md`.

Include generated timestamp, time window, and sources checked.

## Kill criteria

Weak evidence becomes questions and labeled gaps, not sentiment or performance diagnosis.

No inline source tags in narrative prose — cite at section end per [reference.md](reference.md) (**Source placement**).

Ambiguous person → ask before fetching private Home OS or MCP data.

Sensitive-derived output follows the `home-os` shared boundary.

Metrics become conversation signals; thin numbers pair with questions, not verdicts or peer comparison.

Trend deltas describe change over time for the same direct only — never rank against peers or label good/bad without grounded context.
