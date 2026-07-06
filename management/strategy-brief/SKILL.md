---
name: strategy-brief
description: Strategy brief creates a concise tech strategy and roadmap memo from Home OS priorities, Linear context, pasted product/org context, constraints, risks, and deadlines. Use for strategy planning, roadmap planning, or decision memos.
---

# Strategy brief

## Fast path

Confirm **audience + decision + constraints** (not Linear-only). Read `context.md` + pasted context → Linear for status signals → bounded memo with one recommendation and 3–5 bets.

**You get:** A bounded strategy + roadmap memo (problem, facts, options, one recommendation, three to five bets, risks).

**You need:** Strategy question or audience; `context.md` priorities; pasted org/product constraints; linked Linear for status signals — not Linear alone.

**Done when:** One clear recommendation (or explicit open decisions if facts are insufficient); three to five named roadmap bets tied to constraints; `Sources checked` explicit; each major section is capped at 3 short paragraphs or 5 bullets.

**Templates:** [`strategy-roadmap.template.md`](strategy-roadmap.template.md)

## Inputs

Strategy question, audience, or decision needed.

Private Home OS files (`context.md`, `sources.md`, …) at the root resolved per **`home-os`** (**Path resolution order**) — team mission, priorities, constraints.

Relevant Linear projects, initiatives, issues, or status links.

Pasted product/org context.

Known team constraints, deadlines, risks, and dependencies.

## MCP Use

**Shared conduct:** Private Home OS root and MCP preference — see **`home-os`** (**Path resolution order** and **MCP and source retrieval boundaries**). Do not infer roadmap or alignment from tools alone; see **Skill-specific deltas** there for `strategy-brief`.

Read Home OS priorities and team mission first.

Fetch explicit Linear projects, initiatives, issues, and status signals when linked.

Use pasted context for product/org details that are not available through MCP.

Do not create a roadmap from Linear data alone. Ask for the decision, audience, or constraints if missing.

## Output

Use short paragraphs under these headings:

`Problem`

`Current facts`

`Options`

`Tradeoffs`

`Recommendation`

`Roadmap bets`

`Risks`

`Open decisions`

`Sources checked`

Keep to one recommendation and three to five roadmap bets.

In prose, use lightweight tags like `[Linear]` where a fact came from Linear. List concrete URLs or doc links under `Sources checked`.

## Saving

If saving is requested, write to `outputs/YYYY-MM-DD-strategy-brief.md` or `outputs/YYYY-MM-DD-strategy-brief-<slug>.md`.

Include generated timestamp, time window if applicable, and sources checked.

## Kill criteria

If the problem is unclear, ask for the decision or audience before drafting.

If constraints are missing, name the missing constraints before recommending roadmap bets.

If the artifact exceeds two pages equivalent, compress to one recommendation and three to five bets.

If facts do not support a recommendation, produce options and open decisions instead.
