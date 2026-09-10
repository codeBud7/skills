# Principle index

Read this index at the start of every multi-step `kmode` task. Load the full file for each name the route triggers. In the reply, name the principle and the decision it changed.

## Scope and design

| Name | File | Trigger |
|------|------|---------|
| smallest-change | [smallest-change.md](smallest-change.md) | Any mutation. Prefer delete and the smallest patch. |
| subtract-first | [subtract-first.md](subtract-first.md) | Dead code, extra adapters, speculative layers. |
| attack-the-premise | [attack-the-premise.md](attack-the-premise.md) | Two or more failed fixes sharing an assumption. |
| name-the-domain | [name-the-domain.md](name-the-domain.md) | Repeated rules scattered as conditionals. |
| exhaust-options | [exhaust-options.md](exhaust-options.md) | No precedent; competing designs cheap to try. |

## Architecture

| Name | File | Trigger |
|------|------|---------|
| boundary-check | [boundary-check.md](boundary-check.md) | Input, I/O, plugin, network edges. |
| illegal-states | [illegal-states.md](illegal-states.md) | Types that allow impossible combinations. |
| no-shared-mutable | [no-shared-mutable.md](no-shared-mutable.md) | Parallel work, caches, process globals. |

## Verification

| Name | File | Trigger |
|------|------|---------|
| reproduce-first | [reproduce-first.md](reproduce-first.md) | Bug, flake, CI fail — before the patch. |
| fix-the-cause | [fix-the-cause.md](fix-the-cause.md) | Symptom patch tempting. |
| prove-the-artifact | [prove-the-artifact.md](prove-the-artifact.md) | Before `done` on any mutating route. |
| one-check-per-slice | [one-check-per-slice.md](one-check-per-slice.md) | Multi-todo or multi-file change. |
| behavior-not-guts | [behavior-not-guts.md](behavior-not-guts.md) | Writing or editing tests. |
| script-the-proof | [script-the-proof.md](script-the-proof.md) | Proof will be re-run or delegated. |

## Delegation and memory

| Name | File | Trigger |
|------|------|---------|
| guard-context | [guard-context.md](guard-context.md) | Bulk read, logs, greps. |
| encode-the-lesson | [encode-the-lesson.md](encode-the-lesson.md) | Same advice twice. |
