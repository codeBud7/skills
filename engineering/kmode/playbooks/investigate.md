# investigate

**Triggers:** why, where is, how does, root cause, what calls, map this
**Capabilities:** `readFiles`, `runCommand`, `spawn`, `git`
**Principles:** guard-context, reproduce-first, attack-the-premise
**Mutates:** no
**Verification:** evidence report with path:line, commands run, confidence. No patch.

## Stages

1. Invoke `investigate`. Split questions; spawn read-only.
2. Reproduce if a failure is claimed. Capture the failing command.
3. Synthesize. Do not "fix while looking" unless the user already asked for a fix (then chain `bug`).

## Fallback

No `spawn` → main-thread reads, still path:line first.

## Terminal

Evidence report. Optional next-route suggestion, not silent impl.
