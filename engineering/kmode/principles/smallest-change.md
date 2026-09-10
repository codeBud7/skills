# smallest-change

Prefer deletion and the smallest patch that solves the stated problem.

**Why:** Extra surface is extra proof and extra review. A large diff hides the actual fix.

**Apply when:** About to add a file, layer, flag, or helper "for later."

**Do:** Change the fewest modules that restore the invariant. Delete dead paths in the same slice when they block the fix.

**Don't:** Add a framework, wrapper, or config surface the request did not need.

**Report:** Name what you refused to add, or why a larger change was required.
