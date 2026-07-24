# 1:1 — Radical Candor and output headings

Use with [`SKILL.md`](SKILL.md) for retrieval order and gates.

## Radical Candor (default stance)

- **Care personally**: Tie warmth to specifics — praise and curiosity grounded in observable facts, not generic cheer.
- **Challenge directly**: When evidence shows a pattern or gap, say it plainly; do not sandbag or bury the lead. Bind claims to sources at the **end of the section**, not inline in the sentence.
- **Evidence binding**: Radical Candor is not bluntness without facts. Weak evidence → direct questions and labeled gaps, not performance claims or diagnoses.
- **Avoid**: Ruinous empathy (kind but vague), obnoxious aggression (harsh without care), manipulative insincerity (spin or politics).

## Output headings

Use short paragraphs under these headings:

`Recent facts`

`Delivery pulse (metrics)`

`Follow-ups`

`Wins to celebrate`

`Questions to ask`

`Career check-in`

`Feedback to consider`

`Missing context`

`Sources checked`

### Source placement

Keep narrative **readable**: facts first, sources last.

**`Recent facts`** (required pattern)

1. Short paragraphs with **no** inline `[meeting]`, `[GitHub]`, `[Linear]`, `[Slack]`, or `[prior brief]` tags.
2. End the section with a single `Sources:` line listing every tag that backed a fact above (dedupe; order: `[meeting]`, `[Linear]`, `[GitHub]`, `[Slack]`, `[prior brief]`).

```markdown
## Recent facts

They shipped the CRM fix and unblocked the payments rollout. Linear still shows two open bugs on the same epic.

Sources: [meeting], [GitHub], [Linear]
```

**`Follow-ups`** — when stating facts (not bare action items), use the same pattern: prose then `Sources:` at section end. Bare carry-forward bullets without external claims need no `Sources:` line.

**`Delivery pulse (metrics)`** — numeric body stays tag-free; put `Sample:`, `Method:`, and optional `Sources: [GitHub], [Linear]` after the numbers (and after **Trend vs prior 1:1** when present).

**Prompt sections** (`Wins to celebrate`, `Questions to ask`, `Career check-in`, `Feedback to consider`) — no `Sources:` line unless a specific cited fact appears; ground thin evidence in goals/profile instead.

**`Sources checked`** — always the **final** heading in the brief. Bullets with concrete links or paths (Notion DB, repo, prior `outputs/…` file, MCP fallbacks). Mirrors section-level tags but adds URLs where available.

Under **`Delivery pulse (metrics)`**, use **numeric facts only** (counts, durations, sample N, method). These are conversation signals, not ratings. If N is tiny or data missing, say so in that section — do **not** stretch into `Feedback to consider`; add a grounded **question** under `Questions to ask` instead.

When a prior brief exists, add a **`Trend vs prior 1:1`** subsection under `Delivery pulse (metrics)` per the rules below.

### Metrics snapshot definitions

Per-direct, in-window metrics are **signals for conversation**. Prefer GitHub MCP when the host exposes it; otherwise use read-only `gh search prs` / `gh search issues` per `home-os` fallback.

**Prerequisites:** GitHub username from `directs/<slug>.md` (**Identity**); searchable scope from **Source Links** (repos, org, or search hints) plus `sources.md` **GitHub** section when the profile is thin. Without username + scope, skip and note the gap under `Missing context` or in `Delivery pulse (metrics)`.

**PR time:** For merged PRs authored by the direct in the brief window, duration = `createdAt` to `mergedAt`. Other definitions only when the user explicitly asks.

**Issues:** Closed GitHub issues assigned to the direct in window; duration = `createdAt` to `closedAt`. If assignee-based search returns nothing relevant, note the limitation before using another filter.

**Linear:** If Linear is linked and MCP exposes cycle or lead-time fields for in-window issues, add a short line under `Delivery pulse (metrics)` (source on the section `Sources:` line). If unavailable, omit.

**Execution:** Cap raw rows (e.g. 50-100). In the brief, state sample N and method. Compute counts plus median or typical range in human-readable units. If auth is missing, results are empty, or N is too small, write one thin-sample or skipped line.

### Trend vs prior 1:1

Compare the **current snapshot** (this brief's window) to the **prior snapshot** parsed from the latest `outputs/YYYY-MM-DD-1on1-<slug>.md` that had a `Delivery pulse (metrics)` section.

**Comparable metrics** (same definition in both periods):

| Metric | Prior field | Current field |
|--------|-------------|---------------|
| Merged PRs | count in prior block | count in current block |
| PR open→merge | median or typical duration | median or typical duration |
| Closed issues (assigned) | count | count |
| Issue open→close | median or typical lead time | median or typical lead time |
| Linear cycle/lead | tagged line if present | tagged line if present |

**Prior snapshot missing** — no prior brief, prior brief skipped metrics, or prior block unparseable: one line `Trend vs prior 1:1: no prior snapshot`.

**Output shape** — under `Delivery pulse (metrics)`, after current numbers:

```markdown
### Trend vs prior 1:1

Prior: YYYY-MM-DD (N=…, method: …)
- Merged PRs: {prior} → {current} ({delta})
- PR median open→merge: {prior} → {current} ({delta})
- Closed issues: {prior} → {current} ({delta})
- Issue median lead time: {prior} → {current} ({delta})
Trend confidence: {solid | thin sample | windows differ}
```

Omit rows where either side lacks that metric. `delta` is absolute change with sign (`+2`, `−1.2d`, `flat`). Counts: `flat` when unchanged. Durations: `flat` when change under 10% or under 0.5 day.

**Confidence labels**

- `solid` — both sides N ≥ 3 for that row and comparable windows
- `thin sample` — either side N under 3 or current/prior marked thin
- `windows differ` — prior and current window lengths differ by more than ~3 days; still show deltas but do not treat as like-for-like

**Conversation use** — trends are signals, not grades. State the delta plainly; if a thin or divergent window might mislead, add one grounded question under `Questions to ask`. Do not auto-label faster/slower as good or bad.

Always include career expectations.

Always include a specific feedback check-in question. If evidence is thin, ground the question in goals or projects instead of making a critique.

Always include a specific appreciation question. If recent evidence is thin, ground it in profile strengths or goals instead of making an unverified claim.

In `Feedback to consider`, pair **specific appreciation** (when recent evidence supports it) with **specific challenge or growth nudge** when observable evidence supports it; if evidence is thin, use grounded questions only — never invent a critique to sound “candid.”
