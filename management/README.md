# Management skills

## What this is

Index for private “Home OS” setup (`home-os`) and EM workflows: 1:1 prep, review prep, hiring feedback, strategy briefs. This git repo holds **skills and blank templates only**. Filled profiles, source URLs, briefs, and HR text stay in private storage — never committed here.

**For behavior and gates, read each skill’s `SKILL.md`.**

## What you can do here

- Create or update the private Home OS tree and direct profiles.
- See which skill to invoke and what to have filled in first.
- Find template paths and the default private root layout.

## Do this next

1. Run **`home-os`** once — default private root `~/.agents/management/home-os` (or it asks for a path).
2. Fill **`context.md`**, add at least one **`directs/<slug>.md`**, optional **`sources.md`** / per-direct links.
3. Use **`1on1`**, **`review-prep`**, **`hiring-feedback`**, or **`strategy-brief`** as needed.

Install symlinks: [../scripts/setup-skills.sh](../scripts/setup-skills.sh) into `~/.cursor/skills`, `~/.claude/skills`, or `~/.agents/skills`. Private data lives under `~/.agents/` by default.

## Skills (what each is for)

- **[`home-os`](home-os/SKILL.md)** — First setup; add/update direct; source map. No MCP.
- **[`1on1`](1on1/SKILL.md)** — Before a 1:1. Needs Home OS; meeting notes / Linear / GitHub when linked.
- **[`review-prep`](review-prep/SKILL.md)** — Review season evidence. Needs Home OS; same sources as 1:1 plus last review / growth docs when you provide them.
- **[`hiring-feedback`](hiring-feedback/SKILL.md)** — After interviews or rubric work. Needs private root + rubric per role.
- **[`strategy-brief`](strategy-brief/SKILL.md)** — Roadmap or decision memo. Priorities in `context.md` help; Linear + pasted context when used.

Ambiguous person or source → agent should ask. Retrieval order and windows for 1:1 / review-prep: see those **`SKILL.md`** files.

## Typical prompts

- **Setup:** “Set up my management Home OS” / “Add a direct profile for …” / “Update source links for my team”.
- **1:1:** “Prep my 1:1 with `<slug>`” — add “include sensitive context” only if you want sensitive notes read.
- **Hiring:** “Turn these interview notes into HR feedback” (position clarified first) / “Set up hiring rubric for [role]” + paste JD.
- **Review:** “Prep performance review for `<slug>`”.
- **Strategy:** “Strategy brief: …” / “Roadmap brief for …”.

## Setup checklist (before 1:1 / review-prep feel good)

- Private root path in `sources.md` if not default.
- `context.md`: team, priorities, review cycle.
- At least one `directs/<slug>.md`: role, goals, projects.
- Optional: meeting / Linear / GitHub links on the direct — improves grounding.
- Hiring: one filled rubric under `hiring/rubrics/` per open role (often created via `hiring-feedback`).

If something required for the artifact is missing, the skill pauses and asks.

## Private Home OS layout (default)

Root: `~/.agents/management/home-os`

```text
context.md              # team, priorities, review cycle
sources.md              # pointers to Notion, Linear, GitHub, HR (no secrets in git)
directs/<slug>.md       # direct profile; sensitive block: see 1on1 / review-prep SKILL
hiring/rubrics/<role>.md
outputs/YYYY-MM-DD-workflow-slug.md   # briefs; display-only if sensitive notes used unless you ask to save
```

## Templates (in this repo)

`home-os` copies templates into private storage; `hiring-feedback` writes rubrics into `hiring/rubrics/`.

- [home-os/context.template.md](home-os/context.template.md), [home-os/direct.template.md](home-os/direct.template.md), [home-os/sources.template.md](home-os/sources.template.md)
- [1on1/brief.template.md](1on1/brief.template.md)
- [hiring-feedback/hr-feedback.template.md](hiring-feedback/hr-feedback.template.md), [rubric.template.md](hiring-feedback/rubric.template.md)
- [review-prep/evidence-brief.template.md](review-prep/evidence-brief.template.md)
- [strategy-brief/strategy-roadmap.template.md](strategy-brief/strategy-roadmap.template.md)

## Output and privacy (short)

Briefs: short paragraphs, facts over spin, tag sources in prose; full rules in each **`SKILL.md`**. Never commit filled profiles, sensitive notes, outputs, HR feedback, or live source URLs. Sensitive notes: `1on1` skips unless asked; `review-prep` asks before reading.

## Dependency order

```text
home-os → 1on1 / review-prep / strategy-brief
home-os (private root) → hiring-feedback
```
