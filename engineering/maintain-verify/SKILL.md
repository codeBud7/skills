---
name: maintain-verify
description: >
  Maintain-verify updates a project-local verify-<app> skill and feature map
  when the app surface changes. Use when selectors rot, routes move, or a
  verify receipt failed because the map was stale.
---

# Maintain verify

## Fast path

Find `verify-<app>` → diff map vs current routes/commands → patch Launch/Drive/features → re-run one changed feature → receipt.

**You get:** An honest map and harness that still drive the real app.

**You need:** An existing project-local verify skill (else `create-verify`).

**Done when:** Stale entries fixed or removed; one drive of a changed feature passed; evidence kept.

## Gate contract

- **`pass`** — map matches current surface for touched features; one executed drive.
- **`blocked`** — harness cannot run, or edits made with zero drive.
- **`not-applicable`** — no verify skill in the repo; tell the user to run `create-verify`.

## Workflow

1. Locate `verify-<app>` via host `repoSkillsDir` and `.agents/skills/`.
2. Compare feature files to current routes, CLI help, or screens.
3. Update selectors/commands. Delete features that no longer exist.
4. Run doctor + one changed feature. Cleanup keeps evidence.
5. If the same miss happened twice, add an assertion (`encode-the-lesson`).
