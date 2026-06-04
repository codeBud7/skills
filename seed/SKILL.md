---
name: seed
description: User-in-the-loop plan before coding — goals, trade-offs, risks, test/rollout.
disable-model-invocation: true
---

# Seed (collaborative plan)

## Hard gate

No impl until user approves plan ("approved", "execute", "LGTM on plan"). Spikes only if user agrees — read-only or throwaway.

## Cadence

1. **Intake** — goal one para; list constraints (time, stack, APIs, compliance, must-not-change).
2. **Discovery** — facts vs unknowns for touched areas. **Delegate** parallel read-only subagents to map entrypoints (`AGENTS.md`, README, scripts, modules); main thread synthesizes.
3. **Questions** — AskQuestion or one Q/msg. Order: goal → constraints → scope → quality bar → rollout. No unrelated batching.
4. **Options** — 2–3 approaches + trade-offs; recommend one; say what flips choice.
5. **Plan doc** — template below; user revises any section before lock-in.

## Sophistication

Major todo → risk/invariant (auth, money, PII, idempotency, contracts). CI vs human review gaps explicit. Workspace plan-cost rule → follow if present.

## Lock-in

Approved → final plan = source of truth. New scope → amend + re-approve.

## Plan template

```markdown
# Plan: [short title]

## Goal
[User-visible outcome; success in one sentence]

## Non-goals
[What we explicitly will not do this round]

## Context
[Files/services touched; dependencies; links to prior art in repo]

## Constraints & assumptions
[Hard limits the user gave; env; backwards compatibility]

## Approach
[Chosen direction; why alternatives rejected]

## Work breakdown
Ordered todos with **clear done criteria** per item (small enough for one PR when possible).

## Risks & mitigations
[What could go wrong; how we detect or roll back]

## Testing & verification
[Local commands, data fixtures, staging checks]

## Rollout / follow-ups
[Migrations, flags, docs, optional phase 2]
```
