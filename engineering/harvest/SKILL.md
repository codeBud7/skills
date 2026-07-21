---
name: harvest
description: Harvest orchestrates an approved seed plan through the ship pipeline.
disable-model-invocation: true
---

# Harvest

## Fast path

Plan file approved per `seed` → read todos → mode A (per todo) or B (one pass) per [Subagent rule](#subagent-rule) below → update plan file at each boundary. Invoke explicitly as `@harvest`.

Orchestrate sub-skills in order. **No merge** unless user says so.

**You get:** Fixed-scope work shipped end-to-end: tests, local green, deslop, code review, docs, draft PR, CI green.

**You need:** Approved plan file per `seed` (path or discoverable default).

**Done when:** All plan todos are `done` with **no** unresolved `blocked_reason`; every pipeline gate is `pass`, `waived`, `not-applicable`, or honestly `blocked` (harvest stops — not done); scoped diff and limits documented; draft PR URL in plan body or final summary when `draft-pr` applies.

## Gate contract

A gate stays **blocked** until one of these is true: work completed and verified; demonstrated non-applicability with rationale; tooling unavailable (report blocked, do not fake pass); explicit user waiver recorded in plan or thread.

- **Never** mark a plan todo `done` while `blocked_reason` is set. Per [seed/reference.md](../seed/reference.md) status invariants.
- **Never** advance a pipeline stage on skip-all or rationale-only green. Each behavior-changing slice needs at least one executed, meaningful verification (`tdd-cycle` and/or `local-quality-gate`) before the slice todo is `done`.
- Upstream `blocked` stops harvest. Downstream stages must not run until upstream is `pass`, `waived`, or `not-applicable`.
- Final summary must name any `waived`, `not-applicable`, or `blocked` gate — never imply full green when checks were skipped or unresolved.

## From approved plan (Build)

Parity with Cursor **Build** / Agent after plan approval: same plan file on disk is the runbook. Agent cannot click UI — read file, execute todos, write progress back.

**Preconditions:** plan approved per [seed/SKILL.md](../seed/SKILL.md) (host UI, exit-plan tool, or `approved` / `execute` / `LGTM on plan`). Plan shape and paths: seed skill.

**Resolve path:** user path if given → Cursor plan file user pasted or active in thread → `.claude/plans/<slug>.md` → `plans/<slug>.md`.

**Start:** read YAML frontmatter + body; list todos by `id`; set first todo `in_progress` in file (see [seed/reference.md](../seed/reference.md) for `status` fields).

**Mapping (default A):**

| Mode | When | Per todo | After last impl todo |
|------|------|----------|----------------------|
| **A** — todos = slices | default | `repo-safety` continuous; `tdd-cycle` + `local-quality-gate` for that slice | `cultivate` (deslop, re-green) + `code-review` + `docs-sync` + `draft-pr` + `ci-green` once (unless plan splits PR/CI/docs todos) |
| **B** — one ship | user says "one pass harvest" | full pipeline once | mark todos `done` only when each todo `content` done criteria are met |

**Loop (mode A):** for each todo — scope per `repo-safety`; run pipeline subset; only then clear any resolved `blocked_reason`, set todo `done`, next `in_progress`. On failure: stop; set `blocked_reason` on todo; keep `status` `in_progress` or `pending` — never `done` while blocked.

**Progress:** plan file is source of truth. Optional `TodoWrite` may mirror Cursor session UI; still update plan file at every todo boundary.

**End:** **Done when** criteria met.

## Subagent rule

Read-only or independent stage → delegate subagent(s). Main thread: scope decisions, edits, gating.

## Pipeline

| # | Skill | Done gate |
|---|-------|-----------|
| 0 | `repo-safety` | scoped diff; no secrets; no forbidden git ops |
| 1 | `tdd-cycle` | red → green → refactor complete, or no-test rationale recorded |
| 2 | `local-quality-gate` | relevant checks pass, or skips have reason + risk |
| 3 | `cultivate` | noise down, behavior preserved, re-greened |
| 4 | `code-review` | two-axis report delivered; severe findings escalated to user or resolved |
| 5 | `docs-sync` | docs fixed or explicit waiver recorded |
| 6 | `draft-pr` | draft PR URL, honest body, scoped commits |
| 7 | `ci-green` | required checks green or blocked status reported |

Independent stages (1–7) may run delegated; orchestrator verifies gates before next step. **`cultivate` runs once after code complete; re-run `local-quality-gate` after its edits and keep `ci-green` passing — deslop must not break behavior or checks. `code-review` runs once after `cultivate` and before `docs-sync`; severe findings stop harvest until the user says fix, waive, or block. `docs-sync` must pass before `draft-pr`.**

## Stop

No force-push, no bypass required checks, no hide flaky/env failures — without approval.

## Failure modes

| Situation | Action |
|-----------|--------|
| Plan path missing | Ask user or run `seed` first. |
| Local gate fails | Fix or stop; do not skip to `draft-pr`. |
| `code-review` severe finding | Stop harvest; ask user whether to fix, waive, or block before continuing. |
| `docs-sync` blocked | Stop harvest until fixed or explicitly waived in plan. |
| CI flaky | Document; do not silence without user agreement. |
