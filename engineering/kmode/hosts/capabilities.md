# Capabilities

Playbooks name these. Host profiles map them. Core workflow never names product tools.

| Capability | Meaning |
|------------|---------|
| `readFiles` | Read repo and skill files. |
| `editFiles` | Mutate repo files. |
| `runCommand` | Shell in the workspace. |
| `git` | Status, diff, commit, branch. No force-push unless user asked. |
| `spawn` | Start a child agent with a prompt and isolation. |
| `waitAgent` | Block until a child finishes or a timeout. |
| `resumeAgent` | Continue a named child. |
| `invokeSkill` | Load another skill by `name`. |
| `askUser` | Structured or text question; required for approval gates. |
| `planFile` | Create or edit an on-disk plan the user can approve. |
| `openPullRequest` | Push and open a draft PR. |
| `watchChecks` | Read remote CI on a PR. |
| `browserDrive` | Drive a web UI the way a user would. |
| `readTranscript` | Prior session logs for this workspace. |
| `scheduleWake` | Wake later (loop/cron). Optional. |
| `listModels` | Enumerate model slugs for panels. Optional. |
| `repoSkillsDir` | Locate the host's preferred project-local skills directory. |

Missing required capability → follow the playbook **Fallback**. Default fallback: `blocked` with what was attempted. Never fake `pass`.
