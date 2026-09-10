# Shared contracts

Use these words in management-mode and every leaf invocation under it. Do not invent synonyms.

## Gate status

| Status | Meaning |
|--------|---------|
| `answered` | Advice route completed; displayed in chat |
| `drafted` | Artifact valid for display but not persisted |
| `saved` | Completed artifact written to private Home OS |
| `needs-input` | Blocking question; route can continue after answer |
| `blocked` | Stop. Name the gap. Do not advance. |
| `not-applicable` | Stage or rule does not apply; one-sentence why |

Skip-all is never `saved`. Self-report without artifact is never `saved`. Compile/lint is never management proof.

## Intake contract

Before retrieval, know or explicitly mark not-applicable:

| Field | Required when |
|-------|----------------|
| **subject** | Any direct-specific or self-specific work |
| **intent** | Always — drives route |
| **timeframe** | `team-pulse`, `brag-doc`, `review-prep`, `1on1` window, `strategy-brief` when dated |
| **source scope** | Any MCP or linked-source fetch |
| **sensitivity** | Before reading sensitive profile sections |

Missing required field → `needs-input`, not silent defaults (except leaf-documented defaults like 1on1 14-day window after profile read).

## Route contract

- Invoke **one leaf** or an **explicit ordered sequence** for multi-intent requests.
- Adjacent ambiguity → one focused question, then route.
- Explicit leaf request wins over precedence table.
- `advice` route: no source fetch by default; ask for relevant pasted context.
- `refuse-eng`: point at `kmode`; do not load engineering skills.

## Evidence contract

- Factual claims identify **source** and **window**.
- Thin evidence → questions and `Missing context` only. No verdicts.
- Conflicting sources → show both with dates; user resolves. No silent newest-wins.
- High-stakes decisions (promotion, PIP, termination, compensation, hiring hire/no-hire) → evidence packet and questions only. User owns the decision.
- Metrics are conversation signals with N and method — never peer ranking or morale diagnosis.

## Judgment contract

Management-mode and leaves **do not**:

- Invent incidents, quotes, dialogue, or sentiment
- Render final performance ratings unless user explicitly requests after evidence brief
- Rank directs against each other
- Infer morale from thin numbers
- Build roadmap from Linear alone (`strategy-brief` rule)
- Do public candidate lookup (`hiring-feedback` rule)

## Privacy contract

- People data stays in **private Home OS** — never git.
- Sensitive context: **per-task explicit consent** before read.
- Configured Slack/Notion/Linear/GitHub scope only — no silent expansion.
- Display sensitive-derived output by default; **save requires consent** when output used sensitive notes.
- Ambiguous person or meeting → ask; never fetch.

## Persistence contract

| Artifact type | Save behavior |
|---------------|---------------|
| Completed non-sensitive leaf artifact | Auto-save to private `outputs/` when leaf Done when met |
| Sensitive-derived artifact | Ask before save |
| Incomplete / `needs-input` | Do not auto-save |
| Advice answer | Ask before private save |
| Same-day rerun | Idempotent update; preserve unrelated sections |

**Home OS** is sole durable state. No second resume ledger. No workspace git copies of filled profiles, briefs, or HR text.

**Write serialization:** one writer per `directs/<slug>.md` and per output file. Multi-direct: confirm scope once, then serialize.

## External action contract

Every write outside private Home OS requires **explicit user approval each time**:

- Notion pages
- Slack messages
- HR systems
- Email or calendar actions

Private auto-save does not imply external publish.

## Completion contract

Every route ends with:

1. Named terminal state (see gate status table)
2. `Missing context` when evidence was thin or sources skipped
3. `Sources checked` when the leaf requires it

## Handoff contract

When relevant, offer **one** canonical next lifecycle step. Never auto-start the next route.

Examples:

| After | Offer |
|-------|-------|
| `1on1` prep | `1on1-log` after the meeting |
| `review-prep` | `growth-plan` |
| `feedback-note` | conversation follow-up or `1on1-log` if meeting same day |
| `home-os` setup | first `1on1` prep for a direct |

## Resume contract

1. Ask **subject** (which direct, team, or self).
2. Read latest relevant private `outputs/` artifact for that subject.
3. Re-confirm **window** if stale or ambiguous.
4. Do not maintain a separate management-mode resume file.

## Leaf override

Leaf `SKILL.md` kill criteria and stricter save rules **always win** over mode defaults when they conflict. Mode contracts add a floor, not a ceiling.
