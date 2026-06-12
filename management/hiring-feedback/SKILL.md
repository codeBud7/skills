---
name: hiring-feedback
description: Convert pasted interview notes into paste-ready HR feedback. Always resolve which position first; persist a shaped rubric if unknown. Use after candidate calls, interview debriefs, or rubric setup. Triggers: "turn interview notes into HR feedback", "hiring rubric", "interview debrief".
---

# Hiring feedback

## Fast path

Resolve **position** and private **rubric** on disk (Phase 1). Paste **interview notes** → score into HR template (Phase 2). Phases, template fill, bias guard: [reference.md](reference.md).

**You get:** Paste-ready HR feedback from interview notes, aligned to a private rubric for a named role.

**You need:** Position slug or title; pasted notes (and JD or notes for new rubrics). Private Home OS root per **`home-os`** (**Path resolution order**).

**Done when:** Phase 1 resolves a rubric on disk (or confirms existing); Phase 2 output matches [`hr-feedback.template.md`](hr-feedback.template.md); unsupported dimensions say insufficient evidence; no invented signal; output matches [reference.md](reference.md) bias rules.

**Templates:** [`hr-feedback.template.md`](hr-feedback.template.md), [`rubric.template.md`](rubric.template.md)

Two-phase workflow: resolve position and rubric first, then score candidate notes into HR-ready output.

Git holds blank templates only. Filled rubrics live in private Home OS storage.

## Storage Boundary

If the private root is still unknown after **`home-os`** resolution, ask before writing.

Never write filled rubrics, HR feedback, or position details into git.

Private layout for hiring:

```text
hiring/rubrics/<role-slug>.md
```

Register each rubric in private `sources.md` under Hiring.

HR output always follows [`hr-feedback.template.md`](hr-feedback.template.md) from git unless the user maintains a private copy path in `sources.md`.

Shape new rubrics from [`rubric.template.md`](rubric.template.md) skeleton only.

## Source Rules

Do not fetch candidate data by default.

Do not do public candidate lookup.

Do not use external context unless explicitly requested.

Use only the resolved position rubric and the user's pasted interview evidence.

## Phase 1: Resolve Position

Run this before scoring candidate notes.

1. Ask which position this feedback is for — required unless the user already named a clear slug or role title.
2. If helpful, list existing slugs from `hiring/rubrics/*.md` under the private root.
3. Resolve slug from user input, or fall back to `Active role slug` in `sources.md`.
4. Load `hiring/rubrics/<role-slug>.md` from private storage.

If the rubric exists, confirm the position and proceed to Phase 2 when notes are available.

If the rubric is missing or the user names a new opening, run **position setup** per [reference.md](reference.md) — do not score yet.

## Phase 2: Score Candidate

Run only after Phase 1 resolves a rubric. Steps and rules: [reference.md](reference.md).

## Kill criteria

If position is unknown, ask before rating.

If no rubric exists for the named position, run position setup or ask for position details before rating.

If the user declines position setup and no rubric exists, ask before rating.

If notes do not support a dimension, write insufficient evidence.

If the template requires a field that notes cannot support, ask or mark insufficient evidence.

If a rubric red flag is not supported by notes, do not treat it as confirmed.

If the output cannot be pasted into the HR tool, revise to match the stored template.

Do not fall back to filling the git rubric skeleton with role content.
