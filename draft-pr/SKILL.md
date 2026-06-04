---
name: draft-pr
description: Create scoped commits, push the branch, and open a draft PR with summary and test plan. Use when opening a draft PR, preparing changes for review, or finalizing a branch. Referenced by harvest.
disable-model-invocation: true
---

# Draft PR

Pre-flight: apply `repo-safety` (scope, secrets, hygiene).

## Inspect

`git status` | `git diff` | `git diff --cached` | `git log` | `git diff <base>...HEAD`

**Resolve `<base>`:** open PR → `gh pr view --json baseRefName -q .baseRefName`; else repo default → `gh repo view --json defaultBranchRef -q .defaultBranchRef.name`. `docs-sync` reuses same `<base>`.

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

Body: summary | rationale | impl notes | test plan | TDD evidence | **documentation** (changes or `Docs: no change — <reason>`) | risks/rollout.

## Checklist

- [ ] Tests added/updated first
- [ ] New tests fail before impl
- [ ] New tests pass after impl
- [ ] Lint + typecheck + relevant tests pass
- [ ] No unrelated files (`repo-safety`)
- [ ] No secrets (`repo-safety`)
- [ ] `docs-sync` gate passed (updates committed or waiver documented)

## Report

PR URL | uncommitted files | limits | deferred | skipped coverage.
