---
name: repo-safety
description: >
  Enforces repository and git safety rules during implementation, testing,
  commits, and PR preparation. Use whenever modifying a repository.
disable-model-invocation: true
---

# Repository safety rules

Apply these rules continuously throughout all work.

## Scope control

- Only modify files directly related to the approved scope.
- If scope expands materially, stop and ask for confirmation.
- Prefer minimal diffs and incremental commits.

## Git hygiene

Before every commit:
- inspect `git status`
- inspect `git diff`
- confirm no unrelated files are staged

Never:
- commit unrelated changes
- rewrite history unless explicitly requested
- force-push unless explicitly requested
- delete branches without approval

## Secret handling

Never commit:
- `.env`
- API keys
- tokens
- credentials
- customer secrets
- production configs containing secrets

If secrets are discovered:
1. stop immediately
2. warn clearly
3. recommend remediation

## Safety checks

Validate:
- no debug artifacts
- no temporary files
- no accidental generated output
- no sensitive logs

## Commit discipline

- Keep commits scoped and reviewable.
- Match repository commit conventions.
- Prefer multiple small commits over large mixed commits.

## PR discipline

- Be transparent about:
  - known limitations
  - deferred work
  - skipped coverage
  - flaky tests
  - environmental blockers

Never claim tests passed if they did not.

## Stop conditions

Stop and report clearly if:
- credentials are required
- CI infrastructure is broken
- production access is required
- behavior/specification is ambiguous
- third-party outage blocks progress
