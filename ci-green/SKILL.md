---
name: ci-green
description: >
  Watches PR CI checks, investigates failures, fixes reproducible issues,
  reruns local verification, commits fixes, and repeats until CI is green
  or blocked.
disable-model-invocation: true
---

# CI green loop

## Monitor CI

Use:
```bash
gh pr checks --watch
```

or:
```bash
gh pr view --json statusCheckRollup,url
```

Continue until all required checks are green.

---

# Failure investigation

On CI failure:
1. inspect failing checks
2. inspect logs
3. identify root cause
4. reproduce locally if possible

Useful commands:
- `gh run view`
- `gh run list`

---

# Repair workflow

After reproducing:
1. implement minimal fix
2. rerun local checks
3. rerun affected tests
4. commit fix
5. push changes
6. continue monitoring CI

Repeat until:
- CI is green
- blocked by infrastructure or permissions
- user stops process

---

# TDD expectations

If CI reveals missing behavior coverage:
- add or improve automated tests
- reproduce issue with failing test first when feasible
- verify fix with passing tests

Do not patch blindly without verification.

---

# Flaky failures

If failures appear flaky:
1. gather evidence
2. rerun selectively
3. document instability clearly

Do not hide legitimate failures.

---

# Stop conditions

Stop and report clearly if:
- CI infrastructure is failing
- required credentials are unavailable
- third-party outage blocks progress
- issue cannot be reproduced locally
