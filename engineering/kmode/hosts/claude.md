# Claude Code

Map capabilities to Claude Code. Core playbooks still use capability names only.

| Capability | Claude Code |
|------------|-------------|
| `readFiles` / `editFiles` / `runCommand` / `git` | built-in tools |
| `spawn` | Agent / subagent; `isolation: worktree` when offered; `background` not `is_background` |
| `waitAgent` | wait on the subagent tool result |
| `resumeAgent` | host resume if present; else new spawn with the handoff note |
| `invokeSkill` | `/kmode` or skill tool; `disable-model-invocation` skills need explicit mention |
| `askUser` | AskUserQuestion or text |
| `planFile` | Plan mode; write `.claude/plans/<slug>.md` or `plan.md` |
| `openPullRequest` | `gh pr create --draft` |
| `watchChecks` | `gh pr checks` |
| `browserDrive` | Claude browser if enabled; else repo harness |
| `readTranscript` | not assumed; rely on `handoff` notes |
| `scheduleWake` | hooks if configured; else user re-invoke |
| `listModels` | skill/agent `model` field when allowed |
| `repoSkillsDir` | `.claude/skills` then `.agents/skills` |

## Sticky mode

No Cursor `mode: true`. After `/kmode`, keep the dispatcher policy in the conversation (see kmode Persistence).

## Missing

No MCP → skip those evidence sources; do not fake `why` from empty tools.
Plan approval = exit-plan tool or explicit `approved`.
