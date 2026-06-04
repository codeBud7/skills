---
name: repo-safety
description: Enforce git, secret, and scope safety during impl, test, commit, and PR prep. Use when committing, pushing, opening PRs, or any time scope/secrets/git history are at risk. Referenced by harvest and draft-pr.
disable-model-invocation: true
---

# Repo safety

Apply continuously. Referenced by `harvest`, `draft-pr`.

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
