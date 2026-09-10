---
name: seed
description: Seed creates a user-approved plan file before coding.
disable-model-invocation: true
---

# Seed

## Fast path

Read-only planning → Cadence → one plan file on disk → user approval before impl.

**You get:** An approved plan file with todos and acceptance criteria on disk.

**You need:** A scoped task or design question; user available for approval gate.

**Done when:** One plan file on disk with valid YAML todos and body per [reference.md](reference.md); implementation has not started; approval gate below is recorded.

## Gate

Implementation starts only after plan approval (host UI, exit-plan tool, or `approved` / `execute` / `LGTM on plan`). Spikes require user OK and stay read-only.

## Gate contract

- **`pass`** — one plan file on disk; todos have done criteria; approval recorded; implementation has not started.
- **`blocked`** — scope ambiguous, user unavailable for the approval gate, or file missing required shape.
- **`not-applicable`** — user asked for a spike only; stay read-only; no impl.

## Deliver

Read-only planning → **Cadence** → **one plan file** on disk (summary + path in chat). Amend = edit same file. After approval → implement; file = source of truth; **harvest** to ship.

**File:** YAML frontmatter (`name`, `overview`, `todos[{id, content}]` with done criteria) + markdown body. Path: host tool path | Claude `plan.md` or `.claude/plans/<slug>.md` | else `plans/<slug>.md`. Body: H1 first; no tables. Skeleton + cost rule: [reference.md](reference.md).

## Host (one)

| Host | Plan | Approve | Run |
|------|------|---------|-----|
| IDE agent (plan mode) | Plan-mode artifact; fallback `plans/<slug>.md` | Plan UI or text gate | Agent mode |
| Claude Code | Plan mode; write canonical path | Exit plan tool | Implement mode |
| Else | `plans/<slug>.md` | Text gate | User go |

## Cadence

Intake → discovery (parallel read-only subagents; `AGENTS.md` / `CLAUDE.md` / README) → questions (AskQuestion if available; goal → constraints → scope → quality → rollout) → 2–3 options + pick → plan file → re-confirm.

Auth/money/PII/contract todos: risks + mitigations explicit. Scope change: edit file + re-approve.
