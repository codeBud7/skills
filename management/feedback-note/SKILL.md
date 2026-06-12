---
name: feedback-note
description: Turn a specific situation into a written, deliverable feedback note using Situation-Behavior-Impact and a Radical Candor stance (care personally, challenge directly). Use when drafting praise, constructive, or upward feedback for a specific situation. Triggers: "help me give feedback", "write an SBI note", "draft feedback for <name>", "how do I tell them ...". Pulls the direct profile and recent evidence from Home OS when available; never invents incidents.
---

# Feedback note

## Fast path

Confirm situation + feedback type → optional direct slug + Home OS profile → draft SBI note with RC stance. Heading text and tone rules: [reference.md](reference.md).

**You get:** A written, deliverable feedback note (Situation → Behavior → Impact → ask) grounded in what the user stated and optional Home OS evidence.

**You need:** A concrete situation (required — pasted or described by the user); optional direct slug for profile context; feedback type (praise / constructive / upward).

**Done when:** Note follows SBI structure with RC stance; incidents come from user input or cited sources only; gaps are explicit when evidence is thin; no invented performance claims; note matches [reference.md](reference.md) structure and RC rules.

**Templates:** [`feedback-note.template.md`](feedback-note.template.md)

Turn a specific situation into a written feedback note. Use the user's stated facts first; enrich from Home OS only when a direct slug is given and evidence exists.

## Inputs

The situation — required. Ask if missing.

Feedback type: praise, constructive, or upward. Infer from context when obvious; confirm if ambiguous.

Optional direct name or slug.

Private Home OS root (resolve per **`home-os`**, **Path resolution order**).

Optional direct profile at `directs/<slug>.md`.

## Retrieval (optional)

**Shared conduct:** Private Home OS root and MCP usage — see **`home-os`** (**Path resolution order** and **MCP and source retrieval boundaries**).

When a direct slug is given, read `directs/<slug>.md` for goals, strengths, growth areas, and feedback preference.

Do not fetch meeting notes, Linear, GitHub, or Slack unless the user asks for evidence enrichment or the situation clearly references a linked source.

Do not read sensitive-marked sections unless the user explicitly asks.

## Output

Headings, SBI structure, RC stance: **[reference.md](reference.md)**.

## Saving

If saving is requested and no sensitive notes were used, write to `outputs/YYYY-MM-DD-feedback-note-<slug-or-topic>.md`.

Include generated timestamp and sources checked when Home OS was used.

## Kill criteria

If no concrete situation is given, ask before drafting.

Never fabricate the incident, behavior, or impact.

If evidence is thin, write the note from what the user stated and flag gaps under `Missing context` — do not invent details to sound specific.

Do not fetch private Home OS data for an ambiguous person.

Do not store sensitive-derived output unless explicitly requested.

Do not diagnose performance or rank against peers.
