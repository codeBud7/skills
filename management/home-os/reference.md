# Home OS — workflow, profiles, style

Canonical path and MCP boundaries stay in [`SKILL.md`](SKILL.md). This file holds operational detail.

## Agent Hosts and Private Storage (expanded)

Skills are host-agnostic instructions in git. Install location depends on the agent host (`~/.cursor/skills`, `~/.claude/skills`, or `~/.agents/skills`). Never store filled profiles, briefs, or source links in skill install dirs.

Private Home OS data lives at one shared root outside git, default `~/.agents/management/home-os`. Use the same root from Cursor, Claude, or any other host.

## Workflow

Start with compact full-context intake. Then refine one section or one direct at a time. The setup must be resumable.

Use short questions. Prefer asking for rough notes first, then clean them into the templates.

Create or update:

`context.md`: manager, team, org, priorities, norms, review cycle, management style.

`sources.md`: shared MCP/source pointers for meeting notes, Linear, GitHub, Slack (channels, threads, MCP server label — no tokens in git), hiring rubric paths, strategy context, and **`### Me` subsections** for `brag-doc` (see `sources.template.md`). Optional private `expectations.md` at the same root is owned by `brag-doc` for job criteria or a declined sentinel. Rubric setup for open positions is owned by `hiring-feedback`, not `home-os`.

`expectations/ladder.md`: optional team leveling rubric by track and level (seed from `ladder.template.md`). Each direct's **Current level** and **Target level** in their profile reference criteria here. `review-prep` and `growth-plan` read it; `home-os` seeds the blank template on request.

`directs/<slug>.md`: one profile per direct. Optional sensitive manager detail belongs in a clearly marked section of the same file, only after explicit consent.

## Time-ordered lists

Whenever a section holds multiple **time-stamped** or **time-sequenced** items (feedback log, dated 1:1 notes, project status history, career milestones the user gives as a timeline), order them **chronologically: earliest first** at the top, **latest last** at the bottom. New material from intake **appends** at the bottom. When merging new notes into an existing file, **re-sort** that section so the rule still holds.

Sections that are not a timeline (single snapshot, priority order, identity fields) stay as-is.

## Required Direct Identity

Each direct needs a stable slug and explicit handles when available.

Capture display name, slug, title, level, tenure, work email, GitHub username, Linear profile, meeting notes links, Linear links, GitHub repos/searches, optional Slack scope (member id, channels, thread URLs per template), current projects, goals, working style, feedback preference, strengths, and growth areas.

Source links are optional during setup. If a later artifact requires a missing source, that skill should pause and ask for it.

## Sensitive detail in profiles

Do not collect sensitive manager notes unless the user explicitly asks or agrees. If a generated artifact uses that material, display it only by default. Save only on explicit request.

## Output Style

Use short paragraphs by default.

Avoid tables.

Avoid nested bullets.

Prefer facts over interpretation. If evidence is thin, leave a blank, mark TODO, or write a question.

### Feedback norms

In `context.md` under **My Management Style** → **Feedback style**, capture whether **Radical Candor** (care personally + challenge directly) is the default for briefs downstream skills generate, plus any boundaries (e.g. praise in public vs challenge in private). Downstream skills treat RC as default when unset; explicit user preferences in `context.md` win.
