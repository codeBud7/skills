---
name: hiring-feedback
description: Hiring feedback converts pasted interview notes into paste-ready HR feedback after resolving the position and private rubric. Use for interview debriefs or rubric setup.
---

# Hiring feedback

## Fast path

Resolve **position** and private **rubric** on disk (Phase 1). Paste **interview notes** → score into HR template (Phase 2). Phases, template fill, bias guard: [reference.md](reference.md).

**You get:** Paste-ready HR feedback from interview notes, aligned to a private rubric for a named role.

**You need:** Position slug or title; pasted notes (and JD or notes for new rubrics). Private Home OS root per **`home-os`** (**Path resolution order**).

**Done when:** Phase 1 resolves a rubric on disk (or confirms existing); private `sources.md` Hiring section records the active role and rubric path when a rubric is created; Phase 2 output matches [`hr-feedback.template.md`](hr-feedback.template.md); unsupported dimensions say insufficient evidence; no invented signal; output matches [reference.md](reference.md) bias rules.

**Templates:** [`hr-feedback.template.md`](hr-feedback.template.md), [`rubric.template.md`](rubric.template.md)

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

## Completion checks

- Position resolved before rating.
- Rubric exists in private storage before scoring; new role setup completes before candidate scoring.
- Unsupported dimensions, required template fields, and red flags are marked insufficient evidence unless notes support them.
- Output is paste-ready for the HR tool and uses the stored template.
- Filled role content stays in private storage, not the git rubric skeleton.
