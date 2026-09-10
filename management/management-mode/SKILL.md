---
name: management-mode
description: >
  management-mode is the management front door. Classify people-work requests,
  apply shared principles and contracts, then invoke one leaf skill. Use when
  the user says management-mode, @management-mode, or wants evidence-first
  management routing without naming a leaf skill.
disable-model-invocation: true
---

# management-mode

## Fast path

Read [principles.md](principles.md) → classify with **Precedence** → apply [contracts.md](contracts.md) → invoke one **leaf** → **no `done` without a sourced artifact or honest terminal state**.

Stay in this policy for the rest of the session until the user names a different leaf skill, stops management-mode, or switches to engineering work.

**You get:** One classified route, active principles with decisions, a leaf-owned artifact or advice answer, and an honest terminal state.

**You need:** A management request (1:1, feedback, review, hiring, team pulse, strategy, Home OS setup, self brag). Not code, bugs, CI, or shipping.

**Done when:** The leaf's **Done when** is met (or advice is answered), contracts are satisfied, terminal state is named, and save behavior matches [contracts.md](contracts.md).

## Glossary

- **Router / `management-mode`:** front door. Classifies intent, applies shared principles and contracts, then loads one leaf. Does not own templates or Fast path.
- **Leaf:** one existing management skill that executes the work: `home-os`, `1on1`, `1on1-log`, `feedback-note`, `review-prep`, `growth-plan`, `team-pulse`, `strategy-brief`, `hiring-feedback`, `brag-doc`. Owns stages, templates, retrieval, and Done when.
- **Home OS:** private durable store (profiles, sources, outputs). Setup and updates run through the `home-os` leaf.

## Persistence

After the first explicit invoke (`/management-mode`, `@management-mode`, or "use management-mode"), keep classifying follow-ups with this skill. Do not wait for `@management-mode` on every turn.

User names a leaf explicitly (`@1on1`, `@review-prep`, …) → run that leaf while retaining mode-wide privacy, evidence, save, and external-write contracts. Return to management-mode policy if work continues.

Engineering requests (code, bug, CI, ship) → refuse routing; point at `kmode`. Do not load engineering playbooks from here.

## Precedence

Match **top first**. First hit wins. Adjacent ambiguity → ask one focused question, then route.

1. `pause` — stop; note open subject, route, blockers, and latest private artifact paths. No people data in git.
2. `resume` — ask subject first; infer continuity from latest relevant private `outputs/` artifacts. Re-confirm stale windows.
3. `setup` — Home OS create/update, ladder, source links, new direct → `home-os`
4. `log` — 1:1 just ended, debrief, Granola transcript → `1on1-log`
5. `feedback` — SBI note, praise/constructive/upward feedback about a situation → `feedback-note`
6. `hiring` — interview debrief, rubric setup, HR paste-ready feedback → `hiring-feedback`
7. `brag` — self wins, weekly brag, promo narrative for the operator → `brag-doc`
8. `pulse` — "how is the team", weekly rollup (timeframe required) → `team-pulse`
9. `review` — performance evidence for a direct → `review-prep`
10. `growth` — forward development plan, what should they work on next → `growth-plan`
11. `1on1` — prep 1:1, follow-ups, career check-in → `1on1`
12. `strategy` — roadmap memo, bets, leadership decision doc → `strategy-brief`
13. `advice` — general management question with no matching artifact leaf; no source fetch by default
14. `refuse-eng` — code/bug/CI/ship → point at `kmode`

### Ambiguity shortcuts

| User says | Ask one question if needed | Default route |
|-----------|---------------------------|---------------|
| "How is Alex doing?" | 1:1 prep vs review vs growth vs pulse? | `1on1` if meeting soon; else `review` if cycle context; else ask |
| "Prep my meeting" | 1:1 vs strategy vs generic? | `1on1` if direct named; `strategy` if audience/decision named; else ask |
| Brag about a direct | Stop — not `brag-doc` | `review-prep` or `1on1` |
| "Log the 1:1" with no Granola | Log vs feedback note? | `1on1-log` if meeting happened; else ask |

### Multi-intent

Split into ordered leaves. Examples:

- "prep then log" → `1on1` then `1on1-log`
- "review then growth plan" → `review-prep` then `growth-plan`
- "prep every direct this week" → confirm scope once, serialize `1on1` per slug

Serialize multi-direct work: list scope, confirm once, one slug and one output file at a time. Never parallel-write `directs/` or `outputs/`.

## Classify output

On first invoke and whenever the route changes, state before work:

```
route: <route-id>
leaf: <leaf-name | advice | none>
subject: <slug | team | self | none>
window: <stated | default | blocking-ask | not-applicable>
privacy: <sensitive-off | sensitive-on | consent-needed>
save: <auto-private | ask-sensitive | ask-advice | blocked>
principles: <display name> — <decision changed>; ...
```

Then read the leaf `SKILL.md` and follow its Fast path. Do not copy leaf stages into management-mode todos. The leaf owns execution.

## Proof

Management proof is a **sourced artifact** plus honest `Missing context`, not compile/lint or `verify`.

- Artifact routes: leaf **Done when** + `Sources checked` (or leaf equivalent) + no invented claims.
- Advice route: direct answer; ask before private save.
- Thin evidence: questions and gaps only — never ratings, peer rank, or morale diagnosis.

Host cannot access configured sources → `blocked`, name the gap. Never invent `saved`.

## Contracts and principles

Statuses and save rules: [contracts.md](contracts.md). Named principles: [principles.md](principles.md). On each route change, list **all active principles** and the decision each changed.

Upstream `blocked` stops the route. Stricter leaf kill criteria always win over mode defaults.

## Terminal states

End each route in exactly one:

| State | Meaning |
|-------|---------|
| `answered` | Advice delivered; not auto-saved unless user approved |
| `drafted` | Valid artifact shown; not persisted (incomplete or user declined save) |
| `saved` | Completed artifact in private Home OS `outputs/` |
| `needs-input` | One blocking question; route can continue after answer |
| `blocked` | Capability, access, or safety boundary prevents completion |
| `not-applicable` | Named stage or save rule does not apply; one-sentence why |

## Handoff

When a route completes and a canonical next step exists, **offer one** — never start it automatically. Examples: after `1on1` prep → offer `1on1-log` after the meeting; after `review-prep` → offer `growth-plan`.

## Escape hatch

User names a leaf explicitly → run that leaf. Still apply shared contracts from [contracts.md](contracts.md). Radical Candor and leaf-specific tone stay in the leaf, not here.

## Verification

Acceptance scenarios: [scenarios.md](scenarios.md). Run representative cases before claiming the router is complete.
