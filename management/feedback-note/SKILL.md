---
name: feedback-note
description: Feedback note turns a specific situation into a deliverable SBI note with Radical Candor stance. Use when drafting praise, constructive, or upward feedback for a specific incident.
---

# Feedback note

## Fast path

Confirm situation + feedback type → optional direct slug + Home OS profile → draft SBI note with RC stance. Heading text and tone rules: [reference.md](reference.md).

**You get:** A written, deliverable feedback note (Situation → Behavior → Impact → ask) grounded in what the user stated and optional Home OS evidence.

**You need:** A concrete situation (required — pasted or described by the user); optional direct slug for profile context; feedback type (praise / constructive / upward).

**Done when:** Note follows SBI structure with RC stance; incidents come from user input or cited sources only; gaps are explicit when evidence is thin; no invented performance claims; note matches [reference.md](reference.md) structure and RC rules; saved only when requested and allowed by sensitive-notes boundary.

**Templates:** [`feedback-note.template.md`](feedback-note.template.md)

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

Use the shared sensitive-notes boundary in `home-os` [reference.md](../home-os/reference.md).

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

Sensitive-derived output follows the `home-os` shared boundary.

Write observed behavior and impact, not performance diagnosis or peer ranking.
