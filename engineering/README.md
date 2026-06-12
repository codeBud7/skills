# 🛠️ Engineering skills

Mid-sprint the PM widens the ticket. You (or the agent) generate a big diff fast. Then lint noise, vague tests, and `AGENTS.md` drift show up right as CI goes red on the draft PR. This pipeline exists so you are not improvising “tighten, document, open PR, fix checks” from scratch every time: **approve a plan once**, then **walk the same path to green**.

## 🌊 Ship pipeline

Picture this chain: **`seed`** locks intent before code; **`harvest`** runs the rest in order while **`repo-safety`** keeps commits, scope, and secrets sane. Impact: fewer wrong-direction merges and a PR that already passed the boring hygiene your team cares about.

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

**Example prompt chain:** “Seed a plan for the auth refactor” → you approve `.cursor/plans/…` → “Harvest that plan.” You spend less time re-explaining scope to the agent; the agent spends less time skipping gates.

## 🧰 Skills

- [`seed`](seed/SKILL.md): **Before fingers hit keyboard:** goals, risks, todos; the approval gate catches bad assumptions early.
- [`harvest`](harvest/SKILL.md): **End-to-end ship:** from approved plan through draft PR and green CI without you micromanaging every sub-step.
- [`repo-safety`](repo-safety/SKILL.md): **Trust:** sensible commits, PR scope, no secrets in the diff narrative.
- [`tdd-cycle`](tdd-cycle/SKILL.md): **Proof:** red → green → refactor per slice so “it works” is not just a vibe.
- [`local-quality-gate`](local-quality-gate/SKILL.md): **Team bar:** lint, format, types, tests, and build. Catch what CI would have yelled about, earlier.
- [`cultivate`](cultivate/SKILL.md): **Reviewer respect:** trim AI slop; reviewers see intentional code, not noise.
- [`docs-sync`](docs-sync/SKILL.md): **Onboarding wins:** docs match the change (or you explicitly waive); fewer “where is this documented?” threads.
- [`draft-pr`](draft-pr/SKILL.md): **Visibility:** scoped commits, push, draft PR. Stakeholders see progress without a messy branch story.
- [`ci-green`](ci-green/SKILL.md): **Unblock:** iterate checks until green instead of hand-waving flakes.
- [`create-agent-docs`](create-agent-docs/SKILL.md): **New repo smell:** scaffold `AGENTS.md` + `docs/` so the _next_ agent session starts smarter.
- [`dep-upgrade`](dep-upgrade/SKILL.md): **Safe bumps:** assess changelog/breaking changes, upgrade incrementally, verify via local gate + CI. Standalone — not part of `harvest`.

`seed`, `harvest`, `create-agent-docs`, `tdd-cycle`, and `repo-safety` require explicit mention (e.g. `@harvest`, `@tdd-cycle`). The other steps (`local-quality-gate`, `ci-green`, `docs-sync`, `draft-pr`, `cultivate`, `dep-upgrade`) can also auto-trigger from natural language.

## 💬 Typical prompts

- **Plan:** “Seed a plan for …” / `/seed` + scope.
- **Ship:** “Harvest the plan at `.cursor/plans/…`” / “Ship it” / “Get CI green” / “One pass harvest for this plan”.
- **Single step:** “Run local quality gate” / “Deslop this branch” / “Sync docs with this diff” / “Fix CI on this PR”.
- **Deps:** “Upgrade react to 19” / “Is it safe to bump dependencies?” / “Bump lodash”.
- **Agent docs:** “Set up agent docs for this repo” / `@create-agent-docs`.

## 🤝 Subagents

Use subagents for read-only discovery (layout, CI, tests) or parallel work. Main thread: scope, edits, verifying gates.
