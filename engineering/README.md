# Engineering Skills

Plan → ship pipeline for fixed-scope work, plus standing agent-docs setup. Skills compose: `harvest` orchestrates the ship chain; others run standalone when you only need one step.

## Quick Start

**New feature or fix (full loop)**

1. `seed` — read-only planning, one plan file on disk, human approval before code.
2. `harvest` — execute approved plan end-to-end through draft PR and green CI.

**One-off step**

Invoke the skill you need (`tdd-cycle`, `local-quality-gate`, `ci-green`, …) without `harvest`.

**Agent docs on a repo**

`create-agent-docs` — layout `AGENTS.md` + `docs/` (not part of harvest; use when bootstrapping or restructuring docs).

## Ship Pipeline

`harvest` runs sub-skills in order. `repo-safety` is continuous.

```text
seed (plan, approve)
  ↓
harvest
  repo-safety ─────────────────────────────┐
  tdd-cycle                                │
  local-quality-gate                       │ continuous
  cultivate (deslop, re-green)             │
  docs-sync                                │
  draft-pr                                 │
  ci-green                                 ┘
```

**Plan-driven build:** Approved plan file = runbook. Harvest reads todos, marks progress in the file, maps each todo through the pipeline (default: todos = slices).

**Modes**

| Mode | When | Behavior |
|------|------|----------|
| A (default) | Plan todos = slices | TDD + gates per todo; cultivate + docs + PR + CI once at end |
| B | "One pass harvest" | Full pipeline once for whole plan |

Triggers: `ship it` | `open draft PR` | `get CI green` | `execute plan` | `@harvest` + plan path.

## Skills

| Skill | When to use | Standalone | In harvest |
|-------|-------------|------------|------------|
| [`seed`](seed/SKILL.md) | Before implementation; goals, trade-offs, risks | Yes | Before harvest |
| [`harvest`](harvest/SKILL.md) | Execute approved plan through CI green | Yes | — |
| [`repo-safety`](repo-safety/SKILL.md) | Commits, push, PR, scope, secrets | Yes | Continuous |
| [`tdd-cycle`](tdd-cycle/SKILL.md) | Red → green → refactor for a slice | Yes | Step 1 |
| [`local-quality-gate`](local-quality-gate/SKILL.md) | Lint, format, types, test, build green | Yes | Step 2 |
| [`cultivate`](cultivate/SKILL.md) | Deslop AI code; same behavior, re-green | Yes | Step 3 |
| [`docs-sync`](docs-sync/SKILL.md) | Align docs with diff or waive | Yes | Step 4 (hard gate before PR) |
| [`draft-pr`](draft-pr/SKILL.md) | Scoped commits, push, draft PR | Yes | Step 5 |
| [`ci-green`](ci-green/SKILL.md) | Triage and fix PR checks until green | Yes | Step 6 |
| [`create-agent-docs`](create-agent-docs/SKILL.md) | Bootstrap `AGENTS.md` + `docs/` layout | Yes | No |

`seed`, `harvest`, and `create-agent-docs` use `disable-model-invocation` — mention them explicitly.

## Typical Prompts

**Planning**

- "Seed a plan for adding rate limiting to the API"
- "/seed — refactor auth middleware, TDD"

**Shipping**

- "Harvest the approved plan at `.cursor/plans/foo.md`"
- "Ship it" / "Open draft PR" / "Get CI green"
- "One pass harvest for this plan"

**Single steps**

- "Run local quality gate"
- "Deslop this branch" / `cultivate`
- "Sync docs with this diff"
- "Fix CI on this PR"

**Agent docs**

- "Set up agent docs for this repo"
- `@create-agent-docs`

## Subagents

Read-only discovery (repo layout, CI config, test patterns) or independent parallel stages → delegate subagent(s). Main thread: scope decisions, file edits, gate verification.

## Gates and Stop Rules

Harvest **done** when: impl complete, tests-first where feasible, local green, cultivate applied, docs synced or waived, draft PR open, CI green, scoped diff.

Harvest **stops** without approval for: force-push, bypassing required checks, hiding flaky/env failures.

`docs-sync` must pass (or explicit waiver) before `draft-pr`. `cultivate` must not break behavior or checks.

## Templates

[`create-agent-docs/templates/`](create-agent-docs/templates/) — blank `AGENTS.md`, `architecture.md`, `runbook.md`, `decisions.md`.

[`seed/reference.md`](seed/reference.md) — plan file shape, todos, cost rule.

## Dependency Order

```text
seed → harvest → (repo-safety + tdd-cycle + local-quality-gate + cultivate + docs-sync + draft-pr + ci-green)

create-agent-docs — independent; use when standing doc structure is the goal
```
