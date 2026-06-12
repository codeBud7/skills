# Hiring feedback — phases, output, bias guard

## Phase 1: Resolve Position (detail)

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

## Phase 2: Score Candidate (detail)

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

## Output (template fill)

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

## Bias guard

Do not invent signal.

Do not fill missing ratings from vibes.

Do not launder subjective impressions into factual language.

Do not use demographic, personality, pedigree, accent, communication-style, or culture-fit shortcuts.

Rewrite concerns around observable interview behavior and job-relevant expectations from the rubric.
