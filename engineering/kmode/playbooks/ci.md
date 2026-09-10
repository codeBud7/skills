# ci

**Triggers:** CI red, checks failing, get CI green
**Capabilities:** `runCommand`, `git`, `watchChecks`, `editFiles`
**Principles:** reproduce-first, fix-the-cause, prove-the-artifact
**Mutates:** yes (minimal fix)
**Verification:** remote required checks executed green, or `blocked` with log evidence

## Stages

1. Invoke `ci-green`. Watch checks.
2. Reproduce locally when possible. No blind patch.
3. Missing coverage → `tdd-cycle` first.
4. Push only scoped fixes. Re-watch.

## Fallback

No `watchChecks` → run local parity commands; `blocked` on claiming remote green.

## Terminal

`ci-green` gate `pass` / `blocked` / `waived`.
