---
name: handoff
description: >
  Handoff writes a resume note (and optional WIP commit) so a later session can
  reconstruct branch, gates, and receipts. Use for pause, session pickup, or
  orchestrate stop.
disable-model-invocation: true
---

# Handoff

## Fast path

Inventory git + plan + receipts → write `pause.md` → WIP commit only with user OK.

**You get:** A note a cold agent can read and continue from.

**You need:** In-progress engineering work.

**Done when:** Note on disk names branch, remaining todos, receipt paths, and blockers. Product proof is `not-applicable`.

## Gate contract

- **`pass`** — note exists and is sufficient to resume without the chat.
- **`blocked`** — dirty tree the user refused to commit and the note cannot list files.
- **`not-applicable`** — nothing to pause.

## Note shape

Default path: `.kmode-handoff.md` in the workspace, or `kmode-orch/<slug>/pause.md` during orchestrate.

```markdown
# Resume

- **Branch:**
- **Plan:**
- **Route left:**
- **Gates:** skill = status
- **Receipts:** paths
- **Do next:** one command or playbook id
- **Do not:** merge/force-push unless asked
```

## Resume

Read the note, `git status`, plan file. Classify remainder with `kmode`. Do not redo `pass` slices.
