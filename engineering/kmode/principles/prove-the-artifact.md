# prove-the-artifact

Verify the real thing: run the feature, read the written value, inspect the live diff.

**Why:** "It compiles," cached screenshots, and subagent summaries are proxies. Proxies lie cheaply.

**Apply when:** Before marking any mutating route `done`.

**Do:** Drive the user path or the exported API. Capture output. For delegated work, read the file and the command result, not the summary.

**Don't:** Infer from mtimes, "should work," or a prior screenshot.

**Report:** Command or harness, expected vs observed, path to evidence. Missing evidence → `blocked`.
