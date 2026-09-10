# 🛠️ Engineering skills

`kmode` is the front door. Classify the work, name the principles that change the decision, load a playbook, **prove the real artifact**, then ship through `harvest` when a PR is the goal. Leaf skills still exist; you name them only to skip classify.

## 🌊 Flow

```text
kmode
  classify → principles → playbook
    investigate / bug / feature / performance / refactor / …
    verify (receipt) before done
    seed (plan) when scope is not tiny
    harvest (ship) when the user wants a draft PR
      repo-safety ── continuous
      tdd-cycle → local-quality-gate → verify (if tests missed the user path)
      cultivate → code-review → docs-sync → draft-pr → ci-green
```

**Proof:** compile, lint, and chat summaries are not done. `verify` drives a user path (UI, CLI, API, or library) and writes a receipt. Missing harness → `blocked`, not a fake pass.

**Triggers:** `@kmode` / `kmode` plus the task. After the first invoke, keep routing follow-ups until the user names a leaf skill or says stop. Direct `@harvest` / `@seed` still work (escape hatch).

## 🧰 Skills

**Dispatcher**

- [`kmode`](kmode/SKILL.md): classify, principle index, playbooks, host capabilities. Playbooks live in [`kmode/playbooks/`](kmode/playbooks/). Principles in [`kmode/principles/`](kmode/principles/).

**Plan and ship**

- [`seed`](seed/SKILL.md): approved plan file before code.
- [`harvest`](harvest/SKILL.md): approved plan → tests, gates, deslop, review, docs, draft PR, CI.
- [`repo-safety`](repo-safety/SKILL.md): scope, secrets, git bounds (continuous).

**Build slices**

- [`feature`](feature/SKILL.md), [`bugfix`](bugfix/SKILL.md), [`refactor`](refactor/SKILL.md), [`performance`](performance/SKILL.md), [`prototype`](prototype/SKILL.md)
- [`tdd-cycle`](tdd-cycle/SKILL.md), [`local-quality-gate`](local-quality-gate/SKILL.md), [`cultivate`](cultivate/SKILL.md)

**Understand and design**

- [`investigate`](investigate/SKILL.md), [`architect`](architect/SKILL.md), [`code-review`](code-review/SKILL.md)

**Prove**

- [`verify`](verify/SKILL.md): one user-path receipt.
- [`create-verify`](create-verify/SKILL.md) / [`maintain-verify`](maintain-verify/SKILL.md): project-local `verify-<app>` skill + feature map.

**Ship extras**

- [`docs-sync`](docs-sync/SKILL.md), [`draft-pr`](draft-pr/SKILL.md), [`ci-green`](ci-green/SKILL.md), [`dep-upgrade`](dep-upgrade/SKILL.md)

**Large / stop**

- [`orchestrate`](orchestrate/SKILL.md): durable units + receipts.
- [`handoff`](handoff/SKILL.md): pause/resume note.

`kmode`, `seed`, `harvest`, `tdd-cycle`, `repo-safety`, `create-verify`, `orchestrate`, `handoff` want an explicit mention (`disable-model-invocation`). The others may auto-trigger from natural language.

## 🧭 Playbooks

pause, resume, orchestrate, plan, ship, ci, deps, review, verify-harness, investigate, bug, performance, refactor, prototype, architect, feature, cleanup. Precedence is listed in [`kmode/SKILL.md`](kmode/SKILL.md). Fixtures: [`kmode/fixtures/routes.md`](kmode/fixtures/routes.md).

## 🖥️ Hosts

Core skills stay host-neutral. Profiles map capabilities (spawn, plan file, browser, PR, CI):

- [Cursor](kmode/hosts/cursor.md)
- [Claude Code](kmode/hosts/claude.md)
- [Codex](kmode/hosts/codex.md)

Install with `../scripts/setup-skills.sh --tool cursor|claude|codex`. Check structure: `../scripts/validate-kmode.sh`.

## 💬 Typical prompts

- **Front door:** “kmode: login 500s on staging” / `@kmode` + the task.
- **Plan:** “Seed a plan for …” (kmode routes to `plan` if you stay in kmode).
- **Ship:** “Harvest the plan at …” / “Ship it”.
- **Proof:** “Verify the resend path” / “Create a verify skill for this app”.
- **Single step:** `@cultivate` / “Run local quality gate” (escape hatch).

## 🤝 Subagents

Read-only discovery and parallel review → children. Main thread: scope, edits, gates, reading receipts (not summaries).

## 🚚 Migration

Used to start at `seed`/`harvest`? Still valid. Prefer `@kmode` so bugs get reproduce-first, features get user-path proof, and investigations do not silently patch. Pre-plan grill lives in productivity (`grill-me`); kmode does not load it automatically.
