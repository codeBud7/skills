# pause

**Triggers:** pause, stop here, wrap up the session, save WIP
**Capabilities:** `git`, `editFiles`, `askUser`
**Principles:** smallest-change, script-the-proof
**Mutates:** git (WIP commit only if user allows dirty tree)
**Verification:** resume note exists and names next command; `not-applicable` for product proof

## Stages

1. Inventory: branch, dirty files, last gate status, open plan path.
2. Ask before WIP commit if anything is staged or unstaged.
3. Write resume note via `handoff` (path, todos left, receipts, blockers).
4. Do not push unless user asked.

## Fallback

No git → write the resume note only; `blocked` on commit.

## Terminal

Resume note on disk. Chat points at the path.
