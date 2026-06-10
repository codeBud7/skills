---
name: hiring-feedback
description: Convert pasted interview notes into paste-ready HR feedback. Always resolve which position first; persist a shaped rubric if unknown. Use after candidate calls, interview debriefs, rubric setup, or when the user asks to turn interview notes into HR tool feedback.
---

# Hiring Feedback

Two-phase workflow: resolve position and rubric first, then score candidate notes into HR-ready output.

Git holds blank templates only. Filled rubrics live in private Home OS storage.

## Storage Boundary

Read private root from `sources.md`. If unknown, ask before writing.

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

If the rubric is missing or the user names a new opening, run position setup — do not score yet:

1. Accept pasted job description or rough position notes first.
2. Ask only for gaps: must-haves, nice-to-haves, interview stages, red flags, team or product context.
3. Derive a stable slug from the role title if the user does not provide one.
4. Shape a filled rubric from the git skeleton:
   - 5–8 job-relevant dimensions
   - Expectation, strong signal, weak signal, insufficient evidence per dimension
   - Recommendation rules
   - Red flags
   - Interview stage focus table
   - Notes for role constraints
5. Write `hiring/rubrics/<role-slug>.md` under the private root.
6. Update private `sources.md` Hiring section:
   - `Active role slug: <slug>`
   - `Interview rubric: <private path>`
   - `HR feedback template:` git template path unless user uses a private copy
7. Confirm the rubric is saved. If the user has not pasted candidate notes yet, stop and wait.

If the user only wants position setup with no notes, complete Phase 1 and stop.

## Phase 2: Score Candidate

Run only after Phase 1 resolves a rubric.

1. Accept pasted interview notes or transcript.
2. If notes arrived in the same message as an unresolved position, complete Phase 1 first.
3. Identify interview stage from notes; apply stage focus from the rubric — do not score dimensions not exercised in that stage unless notes contain direct evidence.
4. Map notes to rubric dimensions.
5. Separate direct evidence from interpretation.
6. Mark unsupported dimensions as insufficient evidence.
7. Check red flags only against observable interview behavior documented in notes.
8. Produce a recommendation only when evidence supports the rubric rules for the completed stage(s).

Must-haves require evidence by end of process. Nice-to-haves must not lower ratings when absent.

## Output

Fill [`hr-feedback.template.md`](hr-feedback.template.md) exactly enough to paste into the HR tool:

- **Candidate** — name, role, interview stage, interviewer from notes; ask if missing
- **Recommendation** — from rubric rules and evidence
- **Rubric Evidence** — per dimension: evidence plus assessment or insufficient evidence
- **Strengths** — job-relevant, evidence-backed
- **Concerns** — job-relevant, evidence-backed
- **Follow-up** — questions or gaps for future interviews

Use concise, neutral language.

Avoid nested structure unless the HR template requires it.

Do not add fields outside the HR template.

## Bias Guard

Do not invent signal.

Do not fill missing ratings from vibes.

Do not launder subjective impressions into factual language.

Do not use demographic, personality, pedigree, accent, communication-style, or culture-fit shortcuts.

Rewrite concerns around observable interview behavior and job-relevant expectations from the rubric.

## Kill Criteria

If position is unknown, ask before rating.

If no rubric exists for the named position, run position setup or ask for position details before rating.

If the user declines position setup and no rubric exists, ask before rating.

If notes do not support a dimension, write insufficient evidence.

If the template requires a field that notes cannot support, ask or mark insufficient evidence.

If a rubric red flag is not supported by notes, do not treat it as confirmed.

If the output cannot be pasted into the HR tool, revise to match the stored template.

Do not fall back to filling the git rubric skeleton with role content.
