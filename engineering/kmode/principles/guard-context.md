# guard-context

Send bulk reading to a subagent. Keep findings, not dumps, in the main thread.

**Why:** Main context is the scarce resource. Logs and repo walks exhaust it.

**Apply when:** Wide grep, CI logs, layout mapping, multi-file search.

**Do:** Delegate read-only. Ask for path:line and a short note. Main thread decides.

**Don't:** Paste megabytes of logs into the parent chat.

**Report:** What you delegated and the compressed finding you kept.
