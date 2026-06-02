---
name: draft-pr
description: >
  Reviews repository state, creates scoped commits, pushes the branch,
  and opens a draft pull request with proper summary and test plan.
disable-model-invocation: true
---

# Draft PR workflow

## Pre-commit inspection

Inspect:
- `git status`
- `git diff`
- `git diff --cached`
- `git log`
- `git diff <base>...HEAD`

Validate:
- only intended files changed
- no secrets committed
- no unrelated generated artifacts

---

# Commit creation

Use repository commit conventions:
- Conventional Commits
- ticket prefixes
- scoped commit messages

Prefer:
- small logical commits
- descriptive messages
- multi-line bodies when useful

---

# Push branch

Push branch to remote:

```bash
git push -u origin HEAD
```

---

# Create draft PR

Open draft PR using:
```bash
gh pr create --draft
```

PR description should include:
- summary
- rationale
- implementation notes
- test plan
- TDD evidence
- risks or rollout notes

---

# Required PR checklist

- [ ] Tests added or updated first
- [ ] New tests fail before implementation
- [ ] New tests pass after implementation
- [ ] Lint passes
- [ ] Typecheck passes
- [ ] Relevant tests pass
- [ ] No unrelated file changes
- [ ] No secrets committed

---

# Final reporting

Report:
- PR URL
- uncommitted files if any
- known limitations
- deferred work
- skipped coverage if applicable
