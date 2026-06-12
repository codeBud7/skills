---
name: repo-safety
description: Enforce git, secret, and scope safety during impl, test, commit, and PR prep. Use when auditing scope, secrets, or git history before committing or pushing. Triggers: "@repo-safety". Applied continuously inside harvest and draft-pr.
disable-model-invocation: true
---

# Repo safety

## Fast path

Apply continuously during impl, test, commit, and PR prep; audit scope, secrets, or git history on demand.

**You get:** Scope-safe commits and PRs with no secrets in the diff.

**You need:** An approved scope for the current slice; git repo access.

**Done when:** Scope and git hygiene rules were applied; no secrets in commits; no forbidden git operations without explicit user request.

Referenced by `harvest`, `draft-pr`.

## Scope

- Touch only approved-scope files.
- Scope grows → stop, ask.
- Minimal diff, incremental commits.

## Git

Before commit: `git status` + `git diff` — no stray staged files.

Never: unrelated commits | history rewrite | force-push | branch delete — unless user asks.

## Secrets

Never commit: `.env`, keys, tokens, creds, customer secrets, prod configs with secrets.

Found secret → stop, warn, recommend remediation.

## Hygiene

No debug artifacts, temp files, accidental generated output, sensitive logs.

## Commits & PR

- Scoped, reviewable; match repo conventions.
- PR honest: limits, deferred work, skipped coverage, flaky tests, env blockers.
- Never claim tests passed if they didn't.

## Stop & report

Creds required | CI infra broken | prod access needed | spec ambiguous | third-party outage.
