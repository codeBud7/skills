---
name: draft-pr
description: Scoped commits, push branch, open draft PR with summary + test plan.
disable-model-invocation: true
---

# Draft PR

Pre-flight: apply `repo-safety` (scope, secrets, hygiene).

## Inspect

`git status` | `git diff` | `git diff --cached` | `git log` | `git diff <base>...HEAD`

## Commit

Repo conventions (Conventional Commits, ticket prefix, scoped msgs). Small logical commits; body when useful.

## Push

```bash
git push -u origin HEAD
```

## Create

```bash
gh pr create --draft
```

Body: summary | rationale | impl notes | test plan | TDD evidence | risks/rollout.

## Checklist

- [ ] Tests added/updated first
- [ ] New tests fail before impl
- [ ] New tests pass after impl
- [ ] Lint + typecheck + relevant tests pass
- [ ] No unrelated files (`repo-safety`)
- [ ] No secrets (`repo-safety`)

## Report

PR URL | uncommitted files | limits | deferred | skipped coverage.
