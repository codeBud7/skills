# no-shared-mutable

Remove sharing before adding locks.

**Why:** Locks and globals hide races. Isolation is cheaper to prove.

**Apply when:** Parallel agents, caches, temp files, ports, databases used by two writers.

**Do:** Separate worktrees, ports, data dirs, or copies. Share only immutable inputs.

**Don't:** Coordinate two writers on one live instance "carefully."

**Report:** What you isolated instead of locking.
