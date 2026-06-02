---
name: tdd-cycle
description: >
  Implements fixed-scope changes using TDD: write failing tests first,
  implement minimal code to pass, and refactor safely with tests green.
disable-model-invocation: true
---

# TDD workflow

Use strict red → green → refactor development.

## Phase 1 — Understand behavior

Before coding:
1. identify expected behavior
2. identify affected modules
3. identify existing testing patterns
4. identify existing fixtures/helpers/mocks
5. determine appropriate test level:
   - unit
   - integration
   - e2e

If requirements are ambiguous, stop and clarify.

---

# Phase 2 — Red

Before implementation:
1. add or modify tests
2. run tests
3. confirm tests fail for the expected reason

Requirements:
- tests must validate intended behavior
- failures must be meaningful
- avoid over-mocking
- prefer deterministic tests
- preserve existing coverage

Examples:
- bugfix → reproduce bug with failing test
- feature → define expected behavior with tests first
- refactor → add characterization tests first

Do not implement before seeing failing tests unless impossible to automate.

---

# Phase 3 — Green

Implement the minimal code required to make tests pass.

Rules:
- prefer smallest viable change
- preserve backward compatibility unless instructed otherwise
- match repository patterns and conventions
- avoid speculative abstraction

After implementation:
- rerun affected tests
- verify intended behavior
- ensure no unrelated regressions

---

# Phase 4 — Refactor

With tests green:
1. improve readability
2. reduce duplication
3. improve naming
4. simplify structure
5. improve maintainability

After each meaningful refactor:
- rerun tests
- verify no behavioral drift

Do not reduce coverage without justification.

---

# Phase 5 — Final verification

Before handing off:
- confirm tests pass
- confirm edge cases are covered
- confirm regressions are protected
- identify any intentionally uncovered cases

If no automated tests were added:
- explain why
- document alternate verification performed
