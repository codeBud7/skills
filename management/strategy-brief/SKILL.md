---
name: strategy-brief
description: Create a concise combined tech strategy and roadmap brief from Home OS priorities, Linear context, pasted product/org context, constraints, risks, and deadlines. Use for strategy planning, roadmap planning, decision memos, or turning rough planning notes into a bounded management brief.
---

# Strategy Brief

Create a combined tech strategy and roadmap brief. Keep it bounded: max two pages equivalent, one recommendation, three to five roadmap bets.

## Inputs

Strategy question, audience, or decision needed.

Private Home OS context for team mission, priorities, and constraints.

Relevant Linear projects, initiatives, issues, or status links.

Pasted product/org context.

Known team constraints, deadlines, risks, and dependencies.

## MCP Use

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

## Rules

Do not pretend uncertainty is alignment.

Do not turn weak ideas into a roadmap without naming bets and constraints.

Do not hide missing constraints.

If the roadmap is not tied to facts, risks, or constraints, rewrite it as open decisions.

## Saving

If saving is requested, write to `outputs/YYYY-MM-DD-strategy-brief.md` or `outputs/YYYY-MM-DD-strategy-brief-<slug>.md`.

Include generated timestamp, time window if applicable, and sources checked.

## Kill Criteria

If the problem is unclear, ask for the decision or audience before drafting.

If constraints are missing, name the missing constraints before recommending roadmap bets.

If the artifact exceeds two pages equivalent, compress to one recommendation and three to five bets.

If facts do not support a recommendation, produce options and open decisions instead.
