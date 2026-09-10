---
name: kmode
description: >
  kmode is the engineering front door. Classify the request, apply named
  principles, load a playbook, prove real artifacts, then dispatch leaf skills.
  Use when the user says kmode, @kmode, or wants principle-based engineering
  without naming a leaf skill.
disable-model-invocation: true
---

# kmode

## Fast path

Read [principles/index.md](principles/index.md) → classify with **Precedence** → load one playbook → copy its stages into todos → invoke leaf skills → **no `done` without proof**.

Stay in this policy for the rest of the session until the user names a different leaf skill or says stop kmode.

**You get:** One classified route, named principles with decisions, executed proof or an honest `blocked`.

**You need:** An engineering request (code, bug, investigation, plan, ship, CI, deps, pause/resume). Not management or people briefs.

**Done when:** The playbook's route-specific terminal artifact or handoff exists,
and its gate is classified when the leaf defines one. Mutating work has a
[verify](../verify/SKILL.md) receipt or a recorded `not-applicable` why.

## Persistence

After the first explicit invoke, keep classifying follow-ups with this skill. Do not wait for `@kmode` on every turn. User `@harvest` / `@seed` / other explicit leaf → run that leaf, then return to kmode policy if work continues.

## Precedence

Match **top first**. First hit wins. Any route collision → ask one question, then route.

1. `pause` — stop, WIP commit, resume note
2. `resume` — pick up prior kmode/harvest work
3. `orchestrate` — many independent units, durable ledger
4. `plan` — need an approved plan before code (`seed`)
5. `ship` — approved plan exists; user wants it shipped (`harvest`)
6. `ci` — PR checks red or "get CI green"
7. `deps` — upgrade or assess a dependency
8. `review` — review a diff/PR, not implement
9. `verify-harness` — create or maintain a project-local verify skill
10. `investigate` — why/where/how, no code change asked
11. `bug` — defect, fail, regression, flake
12. `performance` — slow, alloc, p99, trace
13. `refactor` — same behavior, different shape
14. `prototype` — spike, throwaway, compare approaches
15. `architect` — design options, no impl yet
16. `feature` — new behavior, product slice
17. `cleanup` — leftover after a route (stranded processes, scratch)

Multi-intent: split into ordered routes. Example: "why is X broken then fix it" → `investigate` then `bug`. Do not skip investigate when the cause is unknown.

Non-engineering (1:1, hiring, Home OS) → refuse routing; point at management skills. Do not load those files from kmode.

## Classify output

State in chat before work:

```
route: <playbook-id>
principles: <name> — <decision changed>; ...
verify: required | not-applicable (<why>)
capabilities: <list> (missing → fallback)
```

Then read the playbook and copy its stages **verbatim** into todos. Do not skip a stage without `not-applicable` + why.

## Proof

Mutating routes require [prove-the-artifact](principles/prove-the-artifact.md). Run `verify` unless the playbook sets verification to tests that already drove the **same** user path. Compile, lint, or a subagent summary is not that path.

Investigation-only: proof = evidence trail (commands, files, traces), not a patch.

Host cannot drive the surface → `blocked`, name missing capability. Never invent `pass`.

## Gates

Statuses: [contracts.md](contracts.md). Upstream `blocked` stops the route. `waived` needs a named user risk.

## Host

Read [hosts/capabilities.md](hosts/capabilities.md) plus the profile for this host (`cursor.md` / `claude.md` / `codex.md`). Call capabilities, not product names, in playbook logic.

## Escape hatch

User names a leaf skill explicitly (`@tdd-cycle`, `@cultivate`) → run that skill. Still apply `repo-safety` and do not claim `done` without its gate.
