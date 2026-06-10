---
name: 1on1
description: Prepare a short manager-readable 1:1 brief from private Home OS context, meeting notes, Linear work, and GitHub activity. Use before one-on-ones, when the user asks to prep for a direct report, or when the user wants follow-ups, wins, career prompts, or feedback check-in questions for a 1:1.
---

# 1on1

Prepare a concise 1:1 brief. Use private Home OS context first, then fetch recent facts from linked sources.

## Inputs

Direct name or slug.

Private Home OS root.

Direct profile at `directs/<slug>.md`.

Optional source links for meeting notes, Linear, and GitHub.

## Default Window

Use context since the last 1:1 if known. Otherwise use the last 14 days.

Read the last meeting note plus unresolved follow-ups by default.

## Retrieval Order

Read the direct profile first.

Fetch meeting notes from explicit profile links.

Fetch Linear project/team links plus assigned or owned issues when a Linear user id exists.

Fetch GitHub authored PRs, reviews, and comments within linked repos and the time window.

Prefer MCP. If no GitHub MCP is available, use explicit GitHub links or read-only `gh` commands as fallback.

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

Use short paragraphs under these headings:

`Recent facts`

`Follow-ups`

`Wins to celebrate`

`Questions to ask`

`Career check-in`

`Feedback to consider`

`Missing context`

`Sources checked`

Always include career expectations.

Always include a specific feedback check-in question. If evidence is thin, ground the question in goals or projects instead of making a critique.

Always include a specific appreciation question. If recent evidence is thin, ground it in profile strengths or goals instead of making an unverified claim.

Use lightweight source tags like `[meeting]`, `[Linear]`, and `[GitHub]`. Keep links in `Sources checked`.

## Saving

If saving is requested and no sensitive notes were used, write to `outputs/YYYY-MM-DD-1on1-<slug>.md`.

Include generated timestamp, time window, and sources checked.

## Kill Criteria

Do not infer sentiment or diagnose performance from weak evidence.

Do not make performance claims when a question would be more accurate.

Do not fetch private Home OS or MCP data for an ambiguous person.

Do not store sensitive-derived output unless explicitly requested.
