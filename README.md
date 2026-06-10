# Skills

## What this is

Personal Cursor/agent skills for shipping code and for engineering-manager workflows. This repo is the canonical copy; each skill is a folder with `SKILL.md` (and sometimes templates). This README is an index only — it does not define behavior.

**For behavior and gates, read each skill’s `SKILL.md`.**

## What you can do here

- See which folder matches your task (engineering vs management).
- Install flat symlinks into the skills directory your tool reads (`~/.cursor/skills`, `~/.claude/skills`, `~/.agents/skills`).
- Know where private manager data is allowed to live (not in this repo).

## Do this next

1. Run install from the repo root (see below).
2. Open [engineering/README.md](engineering/README.md) for plan → ship and agent docs.
3. Open [management/README.md](management/README.md) for Home OS and EM prep skills.

## Where things live

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

## Install

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

## Privacy

Do not commit real people data, secrets, filled Home OS files, or generated briefs. Private EM data stays outside git — see [management/README.md](management/README.md).

## More detail

- Most skills auto-invoke from natural language; **`seed`**, **`harvest`**, and **`create-agent-docs`** need you to name them (e.g. `@harvest`, “ship it”).
- Example phrases for engineering and management: [engineering/README.md](engineering/README.md), [management/README.md](management/README.md).
