# fix-the-cause

Trace to the cause; do not paper the symptom.

**Why:** A retry, catch-all, or extra timeout makes the next outage quieter and longer.

**Apply when:** Tempted to swallow an error, widen a sleep, or add a second write "to be sure."

**Do:** Name the invariant that broke. Restore it at the owner of the state.

**Don't:** Catch-and-log as the fix.

**Report:** Cause vs symptom, and why the patch hits the owner.
