---
name: harvest
description: >
  End-to-end shipping workflow for fixed-scope work: TDD implementation,
  local quality gates, draft PR creation, and CI green verification.
disable-model-invocation: true
---

# Harvest orchestration workflow

Use this skill when the user says:
- ship it
- open a draft PR
- get CI green
- finalize implementation
- prepare for review

This skill orchestrates smaller reusable skills.

---

# Execution order

## 1. Apply repository safety

Continuously apply:
- repo-safety

Key requirements:
- no secrets
- no unrelated staged files
- no destructive git operations without approval
- minimal scoped diffs

---

# 2. Implement using TDD

Run:
- tdd-cycle

Requirements:
- tests written or updated first
- confirm failing tests before implementation
- implement minimal fix
- refactor safely with tests green

---

# 3. Run local quality gates

Run:
- local-quality-gate

Requirements:
- lint green
- format checks green
- typecheck green
- relevant tests green
- build verification green if applicable

Do not proceed with known local failures unless explicitly instructed.

---

# 4. Create draft PR

Run:
- draft-pr

Requirements:
- scoped commits
- proper PR summary
- test plan included
- TDD evidence included

Report PR URL after creation.

---

# 5. Drive CI to green

Run:
- ci-green

Requirements:
- monitor checks
- inspect failures
- reproduce locally
- fix minimally
- rerun verification
- push updates

Repeat until:
- CI is green
- blocked
- user stops process

---

# Stop before merge

Do not merge unless explicitly instructed.

Do not:
- force-push without approval
- bypass failing required checks
- hide flaky or environmental failures

---

# Definition of done

Work is complete only when:
- implementation is complete
- tests were written first when feasible
- local checks pass
- CI is green
- draft PR exists
- diffs are clean and scoped
- known limitations are documented
