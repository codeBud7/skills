---
name: draft-pr
description: Draft PR creates scoped commits, pushes the branch, and opens a draft PR with summary and test plan. Use when changes are ready to push into a draft PR.
---

# Draft PR

## Fast path

Pre-flight `repo-safety` → inspect diff → scoped commits → push → `gh pr create --draft`.

**You get:** A draft PR with honest summary, test plan, and scoped commits.

**You need:** Changes ready to push; `code-review` gate passed, waived, or blocked status recorded; `docs-sync` gate passed (updates or waiver).

**Done when:** Draft PR exists with honest body (summary, test plan, code-review result, docs changes or waiver, risks); lint/typecheck/relevant tests are **reported from executed runs or documented skips with risk**; upstream gates (`repo-safety`, `code-review`, `docs-sync`, `local-quality-gate` when applicable) are `pass`, `waived`, or `not-applicable` — not silently `blocked`.

## Gate contract

- Upstream **`blocked`** → `draft-pr` is **blocked**. Do not open a PR implying green checks.
- **`pass`** requires draft PR URL plus honest gate status for each upstream skill in the PR body.
- Behavior-changing branches need at least one executed verification result in the test plan — not "skipped" for every check.
- Documented skip + risk is allowed per upstream skill rules; skip-all is never `pass`.

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

Body: summary | rationale | impl notes | test plan | TDD evidence per `tdd-cycle` when tests changed | **code review** per `code-review` | **documentation** per `docs-sync` | risks/rollout.

## Checklist

- [ ] Lint + typecheck + relevant tests pass, or skips documented with risk
- [ ] `tdd-cycle` evidence included when tests changed
- [ ] No unrelated files or secrets (`repo-safety`)
- [ ] `code-review` gate passed, or severe findings resolved/waived/blocked with user input
- [ ] `docs-sync` gate passed (updates committed or waiver documented)

## Report

PR URL | uncommitted files | limits | deferred | skipped coverage.
