# Management Skills

Private Home OS + five skills for EM workflows. Git holds skills and blank templates only. Real people data, source links, generated briefs, and sensitive notes live in private storage outside git.

Skills install per agent host (`~/.cursor/skills`, `~/.claude/skills`, or `~/.agents/skills` via [`scripts/setup-skills.sh`](../scripts/setup-skills.sh)). Private Home OS data is shared under `~/.agents/`, default `~/.agents/management/home-os`.

## Quick Start

1. Run `home-os` once — creates private root at `~/.agents/management/home-os` (or asks for a custom path).
2. Add at least one direct profile with source links when you have them.
3. Use `1on1` before meetings, `hiring-feedback` after interviews, `review-prep` during review season, `strategy-brief` for planning.

If private storage path is unknown, `home-os` asks before writing.

## Private Home OS Layout

Default root: `~/.agents/management/home-os`

```text
~/.agents/management/home-os/
  context.md
  sources.md
  directs/<slug>.md
  directs/private/<slug>-sensitive.md
  hiring/rubrics/<role-slug>.md
  outputs/YYYY-MM-DD-workflow-slug.md
```


| File                                  | Purpose                                                        |
| ------------------------------------- | -------------------------------------------------------------- |
| `context.md`                          | Manager, team, org, priorities, norms, review cycle            |
| `sources.md`                          | Shared MCP/source pointers (Notion, Linear, GitHub, HR rubric) |
| `directs/<slug>.md`                   | Normal direct profile                                          |
| `directs/private/<slug>-sensitive.md` | Sensitive manager notes (never in git)                         |
| `hiring/rubrics/<role-slug>.md`       | Filled interview rubric per open position                      |
| `outputs/`                            | Saved briefs                                                   |


Sensitive output: if a brief used sensitive notes, display only by default. Save on explicit request.

## Skills


| Skill                                         | When to use                                       | Needs Home OS                        | MCP                                    |
| --------------------------------------------- | ------------------------------------------------- | ------------------------------------ | -------------------------------------- |
| `[home-os](home-os/SKILL.md)`                 | First setup, add/update direct, configure sources | —                                    | No                                     |
| `[1on1](1on1/SKILL.md)`                       | Before a 1:1                                      | Yes                                  | Meeting notes, Linear, GitHub          |
| `[hiring-feedback](hiring-feedback/SKILL.md)` | After candidate call or rubric setup              | Private root; rubric per position    | No                                     |
| `[review-prep](review-prep/SKILL.md)`         | Review prep starts                                | Yes                                  | Same as 1:1 + last review, growth docs |
| `[strategy-brief](strategy-brief/SKILL.md)`   | Strategy or roadmap planning                      | Priorities helpful                   | Linear + pasted context                |


Skills auto-invoke from natural language. Ask for clarification if person, workflow, or source is ambiguous.

## Typical Prompts

**Setup**

- "Set up my management Home OS"
- "Add a direct profile for Jane Doe"
- "Update source links for my team"

**1:1**

- "Prep my 1:1 with jane-doe"
- "1:1 brief for Alex — include sensitive context" (reads sensitive notes only when asked)

**Hiring**

- "Turn these interview notes into HR feedback" (agent asks which position first)
- "HR feedback for senior-fullstack-payments" + paste notes
- "Set up hiring rubric for [role]" + paste job description

**Review**

- "Prep performance review for jane-doe"
- "Review evidence for Alex, last 6 months"

**Strategy**

- "Strategy brief: should we consolidate on one platform?"
- "Roadmap brief for Q3 platform work"

## Setup Checklist

Before `1on1` or `review-prep` work well:

- Private root recorded in `sources.md` (default `~/.agents/management/home-os`)
- `context.md` filled (team mission, priorities, review cycle)
- At least one `directs/<slug>.md` with role, goals, projects
- Source links on direct profile (meeting notes, Linear, GitHub) — optional but improves output
- For hiring: at least one filled rubric in `hiring/rubrics/` (created by `hiring-feedback` on first use)

Source links optional at setup. If a skill needs a missing source for the requested artifact, it pauses and asks.

## Templates

Blank templates live in skill folders. `home-os` copies context and direct templates into private storage. `hiring-feedback` shapes and writes filled rubrics into `hiring/rubrics/`.


| Template         | Path                                                                                         |
| ---------------- | -------------------------------------------------------------------------------------------- |
| EM context       | `[home-os/context.template.md](home-os/context.template.md)`                                 |
| Direct profile   | `[home-os/direct.template.md](home-os/direct.template.md)`                                   |
| Sensitive notes  | `[home-os/sensitive-direct.template.md](home-os/sensitive-direct.template.md)`               |
| Source map       | `[home-os/sources.template.md](home-os/sources.template.md)`                                 |
| 1:1 brief        | `[1on1/brief.template.md](1on1/brief.template.md)`                                           |
| HR feedback      | `[hiring-feedback/hr-feedback.template.md](hiring-feedback/hr-feedback.template.md)`         |
| Interview rubric | `[hiring-feedback/rubric.template.md](hiring-feedback/rubric.template.md)`                   |
| Review evidence  | `[review-prep/evidence-brief.template.md](review-prep/evidence-brief.template.md)`           |
| Strategy brief   | `[strategy-brief/strategy-roadmap.template.md](strategy-brief/strategy-roadmap.template.md)` |


## MCP and Sources

**Retrieval order** (1:1, review-prep): direct profile → meeting notes → Linear → GitHub.

**1:1 window:** since last 1:1, else last 14 days. Last meeting note + unresolved follow-ups.

**Review window:** review cycle from `context.md`, else last 6 months. Last review is separate context.

**Linear:** profile project/team links + assigned/owned issues when Linear user id exists.

**GitHub:** authored PRs, reviews, comments in linked repos and window. MCP preferred; `gh` read-only fallback if needed.

**Hiring:** position-first — resolve or persist rubric, then score pasted notes against it. No candidate lookup by default.

**Missing context:** pause if it blocks the artifact; otherwise continue and name gaps in output.

## Output Rules

Short paragraphs. No nested bullets. No tables by default.

Facts over interpretation. Thin evidence → question, not claim.

Source tags in prose: `[meeting]`, `[Linear]`, `[GitHub]`. Links in `Sources checked`.

Saved briefs include generated timestamp, time window, and sources checked.

## Privacy

Never commit to git: filled profiles, sensitive notes, generated briefs, HR feedback, source links with real URLs.

Sensitive notes: separate file per direct. `1on1` skips them unless asked. `review-prep` asks before reading.

## Dependency Order

```text
home-os → 1on1 / review-prep / strategy-brief
home-os (private root) → hiring-feedback (position setup + candidate scoring)
```

