# 👥 Management skills

You context-switch all day (calendar blocks, Slack threads, “quick” escalations), and review season still shows up like a train. These skills do not replace judgment; they **reduce load** by turning scattered signal into short, sourced briefs once your private Home OS exists. **`1on1`** and **`review-prep`** default to **Radical Candor** (care personally + challenge directly) **with evidence** — see each `SKILL.md` and companion **`reference.md`** where present (e.g. [1on1/reference.md](1on1/reference.md)). **`brag-doc`**, **`strategy-brief`**, and **`hiring-feedback`** follow their own output rules; read each `SKILL.md`.

**Stable privacy and MCP rules** live in [`home-os/SKILL.md`](home-os/SKILL.md) (Path resolution, MCP and source retrieval boundaries) and each skill's own `SKILL.md`. This git repo holds **skills and blank templates only**. Filled profiles, source URLs, briefs, and HR text stay in private storage and never belong in git.

## 🧰 Skills

- **[`home-os`](home-os/SKILL.md)**: **Moment:** a new direct joins or your team map changes. **Outcome:** one place for profile + pointers (meeting notes, Linear, GitHub, Slack) so downstream skills stop re-asking basics. No MCP inside the skill itself; linked sources let other skills pull context when MCP is configured.

- **[`1on1`](1on1/SKILL.md)**: **Moment:** the 1:1 is in twenty minutes and your brain is still in the last incident. **Outcome:** a tight brief (wins, blockers, follow-ups) grounded in `sources.md` / the direct profile when meeting notes, Linear, GitHub, or Slack are linked.

- **[`review-prep`](review-prep/SKILL.md)**: **Moment:** you need to write growth feedback and not rely on “how I felt last week.” **Outcome:** evidence-style bullets with less recency bias when you add last review / growth docs plus the same sources as 1:1.

- **[`hiring-feedback`](hiring-feedback/SKILL.md)**: **Moment:** the debrief ended and HR needs text tonight. **Outcome:** paste-ready HR-shaped feedback from panel notes aligned to the rubric for that role (private root + rubric per role; pasted notes unless **Source Rules** say otherwise).

- **[`strategy-brief`](strategy-brief/SKILL.md)**: **Moment:** leadership asks for “two pages on roadmap and bets.” **Outcome:** a bounded memo anchored in `context.md` priorities, Linear when linked, and pasted product/org context.

- **[`brag-doc`](brag-doc/SKILL.md)**: **Moment:** you want weekly wins, self-review prep, or a promo narrative—for **you**, not a direct. **Outcome:** a dated `outputs/YYYY-MM-DD-brag-doc.md` from `sources.md`, optional `expectations.md`, and MCP when linked.

- **[`feedback-note`](feedback-note/SKILL.md)**: **Moment:** you need to give someone feedback and want it written clearly before the conversation. **Outcome:** a deliverable SBI note (praise, constructive, or upward) with Radical Candor stance — never invented incidents.

- **[`team-pulse`](team-pulse/SKILL.md)**: **Moment:** leadership asks "how is the team doing" or you need a weekly rollup. **Outcome:** team-level delivery flow metrics and cadence signals for a stated timeframe — no per-person ranking.

- **[`growth-plan`](growth-plan/SKILL.md)**: **Moment:** you want a forward-looking development plan for a direct. **Outcome:** strengths, gaps vs target level from `expectations/ladder.md`, and 2–4 concrete goals with progress signals.

## 💬 Typical prompts

- **Setup:** “Set up my management Home OS” / “Add a direct profile for …” / “Update source links for my team” / “Set up career ladder”.
- **1:1:** “Prep my 1:1 with `<slug>`”. Add “include sensitive context” only if you want sensitive notes read.
- **Feedback:** “Help me give feedback to `<slug>`” / “Write an SBI note for …” / paste the situation.
- **Team:** “How is the team doing for `2026-06-02..2026-06-08`” / “Summarize the team's week”. Put an explicit **timeframe** in the prompt.
- **Hiring:** “Turn these interview notes into HR feedback” (position clarified first) / “Set up hiring rubric for [role]” + paste JD.
- **Review:** “Prep performance review for `<slug>`”.
- **Growth:** “Write a growth plan for `<slug>`” / “What should `<slug>` work on next”.
- **Brag (self):** “Run my weekly brag doc for `2026-06-02..2026-06-08` (UTC)” / “Update my brag document”. Put an explicit **date range** in the prompt

## 🗂️ Private Home OS layout

Root: `~/.agents/management/home-os`

```text
context.md              # team, priorities, review cycle
sources.md              # pointers + ### Me for brag-doc; meeting notes, Linear, GitHub, Slack scope, HR (no secrets in git)
expectations.md         # optional; private job criteria or ## Status: declined for brag-doc
expectations/ladder.md  # optional; team career ladder by track + level (review-prep, growth-plan)
directs/<slug>.md       # direct profile; sensitive block: see 1on1 / review-prep SKILL
hiring/rubrics/<role>.md
outputs/YYYY-MM-DD-workflow-slug.md   # briefs and brag-doc; never commit filled files
```

## 🔒 Output and privacy

Briefs: short paragraphs, facts over spin; tag sources per each `SKILL.md`. Never commit filled profiles, sensitive notes, outputs, HR feedback, or live source URLs. Sensitive notes: `1on1` skips unless asked; `review-prep` asks before reading. Full rules: [`home-os/SKILL.md`](home-os/SKILL.md) and each skill's `SKILL.md`.
