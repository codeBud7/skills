# review

**Triggers:** review this, review the PR, review since main
**Capabilities:** `readFiles`, `runCommand`, `git`, `spawn`
**Principles:** prove-the-artifact, guard-context
**Mutates:** no
**Verification:** two-axis report delivered; gate classified. Empty diff is `blocked`

## Stages

1. Pin fixed point. Confirm non-empty three-dot diff.
2. Invoke `code-review`. Parallel Standards + Spec.
3. Do not implement findings unless the user then asks (reclassify to `bug` / `refactor`).

## Fallback

No git → `blocked`.

## Terminal

`code-review` output with gate `pass` | `stop-user-input-needed` | `waived` | `blocked`.
