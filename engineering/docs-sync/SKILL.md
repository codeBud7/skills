---
name: docs-sync
description: Align docs with diff or waive before draft PR. Hard gate for harvest.
disable-model-invocation: true
---

# Docs sync

Triggers: `@docs-sync` | harvest step before `draft-pr`.

**Hard gate:** harvest must not call `draft-pr` until Done passes.

Pre-flight: `local-quality-gate` green (or user skips tests — document risk).

## Discover

Repo-native doc surfaces: `README.md`, `docs/`, OpenAPI/Swagger, API `.md`, architecture/ADR, `AGENTS.md` / `CLAUDE.md` / `.cursor/rules/` (if contracts changed), doc scripts in `package.json` / `Makefile`, CI doc checks. Read-only subagent OK.

Output: **doc map** — path → what it documents.

## Drift

`git diff <base>...HEAD` (same `<base>` as [draft-pr/SKILL.md](../draft-pr/SKILL.md)).

Doc-relevant: public routes/RPC shapes, auth, errors; exported SDK/CLI/env/config; module boundaries, data flows, topology; breaking vs additive. Ignore internal refactors with no observable contract change.

Per affected doc-map entry: **Stale** (doc ≠ diff) | **Missing** (new public contract, no doc) | **OK** (aligned or internal-only).

Run repo doc generators/checks when present (OpenAPI regen, `npm run docs:lint`, etc.).

## Gate

Before `draft-pr`:

- **Fixed** — doc edits on branch; re-run generators if repo expects
- **Waived** — plan or PR body: `Docs: no change — <reason>` (non-public / internal only)
- **Blocked** — stale/missing without fix or waiver → stop harvest; set plan todo `blocked_reason` if plan-driven

On fail: minimal fix → re-run generators/checks → re-check. Don't waive public API/architecture drift without user OK.

Main thread: edits. Subagent: doc map + drift report only.

## Done

- Doc map for touched areas; every stale/missing item fixed or waived
- Repo doc CI pass (or skip + risk documented)
- PR summary ready: doc changes + waivers
