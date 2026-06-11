# 🛠️ Engineering skills

Mid-sprint the PM widens the ticket. You (or the agent) generate a big diff fast. Then lint noise, vague tests, and `AGENTS.md` drift show up right as CI goes red on the draft PR. This pipeline exists so you are not improvising “tighten, document, open PR, fix checks” from scratch every time: **approve a plan once**, then **walk the same path to green**.

**For behavior and gates, read each skill’s `SKILL.md`.**

## 📌 What you can do here

- Run the default loop: plan with **`seed`**, then execute with **`harvest`**.
- Call a single step (`tdd-cycle`, `local-quality-gate`, `ci-green`, …) without `harvest`.
- Bootstrap **`AGENTS.md`** + **`docs/`** with **`create-agent-docs`** when repo structure is the goal.

## 🚀 Do this next

1. New work: **`seed`** → you approve the plan file → **`harvest`** with that plan.
2. One step only: name the skill you need.
3. New repo docs layout: **`create-agent-docs`** (not part of **`harvest`**).

Install symlinks from repo root: [../README.md](../README.md) (see **Install** there).

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

## 🧰 Skills (what changes on the job)

- [`seed`](seed/SKILL.md): **Before fingers hit keyboard:** goals, risks, todos; the approval gate catches bad assumptions early.
- [`harvest`](harvest/SKILL.md): **End-to-end ship:** from approved plan through draft PR and green CI without you micromanaging every sub-step.
- [`repo-safety`](repo-safety/SKILL.md): **Trust:** sensible commits, PR scope, no secrets in the diff narrative.
- [`tdd-cycle`](tdd-cycle/SKILL.md): **Proof:** red → green → refactor per slice so “it works” is not just a vibe.
- [`local-quality-gate`](local-quality-gate/SKILL.md): **Team bar:** lint, format, types, tests, and build. Catch what CI would have yelled about, earlier.
- [`cultivate`](cultivate/SKILL.md): **Reviewer respect:** trim AI slop; reviewers see intentional code, not noise.
- [`docs-sync`](docs-sync/SKILL.md): **Onboarding wins:** docs match the change (or you explicitly waive); fewer “where is this documented?” threads.
- [`draft-pr`](draft-pr/SKILL.md): **Visibility:** scoped commits, push, draft PR. Stakeholders see progress without a messy branch story.
- [`ci-green`](ci-green/SKILL.md): **Unblock:** iterate checks until green instead of hand-waving flakes.
- [`create-agent-docs`](create-agent-docs/SKILL.md): **New repo smell:** scaffold `AGENTS.md` + `docs/` so the *next* agent session starts smarter.

`seed`, `harvest`, and `create-agent-docs` require explicit mention in the prompt.

## 💬 Typical prompts

- **Plan:** “Seed a plan for …” / `/seed` + scope.
- **Ship:** “Harvest the plan at `.cursor/plans/…`” / “Ship it” / “Get CI green” / “One pass harvest for this plan”.
- **Single step:** “Run local quality gate” / “Deslop this branch” / “Sync docs with this diff” / “Fix CI on this PR”.
- **Agent docs:** “Set up agent docs for this repo” / `@create-agent-docs`.

## 🤝 Subagents

Use subagents for read-only discovery (layout, CI, tests) or parallel work. Main thread: scope, edits, verifying gates.

## ✅ Gates (summary)

- **Done when:** Implementation complete, tests-first where it fits, local green, cultivate applied, docs synced or waived, draft PR open, CI green, scoped diff.
- **Stops without approval for:** Force-push, skipping required checks, papering over env/flaky failures.
- **`docs-sync`** must pass (or explicit waiver) before **`draft-pr`**. Details: [`harvest/SKILL.md`](harvest/SKILL.md).

## 📄 Templates and references

- [`create-agent-docs/templates/`](create-agent-docs/templates/): blank `AGENTS.md`, `architecture.md`, `runbook.md`, `decisions.md`.
- [`seed/reference.md`](seed/reference.md): plan shape, todos, cost line.

## 🔗 Dependency order

```text
seed → harvest → (repo-safety + tdd-cycle + local-quality-gate + cultivate + docs-sync + draft-pr + ci-green)

create-agent-docs: standalone when doc structure is the goal
```
