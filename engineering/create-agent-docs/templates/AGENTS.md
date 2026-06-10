# {Project name}: agent instructions

Read this first when working in this repo. It routes you to the right docs.

## What this repo is

<!-- Most important section: write it thoroughly. An agent reading only this section should
understand the project well enough to work safely. Keep component-level detail (modules, data
flow, build internals) in docs/architecture.md, not here. Replace each TODO below. -->

TODO: what this repo does and the problem it solves.

TODO: who uses it (team, product, downstream systems).

**In scope:** TODO: what this repo is responsible for.

**Out of scope:** TODO: what it explicitly does not do.

**How it fits:** TODO: where it sits in the wider org or product (if evident from the repo).

## Read order for a new session

1. [`docs/architecture.md`](docs/architecture.md): how the system fits together
2. [`docs/runbook.md`](docs/runbook.md): setup, auth, operations, common failures
3. [`docs/decisions.md`](docs/decisions.md): why things are the way they are
<!-- Add other docs/*.md (e.g. context.md) to the order if present -->

## Folder map

| Path | Purpose |
|------|---------|
| `docs/` | Living documentation for agents and humans |
| TODO | Map the key top-level directories |

## Rules for agents

- TODO: hard rules, gotchas, things an agent cannot infer from the code.
- Defer deterministic checks (lint, types, tests) to CI; do not restate them here.
- This file is the single source of truth; do not add tool-specific instruction files.
- Keep this file and `docs/` up to date: when a change makes a doc wrong, fix it in the same pull request.
