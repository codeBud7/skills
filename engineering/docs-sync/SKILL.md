---
name: docs-sync
description: Docs sync aligns repo docs with a code diff, or records an explicit waiver, before draft PR. Use when syncing docs to a change or checking doc drift.
---

# Docs sync

## Fast path

Doc map → drift vs `git diff <base>...HEAD` → fix or waiver before `draft-pr`.

**You get:** Docs aligned with the branch diff, or an explicit waiver recorded for the PR.

**You need:** Code diff on branch; `local-quality-gate` green (or documented skip).

**Done when:** Doc map covers touched areas; every stale/missing item is fixed, waived with user OK, or honestly blocked; repo doc CI passes from execution or skip + risk is documented; doc changes and waivers are ready for `draft-pr`.

Pre-flight: `local-quality-gate` `pass`, `waived`, or `not-applicable` — not upstream `blocked`.

## Gate contract

- **`pass`** — drift resolved or valid waiver recorded; doc generators/checks run when repo expects them, or skip + risk documented.
- **`waived`** — user approved no doc change for identified drift; record `Docs: no change — <reason>` in plan or PR body.
- **`blocked`** — stale/missing public contract without fix or waiver; stop harvest; set plan todo `blocked_reason`.
- Do not advance to `draft-pr` on **`blocked`**. Waiver for public API/architecture drift requires explicit user OK.

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
