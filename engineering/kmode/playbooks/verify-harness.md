# verify-harness

**Triggers:** create a verify skill, control skill for this repo, update the feature map
**Capabilities:** `readFiles`, `editFiles`, `runCommand`, `browserDrive` (if web)
**Principles:** script-the-proof, prove-the-artifact, encode-the-lesson
**Mutates:** project-local verify skill and map
**Verification:** generator must drive one mapped feature and keep evidence after cleanup

## Stages

1. New harness → `create-verify`. Existing stale map → `maintain-verify`.
2. Interview the repo. Do not invent launch commands.
3. Prove by running one feature. Cleanup must not delete evidence.

## Fallback

App will not start → `blocked` on the generator; fix startup or report precisely.

## Terminal

Project-local `verify-<app>` skill + one successful receipt, or `blocked`.
