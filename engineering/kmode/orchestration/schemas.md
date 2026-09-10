# Orchestration store

Host-neutral files. Root: `kmode-orch/<program-slug>/` in the workspace unless the user names another dir. Do not put secrets in the store.

Version the schema in `meta.json`: `"schema": 1`.

## Files

| File | Role |
|------|------|
| `meta.json` | slug, schema, created, host |
| `units.tsv` | id, title, status, isolation, receipt_path |
| `ledger.tsv` | utc, unit_id, event, note |
| `decisions.tsv` | utc, principle, decision |
| `verify-receipts/` | copies or pointers to receipts |
| `inbox/` | notes from children |
| `status.md` | **derived** from units; never the source of truth |
| `pause.md` | resume note when the program stops |

## units.tsv

```
id	title	status	isolation	receipt_path
u1	parse flags	pass	worktree-a	verify-receipts/u1.md
```

`status`: `pending` | `in_progress` | `pass` | `blocked` | `waived`

`done` is not a unit status. `pass` requires `receipt_path`.

## Atomicity

Write to `*.tmp` then rename. One writer per file. If a lock file `store.lock` is older than 30 minutes, take it over and record `ledger` event `stale-lock`.

## Isolation

Each in-flight unit gets its own worktree, branch, or working dir. No two `in_progress` units share a mutable tree.

## Deriving status.md

Regenerate from `units.tsv` after every unit terminal. Counts only. Do not claim green units without receipts.
