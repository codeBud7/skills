# Engineering skills

## What this is

Index for the plan → ship pipeline (`seed`, `harvest`) and related one-off skills, plus `create-agent-docs`. Use this README to pick a skill and a prompt shape; it does not replace per-skill procedures.

**For behavior and gates, read each skill’s `SKILL.md`.**

## What you can do here

- Run the default loop: plan with `seed`, then execute with `harvest`.
- Call a single step (`tdd-cycle`, `local-quality-gate`, `ci-green`, …) without `harvest`.
- Bootstrap `AGENTS.md` + `docs/` with `create-agent-docs`.

## Do this next

1. New work: `seed` → human approves plan file → `harvest` with that plan.
2. One step only: name the skill you need.
3. New repo docs layout: `create-agent-docs` (not part of `harvest`).

Install symlinks from repo root: [../README.md](../README.md#install).

## Ship pipeline

`harvest` runs sub-skills in order. `repo-safety` applies throughout.

```text
seed (plan, approve)
  ↓
harvest
  repo-safety ─────────────────────────────┐
  tdd-cycle                                │
  local-quality-gate                       │ continuous
  cultivate                                │
  docs-sync                                │
  draft-pr                                 │
  ci-green                                 ┘
```

Approved plan file = runbook: harvest tracks todos in the file (default: each todo = one slice through TDD + gates; optional “one pass” runs the stack once for the whole plan). Triggers include: `ship it`, `open draft PR`, `get CI green`, `@harvest` + plan path.

## Skills

- [`seed`](seed/SKILL.md) — Plan before code; goals, risks, todos.
- [`harvest`](harvest/SKILL.md) — Execute approved plan through draft PR and green CI.
- [`repo-safety`](repo-safety/SKILL.md) — Commits, push, PR scope, secrets hygiene.
- [`tdd-cycle`](tdd-cycle/SKILL.md) — Red → green → refactor per slice.
- [`local-quality-gate`](local-quality-gate/SKILL.md) — Lint, format, types, tests, build.
- [`cultivate`](cultivate/SKILL.md) — Deslop / tighten AI-generated code; re-green.
- [`docs-sync`](docs-sync/SKILL.md) — Docs match change (or waived); gate before PR.
- [`draft-pr`](draft-pr/SKILL.md) — Scoped commits, push, draft PR.
- [`ci-green`](ci-green/SKILL.md) — Fix PR checks until green.
- [`create-agent-docs`](create-agent-docs/SKILL.md) — `AGENTS.md` + `docs/` scaffold.

`seed`, `harvest`, and `create-agent-docs` require explicit mention in the prompt.

## Typical prompts

- **Plan:** “Seed a plan for …” / `/seed` + scope.
- **Ship:** “Harvest the plan at `.cursor/plans/…`” / “Ship it” / “Get CI green” / “One pass harvest for this plan”.
- **Single step:** “Run local quality gate” / “Deslop this branch” / “Sync docs with this diff” / “Fix CI on this PR”.
- **Agent docs:** “Set up agent docs for this repo” / `@create-agent-docs`.

## Subagents

Use subagents for read-only discovery (layout, CI, tests) or parallel work. Main thread: scope, edits, verifying gates.

## Gates (summary)

- **Done when:** Implementation complete, tests-first where it fits, local green, cultivate applied, docs synced or waived, draft PR open, CI green, scoped diff.
- **Stops without approval for:** Force-push, skipping required checks, papering over env/flaky failures.
- **`docs-sync`** must pass (or explicit waiver) before **`draft-pr`**. Details: [`harvest/SKILL.md`](harvest/SKILL.md).

## Templates and references

- [`create-agent-docs/templates/`](create-agent-docs/templates/) — blank `AGENTS.md`, `architecture.md`, `runbook.md`, `decisions.md`.
- [`seed/reference.md`](seed/reference.md) — plan shape, todos, cost line.

## Dependency order

```text
seed → harvest → (repo-safety + tdd-cycle + local-quality-gate + cultivate + docs-sync + draft-pr + ci-green)

create-agent-docs — standalone when doc structure is the goal
```
