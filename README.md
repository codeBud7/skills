# ✨ Skills

You already context-switch between shipping and leading. These folders are **repeatable playbooks** for your agent: same week you might land a hotfix _and_ walk into a 1:1 you did not have headspace to prep. The repo holds the skills and templates.

## 💡 Why this exists

One afternoon the ticket is fuzzy but the deadline is not. Another morning you need review bullets that do not sound like vibes. **Engineering** skills bias toward plan → ship → green CI with less thrash. **Management** skills bias toward evidence-backed briefs (1:1s, reviews, hiring, strategy) once your private Home OS has enough signal. Same idea in both places: less reinventing the workflow every time.

## 🛤️ Pick your lane

**IC or tech lead: shipping**

You are staring at an ambiguous scope change mid-sprint. Instead of coding straight into a wall, you **name `seed`**, get a plan file approved, then **`harvest`** so TDD, local gates, doc sync, draft PR, and CI green happen in order. Impact: fewer “wait, wrong direction” rewrites and a PR reviewers can actually reason about.

**Manager or EM: people and planning**

Your notes live in five tools and your calendar says the 1:1 is tomorrow. You run **`home-os`** once, fill **`context.md`** and a **`directs/<slug>.md`**, and link sources when you can. Then **`1on1`** or **`review-prep`** can turn that into a short brief with tagged evidence instead of a Sunday-night re-read of everything. Impact: calmer prep, clearer follow-ups, feedback that cites reality.

## 📌 What you can do here

- Figure out whether **engineering** or **management** matches the task, then open that collection’s README.
- Install flat symlinks so Cursor, Claude Code, or other hosts pick up these skills.
- Remember where private manager data is allowed to live (not in this git repo).

## 🚀 Do this next

1. Run install from the repo root (see below).
2. Open [engineering/README.md](engineering/README.md) for plan → ship and agent docs.
3. Open [management/README.md](management/README.md) for Home OS and EM prep skills.

## 🗂️ Where things live

```text
skills/
  README.md
  scripts/setup-skills.sh
  engineering/     # seed, harvest, gates, create-agent-docs, …
  management/      # home-os, 1on1, review-prep, hiring-feedback, strategy-brief
```

| Collection                            | Start here                        |
| ------------------------------------- | --------------------------------- |
| [engineering/](engineering/README.md) | `seed` → approve plan → `harvest` |
| [management/](management/README.md)   | `home-os` first                   |

## ⚙️ Install

Flat symlinks: `<dest>/<skill-name>` → file in this repo. The script does not create nested `engineering/` or `management/` under the destination.

```bash
./scripts/setup-skills.sh --tool cursor
./scripts/setup-skills.sh --tool claude
./scripts/setup-skills.sh --tool agents
./scripts/setup-skills.sh --dest ~/.some-agent/skills
./scripts/setup-skills.sh --all
./scripts/setup-skills.sh --dry-run --tool agents   # print only
```

- `--dry-run`: print planned links, change nothing.
- `--force`: replace conflicting entries for managed skill names only.
- If the destination is a single symlink to this whole repo (e.g. `~/.claude/skills` → here), use `--force` to replace it with a directory of per-skill links.

If this repo is checked out at `~/.cursor/skills`, the `cursor` preset adds top-level links (e.g. `harvest` → `engineering/harvest`) next to the `engineering/` and `management/` trees.

**Upgrade:** If you had an old layout with delivery skills at repo root, re-run `./scripts/setup-skills.sh --tool cursor` (or your home) so links target `engineering/`. Management skills live under `management/`.

## 🔒 Privacy

Do not commit real people data, secrets, filled Home OS files, or generated briefs. Private EM data stays outside git. See [management/README.md](management/README.md).

## ℹ️ More detail

- Most skills auto-invoke from natural language; **`seed`**, **`harvest`**, and **`create-agent-docs`** need you to name them (e.g. `@harvest`, “ship it”).
- Example phrases for engineering and management: [engineering/README.md](engineering/README.md), [management/README.md](management/README.md).
