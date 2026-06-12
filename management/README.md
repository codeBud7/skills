# 👥 Management skills

You context-switch all day (calendar blocks, Slack threads, “quick” escalations), and review season still shows up like a train. These skills do not replace judgment; they **reduce load** by turning scattered signal into short, sourced briefs once your private Home OS exists. **`1on1`** and **`review-prep`** default to **Radical Candor** (care personally + challenge directly) **with evidence**. Read those `SKILL.md` files for tone and gates. **`brag-doc`**, **`strategy-brief`**, and **`hiring-feedback`** follow their own output rules (self-only summary with numbered cites; evidence-first roadmap; neutral HR text); read each `SKILL.md`. This git repo holds **skills and blank templates only**. Filled profiles, source URLs, briefs, and HR text stay in private storage and never belong in git.

**For behavior and gates, read each skill’s `SKILL.md`.**

## 📌 What you can do here

- Create or update the private Home OS tree and direct profiles.
- See which skill to invoke and what to have filled in first.
- Find template paths and the default private root layout.

## 🚀 Do this next

1. Run **`home-os`** once. Default private root is `~/.agents/management/home-os` (or it asks for a path).
2. Fill **`context.md`**, add at least one **`directs/<slug>.md`**, optional **`sources.md`** / per-direct links.
3. Use **`1on1`**, **`review-prep`**, **`hiring-feedback`**, **`strategy-brief`**, or **`brag-doc`** as needed.

Install symlinks: [../scripts/setup-skills.sh](../scripts/setup-skills.sh) into `~/.cursor/skills`, `~/.claude/skills`, or `~/.agents/skills`. Private data lives under `~/.agents/` by default.

## 🧰 Skills (moment → outcome)

- **[`home-os`](home-os/SKILL.md)**: **Moment:** a new direct joins or your team map changes. **Outcome:** one place for profile + pointers (meeting notes, Linear, GitHub, Slack) so downstream skills stop re-asking basics. No MCP inside the skill itself; linked sources let other skills pull context when MCP is configured.

- **[`1on1`](1on1/SKILL.md)**: **Moment:** the 1:1 is in twenty minutes and your brain is still in the last incident. **Outcome:** a tight brief (wins, blockers, follow-ups) grounded in `sources.md` / the direct profile when meeting notes, Linear, GitHub, or Slack are linked.

- **[`review-prep`](review-prep/SKILL.md)**: **Moment:** you need to write growth feedback and not rely on “how I felt last week.” **Outcome:** evidence-style bullets with less recency bias when you add last review / growth docs plus the same sources as 1:1.

- **[`hiring-feedback`](hiring-feedback/SKILL.md)**: **Moment:** the debrief ended and HR needs text tonight. **Outcome:** paste-ready HR-shaped feedback from panel notes aligned to the rubric for that role (private root + rubric per role; pasted notes unless **Source Rules** say otherwise).

- **[`strategy-brief`](strategy-brief/SKILL.md)**: **Moment:** leadership asks for “two pages on roadmap and bets.” **Outcome:** a bounded memo anchored in `context.md` priorities, Linear when linked, and pasted product/org context.

- **[`brag-doc`](brag-doc/SKILL.md)**: **Moment:** you want weekly wins, self-review prep, or a promo narrative—for **you**, not a direct. **Outcome:** a dated `outputs/YYYY-MM-DD-brag-doc.md` from `sources.md` **`### Me`** scopes, optional `expectations.md`, and MCP when linked.

## 💬 Typical prompts

- **Setup:** “Set up my management Home OS” / “Add a direct profile for …” / “Update source links for my team”.
- **1:1:** “Prep my 1:1 with `<slug>`”. Add “include sensitive context” only if you want sensitive notes read.
- **Hiring:** “Turn these interview notes into HR feedback” (position clarified first) / “Set up hiring rubric for [role]” + paste JD.
- **Review:** “Prep performance review for `<slug>`”.
- **Brag (self):** “Run my weekly brag doc for `2026-06-02..2026-06-08` (UTC)” / “Update my brag document”. Put an explicit **date range** in the prompt; fill **`### Me`** per [sources.template.md](home-os/sources.template.md). Gates and UTC default: [`brag-doc/SKILL.md`](brag-doc/SKILL.md).

## ✅ Setup checklist (before 1:1 / review-prep feel good)

- Private root path in `sources.md` if not default.
- `context.md`: team, priorities, review cycle.
- At least one `directs/<slug>.md`: role, goals, projects.
- Optional: meeting / Linear / GitHub / Slack links in `sources.md` and on the direct. That improves `1on1` / `review-prep` grounding. Slack needs MCP configured in the host; never put tokens in git.
- **Brag-doc (self):** **`### Me`** in `sources.md` per [sources.template.md](home-os/sources.template.md); private `expectations.md` with real criteria **or** `## Status: declined` so automation does not stall; prompts need an explicit **date range** (UTC unless overridden).
- Hiring: one filled rubric under `hiring/rubrics/` per open role (often created via `hiring-feedback`).

If something required for the artifact is missing, the skill pauses and asks.

## 🗂️ Private Home OS layout (default)

Root: `~/.agents/management/home-os`

```text
context.md              # team, priorities, review cycle
sources.md              # pointers + ### Me for brag-doc; meeting notes, Linear, GitHub, Slack scope, HR (no secrets in git)
expectations.md         # optional; private job criteria or ## Status: declined for brag-doc
directs/<slug>.md       # direct profile; sensitive block: see 1on1 / review-prep SKILL
hiring/rubrics/<role>.md
outputs/YYYY-MM-DD-workflow-slug.md   # briefs and brag-doc; never commit filled files
```

## 📄 Templates (in this repo)

`home-os` copies templates into private storage; `hiring-feedback` writes rubrics into `hiring/rubrics/`.

- [home-os/context.template.md](home-os/context.template.md), [home-os/direct.template.md](home-os/direct.template.md), [home-os/sources.template.md](home-os/sources.template.md)
- [1on1/brief.template.md](1on1/brief.template.md)
- [hiring-feedback/hr-feedback.template.md](hiring-feedback/hr-feedback.template.md), [rubric.template.md](hiring-feedback/rubric.template.md)
- [review-prep/evidence-brief.template.md](review-prep/evidence-brief.template.md)
- [strategy-brief/strategy-roadmap.template.md](strategy-brief/strategy-roadmap.template.md)
- [brag-doc/expectations.template.md](brag-doc/expectations.template.md) (copy to private root as `expectations.md` when using criteria; `brag-doc` may create declined sentinel)

## 🔒 Output and privacy (short)

Briefs: short paragraphs, facts over spin; tag sources in prose per each `SKILL.md` (e.g. `[meeting]`, `[Linear]`, `[GitHub]`, `[Slack]` where that skill pulls Slack). **`brag-doc`** uses **`Week in brief`**, numeric cites, and **`## References`** only; it does not read `context.md` (see [`brag-doc/SKILL.md`](brag-doc/SKILL.md)). Never commit filled profiles, sensitive notes, outputs, HR feedback, or live source URLs. Sensitive notes: `1on1` skips unless asked; `review-prep` asks before reading.

## 🔗 Dependency order

```text
home-os → 1on1 / review-prep / strategy-brief / brag-doc
home-os (private root) → hiring-feedback
```
