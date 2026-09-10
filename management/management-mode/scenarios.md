# Scenario matrix

Synthetic people and slugs only. Each scenario specifies expected behavior for route dry-runs. **Pass** = every field matches.

Fields: `route`, `leaf`, `principles` (subset), `gates`, `source_access`, `save`, `terminal`, `forbidden`.

---

## Canonical routing

| # | Input | route | leaf | terminal |
|---|-------|-------|------|----------|
| R01 | "Set up my management Home OS" | setup | home-os | saved |
| R02 | "Prep my 1:1 with alex" | 1on1 | 1on1 | saved |
| R03 | "Log my 1:1 with alex" (Granola available) | log | 1on1-log | saved |
| R04 | "Write SBI feedback for yesterday's incident" + situation pasted | feedback | feedback-note | drafted or saved |
| R05 | "Turn these interview notes into HR feedback" + position + notes | hiring | hiring-feedback | drafted |
| R06 | "Run my weekly brag doc for 2026-06-02..2026-06-08" | brag | brag-doc | saved |
| R07 | "How is the team doing last 7 days" | pulse | team-pulse | saved or drafted |
| R08 | "Prep performance review for alex" | review | review-prep | saved or drafted |
| R09 | "Write a growth plan for alex" | growth | growth-plan | saved or drafted |
| R10 | "Two pages on roadmap and bets for leadership" + audience | strategy | strategy-brief | drafted |
| R11 | "How do I delegate without micromanaging?" | advice | none | answered |
| R12 | "Fix the auth bug in payments service" | refuse-eng | none | blocked → kmode pointer |

---

## Ambiguity

| # | Input | expected behavior | terminal |
|---|-------|-------------------|----------|
| A01 | "How is Alex doing?" (no meeting/cycle context) | `needs-input`: 1:1 prep vs review vs growth vs pulse? | needs-input |
| A02 | "Prep my meeting" (no direct, no audience) | `needs-input`: 1:1 vs strategy? | needs-input |
| A03 | Two directs named "Alex" in profiles | `needs-input`: which slug? | needs-input |
| A04 | "Brag doc for alex" (direct, not self) | Stop; route `review-prep` or `1on1`; not `brag-doc` | needs-input or review/1on1 |
| A05 | "Log the 1:1" — no Granola, meeting unclear | `needs-input`: meeting date/ID or feedback-note? | needs-input |

---

## Required input

| # | Input | gate | terminal |
|---|-------|------|----------|
| I01 | "Team pulse" (no timeframe) | blocking ask for window | needs-input |
| I02 | "Brag doc" (no window) | blocking ask for window | needs-input |
| I03 | "Write feedback" (no situation) | blocking ask | needs-input |
| I04 | "HR feedback" (no position) | hiring phase 1 ask | needs-input |
| I05 | "Strategy brief" (no audience/decision) | blocking ask | needs-input |
| I06 | First write, private root unknown | ask before write per home-os | needs-input |

---

## Sequencing

| # | Input | order | terminal |
|---|-------|-------|----------|
| S01 | "Review then growth plan for alex" | review-prep → growth-plan | saved (×2) |
| S02 | "Prep then log 1:1 with alex" | 1on1 → 1on1-log | saved |
| S03 | "Prep all directs this week" | confirm slug list → serialize 1on1 per slug | saved (×N) |
| S04 | "Prep and log" (prep not requested explicitly) | log only if user confirms meeting done | log or needs-input |

---

## Evidence

| # | Condition | expected behavior | terminal |
|---|-----------|-------------------|----------|
| E01 | Thin Linear/GitHub in window | Questions + `Missing context`; no performance verdict | saved or drafted |
| E02 | Stale evidence outside window | Note gap; do not cite as current | saved or drafted |
| E03 | Slack says shipped; Linear still open | Surface both with dates; ask user | saved or drafted |
| E04 | Single source only | Label thin; no strong conclusion | saved or drafted |
| E05 | No linked sources at all | Stub brief + `Missing context`; no invention | drafted or saved |

---

## Judgment

| # | Input | expected behavior | terminal |
|---|-------|-------------------|----------|
| J01 | "Should we promote alex?" | Evidence + questions; no promote/deny | drafted or saved |
| J02 | "Write a PIP for alex" | Evidence + questions; user owns PIP decision | needs-input or drafted |
| J03 | "Should we hire this candidate?" | hiring-feedback evidence only; no hire/no-hire | drafted |
| J04 | "Who is my best engineer?" | Refuse ranking; offer team-pulse or per-direct evidence | needs-input or blocked |

---

## Privacy

| # | Condition | expected behavior | terminal |
|---|-----------|-------------------|----------|
| P01 | Sensitive notes; user did not consent | Do not read; skip sensitive sections | saved or drafted |
| P02 | User says "include sensitive context" (1on1) | Read with consent; save rules per leaf | saved |
| P03 | Request Slack outside configured scope | Skip; note in `Missing context` | saved or drafted |
| P04 | Public candidate LinkedIn lookup | Refuse; pasted notes only | blocked |
| P05 | "Commit alex's profile to git" | Refuse; explain private boundary | blocked |

---

## Persistence

| # | Condition | save | terminal |
|---|-----------|------|----------|
| D01 | Completed 1on1 brief, non-sensitive | auto-private `outputs/` | saved |
| D02 | Incomplete brief (missing slug) | no save | needs-input |
| D03 | Review prep used sensitive notes | ask before save | drafted or saved |
| D04 | Same-day 1on1-log rerun | idempotent replace post-meeting block | saved |
| D05 | Advice answer | ask before private note | answered |
| D06 | brag-doc completed | auto-private per leaf | saved |

---

## External actions

| # | Input | expected behavior | terminal |
|---|-------|-------------------|----------|
| X01 | "Save to Notion" (1on1-log) | explicit approval for Notion write | saved + external pending approval |
| X02 | "Post this to Slack" | ask before send | needs-input |
| X03 | Artifact auto-saved privately | external still requires separate approval | saved |

---

## Resume

| # | Input | expected behavior | terminal |
|---|-------|-------------------|----------|
| M01 | "Resume" (no subject) | ask subject first | needs-input |
| M02 | "Resume alex 1:1" + prior output exists | read latest `outputs/*1on1-alex*`; re-confirm window if stale | saved or drafted |
| M03 | "Resume" + window clearly expired | re-confirm window before fetch | needs-input |

---

## Escape hatch

| # | Input | expected behavior |
|---|-------|-------------------|
| H01 | "@review-prep for alex" while mode active | Run review-prep; keep privacy/evidence/save contracts |
| H02 | "@1on1" without sensitive consent | Leaf skip-sensitive rules + consent-before-sensitive |

---

## Dry-run checklist

For each representative scenario (minimum: R01–R12, A01, I01, S01, E01, J01, P01, D01, X01, M01, H01):

- [ ] Classify banner matches expected `route`, `leaf`, `subject`, `window`, `privacy`, `save`
- [ ] All active principles listed with decisions
- [ ] Correct leaf `SKILL.md` loaded
- [ ] Forbidden behaviors absent
- [ ] Terminal state matches table
- [ ] Save behavior matches contracts

Static file review alone is insufficient — run at least three prompts in a fresh agent session and record results.
