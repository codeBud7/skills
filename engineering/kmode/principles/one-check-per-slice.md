# one-check-per-slice

End each small unit in a check before starting the next.

**Why:** A pile of unchecked edits makes the first failure undiagnosable.

**Apply when:** Multiple todos, files, or independent behaviors.

**Do:** One behavior, one proof, then the next. Independent units may run in parallel if they do not share mutable state.

**Don't:** Implement the whole plan, then "test at the end."

**Report:** Which slice was proven and which is next.
