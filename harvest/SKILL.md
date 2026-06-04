---
name: harvest
description: Ship fixed-scope work end-to-end — TDD, local gates, draft PR, CI green.
disable-model-invocation: true
---

# Harvest

Triggers: ship it | open draft PR | get CI green | finalize | prepare for review | build the plan | execute plan | run todos from … | `@harvest` + plan path.

Orchestrate sub-skills in order. **No merge** unless user says so.

## From approved plan (Build)

Parity with Cursor **Build** / Agent after plan approval: same plan file on disk is the runbook. Agent cannot click UI — read file, execute todos, write progress back.

**Preconditions:** plan approved per [seed/SKILL.md](../seed/SKILL.md) (host UI, exit-plan tool, or `approved` / `execute` / `LGTM on plan`). Plan shape and paths: seed skill.

**Resolve path:** user path if given → Cursor plan file user pasted or active in thread → `.claude/plans/<slug>.md` → `plans/<slug>.md`.

**Start:** read YAML frontmatter + body; list todos by `id`; set first todo `in_progress` in file (see [seed/reference.md](../seed/reference.md) for `status` fields).

**Mapping (default A):**

| Mode | When | Per todo | After last impl todo |
|------|------|----------|----------------------|
| **A** — todos = slices | default | `repo-safety` continuous; `tdd-cycle` + `local-quality-gate` for that slice | `cultivate` (deslop, re-green) + `docs-sync` + `draft-pr` + `ci-green` once (unless plan splits PR/CI/docs todos) |
| **B** — one ship | user says "one pass harvest" | full pipeline once | mark todos `done` when each section's acceptance criteria met |

**Loop (mode A):** for each todo — scope per `repo-safety`; run pipeline subset; only then set todo `done`, next `in_progress`. On failure: stop; set `blocked_reason` on todo if blocked.

**Progress:** plan file is source of truth. Optional `TodoWrite` may mirror Cursor session UI; still update plan file at every todo boundary.

**End:** harvest **Done** criteria met; all todos `done`; draft PR URL in plan body or final summary.

## Subagent rule

Read-only or independent stage → delegate subagent(s). Main thread: scope decisions, edits, gating.

## Pipeline

| # | Skill | Done gate |
|---|-------|-----------|
| 0 | `repo-safety` | continuous — see skill |
| 1 | `tdd-cycle` | red → green → refactor |
| 2 | `local-quality-gate` | lint/format/type/test/build green |
| 3 | `cultivate` | deslop after code complete: noise down, behavior unchanged, `local-quality-gate` re-green |
| 4 | `docs-sync` | docs aligned or explicit waiver — see skill |
| 5 | `draft-pr` | draft PR URL + scoped commits |
| 6 | `ci-green` | required checks green or blocked |

Independent stages (1–6) may run delegated; orchestrator verifies gates before next step. **`cultivate` runs once after code complete; re-run `local-quality-gate` after its edits and keep `ci-green` passing — deslop must not break behavior or checks. `docs-sync` must pass before `draft-pr`.**

## Stop

No force-push, no bypass required checks, no hide flaky/env failures — without approval.

## Done

Impl complete | tests-first when feasible | local green | deslop applied (cultivate), behavior unchanged | docs synced or waived | draft PR | CI green | scoped diff | limits documented.
