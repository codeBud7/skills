---
name: repo-safety
description: Repo safety enforces git, secret, and scope boundaries during implementation, test, commit, and PR prep.
disable-model-invocation: true
---

# Repo safety

## Fast path

Apply continuously during impl, test, commit, and PR prep; audit scope, secrets, or git history on demand.

**You get:** Scope-safe commits and PRs with no secrets in the diff.

**You need:** An approved scope for the current slice; git repo access.

**Done when:** `git diff` is scoped to approved work; staged files contain no secrets; no unrelated files are staged; forbidden git operations were used only after explicit user request.

## Scope

- Touch only approved-scope files.
- Scope grows → stop and ask.
- Minimal diff, incremental commits.

## Git

Before commit: `git status` + `git diff` — no stray staged files.

Allowed only on explicit user request: unrelated commits | history rewrite | force-push | branch delete.

## Secrets

Keep out of commits: `.env`, keys, tokens, creds, customer secrets, prod configs with secrets. If user asks to commit real secrets, warn and refuse.

Found secret → stop, warn, recommend remediation.

## Hygiene

No debug artifacts, temp files, accidental generated output, sensitive logs.

## Commits & PR

- Scoped, reviewable; match repo conventions.
- PR honest: limits, deferred work, skipped coverage, flaky tests, env blockers.
- Claim tests passed only when they actually did.

## Stop & report

Creds required | CI infra broken | prod access needed | spec ambiguous | third-party outage.
