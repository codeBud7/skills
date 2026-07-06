---
name: 1on1-log
description: 1on1-log synthesizes a post-meeting Granola transcript into the existing 1:1 brief doc, closing the loop on prep, feedback, commitments, and carry-forward.
---

# 1on1-log

## Fast path

Resolve direct slug + private root → match today's Granola meeting → read transcript + same-day brief and feedback note → emit post-meeting block → append or replace in the brief doc. Output headings and RC stance: [reference.md](reference.md).

**You get:** A deep post-meeting log (discussion threads, decisions, manager vs direct commitments, signals, loop closure, carry-forward) appended to the same `outputs/YYYY-MM-DD-1on1-<slug>.md` file as the prep brief.

**You need:** Direct slug or name; Granola MCP for transcript; same-day brief at `outputs/YYYY-MM-DD-1on1-<slug>.md` when available; optional same-day `outputs/YYYY-MM-DD-feedback-note-<slug>.md` for loop closure.

**Done when:** Post-meeting block matches [reference.md](reference.md); every claim grounded in transcript (or Granola summary with depth gap flagged); loop closure checked against brief and feedback note when present; `Carry-forward follow-ups` filled or explicitly empty; log appended or replaced in place without touching pre-meeting sections; Notion written only when explicitly requested; no invented quotes, sentiment, or verdicts.

**Templates:** [`post-meeting-log.template.md`](post-meeting-log.template.md)

## Inputs

Direct name or slug.

Meeting date — default today. Override only when the user specifies a different date.

Optional Granola meeting ID or link — use when the user provides one; otherwise match automatically.

Private Home OS root (resolve per **`home-os`**, **Path resolution order**).

Direct profile at `directs/<slug>.md`.

Optional Notion write — off unless the user explicitly asks (e.g. "save to Notion", "write to Notion").

## Meeting match

Default to **today's or the most recent Granola meeting whose title or attendees match the direct's name** via `list_meetings` / `query_granola_meetings`.

If no single clear match, list candidates and ask — never guess.

If the user passes a Granola meeting ID or link, use that meeting directly.

## Retrieval

**Shared conduct:** Private Home OS root and MCP usage — see **`home-os`** (**Path resolution order** and **MCP and source retrieval boundaries**).

Read the direct profile first (name, **Notion 1:1s DB** under Source Links, feedback preference).

Locate the same-day brief `outputs/YYYY-MM-DD-1on1-<slug>.md` when it exists — use its planned topics, questions, and `Feedback to consider` for loop closure.

Locate the same-day feedback note `outputs/YYYY-MM-DD-feedback-note-<slug>.md` when it exists — use for loop closure on whether planned feedback was delivered.

Pull the Granola **transcript** via `get_meeting_transcript` as the primary substance source. Fall back to Granola's own summary only if the transcript is unavailable; flag the depth gap in the log.

Use the shared sensitive-notes boundary in `home-os` [reference.md](../home-os/reference.md).

## Output

Headings, RC stance, tags: **[reference.md](reference.md)**.

## Saving

Append the post-meeting block to `outputs/YYYY-MM-DD-1on1-<slug>.md` under a `---` divider and `# Post-meeting log` heading.

**Idempotent re-run:** If a `# Post-meeting log` block for that date already exists in the file, **detect and replace it in place** — never stack duplicates, never modify pre-meeting brief sections above the divider.

If the brief file is missing, create `outputs/YYYY-MM-DD-1on1-<slug>.md` with only the post-meeting log block and note the prep brief was absent.

Include generated timestamp, meeting title/time, Granola meeting ID, and sources checked in the log header.

Do **not** create a separate output file.

## Notion (optional)

Off unless explicitly requested.

When requested, read the per-direct **Notion 1:1s DB** link from `directs/<slug>.md` under Source Links (fallback: `Meeting notes` DB URL in the same section, then `sources.md`).

Create a **dated page** in that database mirroring the post-meeting log. If a same-date page already exists, update it in place.

If no DB link is recorded, ask for it — do not search Notion blindly.

If Notion write was not requested, save locally only and note Notion was skipped.

## Kill criteria

Do not invent quotes, dialogue, or sentiment.

Do not diagnose performance or render verdicts; evaluative reads stay as grounded questions.

Do not overwrite or edit pre-meeting brief sections — append or replace the post-meeting log block only.

Do not write to Notion unless explicitly asked.

Do not fetch private Home OS or Granola data for an ambiguous person or meeting.

Do not create a separate `-granola-summary.md` or `-log.md` file.
