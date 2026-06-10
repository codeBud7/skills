---
name: seed
description: User-in-the-loop plan before coding — goals, trade-offs, risks, test/rollout. Use for /seed, plan before implementation, or plan mode in Cursor or Claude Code.
disable-model-invocation: true
---

# Seed

## Gate

No impl until plan approved (host UI, exit-plan tool, or `approved` / `execute` / `LGTM on plan`). Spikes = user OK, read-only only.

## Deliver

Read-only planning → **Cadence** → **one plan file** on disk (not full plan in chat; summary + path only). Amend = edit same file. After approval → implement; file = source of truth; **harvest** to ship.

**File:** YAML frontmatter (`name`, `overview`, `todos[{id, content}]` with done criteria) + markdown body. Path: host tool path | Claude `plan.md` or `.claude/plans/<slug>.md` | else `plans/<slug>.md`. Body: H1 first; no tables. Skeleton + cost rule: [reference.md](reference.md).

## Host (one)

| Host | Plan | Approve | Run |
|------|------|---------|-----|
| Cursor | `SwitchMode` plan → `CreatePlan`; revise = edit file | Plan UI | `SwitchMode` agent |
| Claude Code | Plan mode; write canonical path | Exit plan tool | Implement mode |
| Else | `plans/<slug>.md` | Text gate | User go |

## Cadence

Intake → discovery (parallel read-only subagents; `AGENTS.md` / `CLAUDE.md` / README) → questions (AskQuestion if available; goal → constraints → scope → quality → rollout) → 2–3 options + pick → plan file → re-confirm.

Auth/money/PII/contract todos: risks + mitigations explicit. Scope change: edit file + re-approve.
