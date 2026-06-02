---
name: seed
description: >
  Produces a structured, high-quality implementation plan through tight collaboration
  with the user (goals, constraints, trade-offs, risks, test and rollout). Use when
  the user wants a sophisticated plan before coding, says "plan with me", "design
  first", "interactive plan", or attaches this skill for a non-trivial feature or
  refactor.
disable-model-invocation: true
---

# Collaborative plan (user-in-the-loop)

## Hard gate

- **No implementation** (no feature code, no refactors beyond tiny spikes for discovery) until the user **explicitly approves** the final plan (e.g. "approved", "execute the plan", "LGTM on plan").
- Spikes allowed only when user agrees they are needed to size unknowns; keep them read-only or throwaway branches.

## Cadence

1. **Intake** — Restate goal in one short paragraph. List **known constraints** (time, stack, APIs, compliance, "must not change X").
2. **One discovery pass** — Read repo entrypoints the task touches (`AGENTS.md`, README, package scripts, relevant modules). Summarize **facts** (what exists) vs **unknowns** (what needs a decision).
3. **Structured questions** — Prefer **AskQuestion** (or one clear question per message). Never batch unrelated decisions. Order: goal → constraints → scope boundaries → quality bar (tests, migrations) → rollout.
4. **Options** — For non-obvious choices, present **2–3 approaches** with trade-offs (complexity, risk, maintenance). **Recommend one**; say what would change the recommendation.
5. **Plan document** — After answers, output a single plan with the sections below. Offer to revise any section the user wants before lock-in.

## Plan template (required sections)

Use this structure so the plan stays scannable and mergeable with implementation later.

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

## Sophistication bar

- Tie each major todo to a **risk** or **invariant** (auth, money, PII, idempotency, API contracts).
- Call out **CI vs human review** gaps: deterministic checks belong in CI later; plan should not rely on "someone remembers."
- If the workspace has a **plan cost / token estimate** rule, follow it for this plan output.

## Lock-in

When the user approves:

1. Paste or save the **final** plan as the single source of truth for execution.
2. Do not silently expand scope; new scope → amend plan and re-approve.
