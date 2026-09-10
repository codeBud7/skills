# reproduce-first

A failing case exists before a mutating fix.

**Why:** A patch without a repro is a guess. You cannot know you closed the hole.

**Apply when:** Bug, CI red, flake, "it broke on staging."

**Do:** Capture the failing command, test, or user path. Run it. See the fail. Then change code.

**Don't:** Edit production code because a log "looks like" the cause.

**Report:** The exact repro command and the failure it showed.
