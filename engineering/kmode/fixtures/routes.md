# Routing fixtures

Human-readable cases for `kmode` precedence. First matching row wins.

| Request | Route | Proof |
|---------|-------|--------|
| pause and write a resume note | pause | note on disk |
| pick up yesterday's harvest | resume | reconstructed state |
| implement the 12 independent packages | orchestrate | per-unit receipts |
| seed a plan for auth | plan | plan file, no impl |
| harvest the approved plan | ship | harvest gates + verify if needed |
| CI is red on the PR | ci | remote checks |
| bump lodash to 4.17.21 | deps | local-quality-gate |
| is the react 19 bump safe? | deps | assessment, no upgrade |
| review this branch since main | review | two-axis report |
| create a verify skill for this app | verify-harness | one driven feature |
| why does checkout 500 | investigate | evidence, no patch |
| why does checkout 500, then fix it | investigate then bug | repro then receipt |
| login button does nothing | bug | pre-fail + post-green receipt |
| p99 of /search doubled | performance | before/after numbers |
| extract the parser, same behavior | refactor | suite before/after |
| spike sqlite vs postgres for cache | prototype | two receipts + pick |
| how should we structure billing | architect | options + pick, no impl |
| add a resend-email endpoint | feature | tdd + user-path receipt |
| kill the verify preview server we started | cleanup | only our PID |
| ship it | ship | approved plan required |
| `@cultivate` deslop this file | leaf `@cultivate` | cultivate gate (escape hatch) |

Ambiguous "make it better" → one question (perf vs refactor vs feature), then route.

Missing proof on a mutating route → `blocked`, never `done`.
