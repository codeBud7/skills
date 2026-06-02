---
name: local-quality-gate
description: >
  Discovers and runs repository lint, format, typecheck, build, and test
  commands locally until green or blocked.
disable-model-invocation: true
---

# Local quality gate

## Discover commands

Inspect:
- `package.json`
- CI workflow files
- `AGENTS.md`
- `README.md`
- repository scripts

Identify:
- lint commands
- format checks
- typecheck commands
- test commands
- build commands

Prefer repository-native workflows.

---

# Execution order

Run in this order:

1. targeted tests for changed behavior
2. affected test suite
3. lint
4. format check
5. typecheck
6. build verification
7. full test suite if feasible

Examples:
- `pnpm lint`
- `pnpm test`

---

# Failure handling

On failure:
1. inspect root cause
2. implement minimal fix
3. rerun affected checks
4. rerun full impacted surface

Do not ignore:
- lint failures
- typecheck failures
- flaky tests introduced by changes

---

# Verification rules

Before completion:
- ensure all relevant checks pass
- ensure new tests pass both isolated and in-suite
- ensure formatting is correct
- ensure builds succeed if applicable

If checks are skipped:
- explain why explicitly
- document remaining risk
