# Skills

Personal Agent Skills for engineering delivery and engineering management. Each skill is a folder with `SKILL.md` plus optional templates. Agents discover skills from descriptions and apply them when your prompt matches.

## Collections

| Collection                            | Purpose                                                                  | Start here         |
| ------------------------------------- | ------------------------------------------------------------------------ | ------------------ |
| [engineering/](engineering/README.md) | Plan, implement, test, deslop, document, open PR, get CI green           | `seed` → `harvest` |
| [management/](management/README.md)   | Home OS context, 1:1 prep, hiring feedback, review prep, strategy briefs | `home-os` first    |

## Quick Routing

**Ship a feature or fix**

1. `seed` — plan before code; get approval.
2. `harvest` — execute plan: TDD, local gates, deslop, docs, draft PR, CI green.

**Stand up agent docs on a repo**

- `create-agent-docs` — `AGENTS.md` + `docs/` layout (separate from ship pipeline).

**Manager workflows**

1. `home-os` — private EM context and direct profiles.
2. `1on1`, `review-prep`, `hiring-feedback`, or `strategy-brief` as needed.

## How Skills Work Here

- **Canonical source:** this git repo (clone anywhere; skills live under `engineering/` and `management/`).
- **Tool homes:** install flat symlinks into the skills directory your agent reads, for example:
  - Cursor: `~/.cursor/skills`
  - Claude: `~/.claude/skills`
  - Agents: `~/.agents/skills`
- **Invocation:** Most skills auto-invoke from natural language. `seed`, `harvest`, and `create-agent-docs` require explicit mention (`@harvest`, "ship it", etc.).
- **Orchestration:** `harvest` runs sub-skills in order; individual skills (`tdd-cycle`, `ci-green`, …) also work standalone.
- **Subagents:** Read-only discovery or parallel work → delegate; main thread keeps decisions and edits.

## Setup

Install skills into a tool home with flat symlinks (`<dest>/<skill-name>` → repo source). No nested `engineering/` or `management/` directories are created under the destination.

```bash
./scripts/setup-skills.sh --tool agents
./scripts/setup-skills.sh --tool claude
./scripts/setup-skills.sh --tool cursor
./scripts/setup-skills.sh --dest ~/.some-agent/skills
./scripts/setup-skills.sh --all
./scripts/setup-skills.sh --dry-run --tool agents
```

- `--dry-run` prints planned links without changing anything.
- `--force` replaces conflicting entries at managed skill names only.
- If a destination is a whole-repo symlink (for example `~/.claude/skills` → this repo), use `--force` to replace it with a directory of per-skill links.

When this repo lives at `~/.cursor/skills`, the `cursor` preset adds root-level symlinks (for example `harvest` → `engineering/harvest`) alongside the canonical `engineering/` and `management/` trees.

**Upgrading from an older clone:** delivery skills moved from the repo root into `engineering/`. Re-run `./scripts/setup-skills.sh --tool cursor` (or your tool home) so flat symlinks point at the new paths. Management skills are new under `management/`.

## Repo Layout

```text
skills/
  README.md              ← you are here
  scripts/setup-skills.sh
  engineering/           ← delivery pipeline + agent docs
  management/            ← EM Home OS + prep skills
```

Do not put real people data, secrets, or filled Home OS content in this git repo. Management private data lives outside git — see [management/README.md](management/README.md).

## Typical Prompts

| Intent                      | Say                                                         |
| --------------------------- | ----------------------------------------------------------- |
| Plan before coding          | "Seed a plan for …" / `/seed`                               |
| Execute approved plan       | "Harvest this plan" / `@harvest` + plan path                |
| Ship without naming harvest | "Ship it" / "Open draft PR" / "Get CI green"                |
| Agent docs on repo          | "Set up agent docs" / `@create-agent-docs`                  |
| Management setup            | "Set up my management Home OS"                              |
| Add direct profile          | "Add a direct profile for Jane Doe"                         |
| 1:1 prep                    | "Prep my 1:1 with jane-doe"                                 |
| Hiring rubric setup         | "Set up hiring rubric for [role]" + paste job description   |
| Hiring feedback             | "Turn these interview notes into HR feedback" + paste notes |
| Review prep                 | "Prep performance review for jane-doe"                      |
| Strategy brief              | "Strategy brief: should we consolidate on one platform?"    |

Skill behavior and gates live in each `SKILL.md`. Collection READMEs are the usage index; skills are the source of truth.
