# Cursor

Map capabilities to Cursor. Core playbooks still use capability names only.

| Capability | Cursor |
|------------|--------|
| `readFiles` / `editFiles` / `runCommand` / `git` | built-in tools |
| `spawn` | Task tool; `subagent_type` for explore/shell; `run_in_background` when long |
| `waitAgent` | wait on Task completion; do not busy-poll |
| `resumeAgent` | Task `resume` when the host exposes it |
| `invokeSkill` | Read `SKILL.md` after `/kmode` or `@kmode` |
| `askUser` | AskQuestion when present, else a single question |
| `planFile` | Plan mode artifact when available; else `plans/<slug>.md` via file tools |
| `openPullRequest` | `gh pr create --draft` |
| `watchChecks` | `gh pr checks` |
| `browserDrive` | browser MCP / IDE browser |
| `readTranscript` | workspace agent-transcripts if present |
| `scheduleWake` | `/loop` when available; else tell the user to re-invoke |
| `listModels` | Task model slugs; invalid slug → inherit |
| `repoSkillsDir` | `.cursor/skills` then `.agents/skills` |

## Sticky mode

Cursor `mode` frontmatter is **not** required. Persistence is the kmode SKILL Persistence section.

## Missing

No browser MCP → UI `verify` `blocked` unless a repo harness exists.
No cloud worktrees → isolate with local branches; say so in orchestrate.
