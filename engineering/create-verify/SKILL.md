---
name: create-verify
description: >
  Create-verify generates a project-local verify-<app> skill that launches,
  drives, and proves the real app. Use when the repo has no scripted user-path
  proof, or the user asks for a control/verify skill.
disable-model-invocation: true
---

# Create verify

## Fast path

Interview the repo → write `verify-<app>` (Launch, Doctor, Drive, Evidence, Cleanup) → feature map (3–5) → run one feature → keep evidence after cleanup.

**You get:** A project-local skill an agent can run cold, plus one executed receipt.

**You need:** A repo that can start, or a precise report of why it cannot.

**Done when:** Skill + map exist; one mapped feature driven; evidence survived cleanup; no placeholders left.

## Gate contract

- **`pass`** — generated skill executed one feature end to end; evidence still on disk.
- **`blocked`** — app will not start, drive failed, or skill never run.
- **`not-applicable`** — a current `verify-<app>` already exists and `maintain-verify` is the right skill.

## Interview (from the repo, not the user)

Ask the user only what you cannot observe:

- **Surface:** UI, CLI/TUI, API, library, desktop, mobile. Pick primary.
- **Run:** documented dev command, ports, env, seed, auth.
- **Drive:** existing Playwright/Cypress/PTY/HTTP first; then generic browser or HTTP.
- **Observe:** screenshots, transcripts, bodies, logs, exit codes, DB/files.
- **Isolate:** can two instances run? If no, the generated skill must refuse double-drive.

Broken startup → fix or report before generating. Verification-only scratch (sample config) must be marked and removed in cleanup.

## Output location

Host-neutral: prefer the repo's agent skills dir from the host profile (`repoSkillsDir`). Default fallback: `.agents/skills/verify-<app>/`. Never hardcode a single vendor folder as the only path.

YAML frontmatter: `name: verify-<app>` matching the directory. `description` names the app, surface, and when to use it.

## Skill sections (no placeholders)

- **Launch:** exact command, ready signal, teardown. Short-lived CLI: build once, each drive in its own process.
- **Doctor:** read-only "is this instance ours?"
- **Drive:** real selectors/commands from this repo.
- **Evidence:** proof standards — user path, action + resulting state, side effects. Named artifact dir.
- **Cleanup:** kill what you started; never delete evidence.
- **Helpers:** executable; invocation shown in the skill body.

## Feature map

`features/README.md` plus one file per top user-facing feature (aim 3–5). Each file: Sub-features; How to get to it (user POV); Driving it with the harness; Gotchas. Template: [feature-map.template.md](feature-map.template.md).

## Prove before handoff

Run launch → doctor → **one** mapped feature → capture → cleanup. Confirm evidence still exists. Failed iteration also runs cleanup so ports do not strand. An un-run generator is a draft, not `pass`.

Then point the user at `maintain-verify`.
