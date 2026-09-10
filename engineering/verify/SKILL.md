---
name: verify
description: >
  Verify runs a real user path and writes a receipt. Use after a mutating
  change, when kmode requires proof, or when compile/lint is not enough.
---

# Verify

## Fast path

Pick surface → launch or reuse harness → drive one user path → capture evidence → write receipt → tear down without deleting evidence.

**You get:** A receipt with command, expected vs observed, artifact paths, and `pass` / `blocked` / `not-applicable`.

**You need:** A change or claim to prove; a way to start or invoke the system (repo script, test, CLI, HTTP, or browser).

**Done when:** Receipt on disk; evidence files still exist after cleanup; gate is honest.

## Gate contract

- **`pass`** — the **same** user path was driven; expected matched observed; artifacts exist.
- **`blocked`** — could not start, drive failed, evidence missing, or only proxies were used.
- **`not-applicable`** — no observable user path (pure comment/docs) **or** an executed test already drove this exact path; name the command.
- **`waived`** — user accepted missing proof with recorded risk.
- Screenshot alone, "it compiles," cached images, and subagent summaries are not `pass`.

## Surface

Pick one primary: UI | CLI | API | library. Note others.

Prefer, in order: project-local `verify-<app>` skill → repo test/e2e script → documented dev command + drive → this skill's generic recipe.

## Drive

- UI: real browser or project harness. Click/type the path. Check related routes if they share state. Empty/error states if the change touches them.
- CLI: isolated process; assert stdout/stderr/exit and side effects (files, git refs).
- API: real HTTP to the running service or a documented test server; assert status and body. Dry-run names are not trusted — observe whether network/files were touched.
- Library: call the public API; assert a literal value.

Mocks only at a production boundary that already isolates an external system.

## Receipt

Write using [receipt.template.md](receipt.template.md). Default path: `verify-receipts/<utc-stamp>-<slug>.md` in the workspace (create the dir). Do not commit unless the user asked or the work is a long audit.

Fields required: command, expected, observed, artifacts, not-exercised, gate.

## Cleanup

Stop only what this run started. Keep receipts and evidence. Never `killall` by process name.

## Delegated work

Read the artifact (diff, file, command output). Do not trust the child summary.
