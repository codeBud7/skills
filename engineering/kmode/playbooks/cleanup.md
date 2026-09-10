# cleanup

**Triggers:** leftover processes, tear down verify instances, scratch files from a spike
**Capabilities:** `runCommand`, `editFiles`
**Principles:** smallest-change
**Mutates:** only what this session started
**Verification:** named PIDs/ports gone; evidence files still present

## Stages

1. Kill only processes this route started. Never kill by process name globally.
2. Delete scratch, not receipts.
3. Report what remains.

## Fallback

Unknown owner of a process → leave it; `blocked` on cleanup of that piece.

## Terminal

Cleanup report.
