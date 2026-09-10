# Codex

Map capabilities to Codex / Agent Skills. Core playbooks still use capability names only.

Skill `name` is lowercase hyphen-case and matches the directory (`kmode`, not `kmode Mode`).

| Capability | Codex |
|------------|--------|
| `readFiles` / `editFiles` / `runCommand` / `git` | built-in tools |
| `spawn` | `spawn_agent` + TOML agents under `.codex/agents/` when custom agents exist; else serialize |
| `waitAgent` | `wait_agent` |
| `resumeAgent` | `resume_agent` / `send_input` |
| `invokeSkill` | `$kmode` or `/skills`; see `openai.yaml` for implicit policy |
| `askUser` | text question |
| `planFile` | `plans/<slug>.md` plus text approval |
| `openPullRequest` | `gh pr create --draft` |
| `watchChecks` | `gh pr checks` |
| `browserDrive` | only if a browser tool is enabled; else repo harness |
| `readTranscript` | not assumed; `handoff` notes |
| `scheduleWake` | not assumed |
| `listModels` | `.codex/config.toml` — do not invent Cursor slugs |
| `repoSkillsDir` | `.agents/skills` then `.codex/skills` |

## Sticky mode

No Cursor reminder field. Persistence = kmode Persistence section + user `$kmode` on a new thread.

## Agents

Do not copy Cursor Markdown agent files into Codex. If a custom agent is needed, write TOML with `name`, `description`, `developer_instructions` that **tell the agent to read** `kmode/SKILL.md` rather than duplicating it.

Copy [openai.yaml](openai.yaml) into a Codex project for explicit-invocation metadata. Its `implicit: false` setting preserves the front-door opt-in. The skill itself stays valid without it.

## Missing

No `spawn_agent` → orchestrate serializes. No browser → UI verify `blocked` without a harness. Unknown YAML keys in SKILL frontmatter are forbidden in core (only `name`, `description`, `disable-model-invocation`).
