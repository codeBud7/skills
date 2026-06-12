---
name: brag-doc
description: Build a first-person weekly or on-demand brag document for the person invoking the skill only (not for directs). Summary-first artifact with numbered references from sources.md Me-scoped links (Notion, Linear, GitHub, Slack, meetings when linked), optional private expectations.md; writes outputs/YYYY-MM-DD-brag-doc.md under the Home OS private root. Use for weekly brag doc, career wins, or self performance review prep. Triggers: "weekly brag doc", "career wins", "update my brag document".
disable-model-invocation: true
---

# Brag doc

## Fast path

Private root resolved; `expectations.md` is real criteria **or** `## Status: declined`; user stated inclusive **time window**; pull only **`### Me`** scope per `sources.md`. Write `outputs/YYYY-MM-DD-brag-doc.md`. Full cite and heading rules: [reference.md](reference.md).

**You get:** A first-person, summary-first brag doc for **you** (the operator) with numeric cites and a single `## References` list — suitable for reviews, promos, and resumes.

**You need:** Stated **time window**; private Home OS with `sources.md` **`### Me`** pointers (or accept a sparse stub); `expectations.md` with real criteria **or** `## Status: declined` so the expectations gate does not block.

**Done when:** `outputs/YYYY-MM-DD-brag-doc.md` exists with `Window`, `Week in brief`, other applicable sections, `## References` (if any `[n]` cites), and `Sources checked`; narrative has no inline evidence URLs; file matches [reference.md](reference.md) cite and URL rules.

**Templates:** [`expectations.template.md`](expectations.template.md) (optional private file at Home OS root; not required in git)

In the spirit of [Brag documents](https://jvns.ca/blog/brag-documents/)—first-person, evidence-backed, for reviews, promos, and resumes. The **artifact is summary-first**: a short **Week in brief** up front, then grouped detail; **claim-level URLs live only in `## References`**, not inline in the narrative (avoid activity-log link soup).

## Who this is for (hard rule)

**Only the user running this skill** (the Home OS owner / operator). **Not** for brag material **about directs**.

- Do **not** ask for a direct slug or use `directs/<slug>.md` as the subject of the doc.
- If the user’s wording sounds like they want someone else’s packet, **stop**, clarify, and route to `review-prep` or `1on1` as appropriate.

## Inputs (read order)

1. **Private Home OS root** — resolve per **`home-os`** (**Path resolution order**); do not guess the path.
2. **`sources.md`** — including **`### Me`** (or equivalent) subsections under Meeting notes, Linear, GitHub, Slack, and Notion blocks. Operational handles and read scope live here.
3. **`expectations.md`** — optional private criteria file at the private root (see gate below).

Do **not** read **`context.md`** for this skill. Narrative context stays for other skills; this artifact is **activity-derived** from `sources.md` + MCP + `expectations.md` only.

## Blocking gates (before any MCP pulls)

Resolve private root first. Then:

### 1) Expectations gate

Inspect `expectations.md` at the private root.

- **Real criteria present** (substantive content, not only `## Status: declined`) → read for alignment and improvement framing.
- **`## Status: declined` sentinel** (and no other usable criteria) → skip `Against my stated expectations`; note in `Missing context` that criteria mapping is off by choice.
- **File missing** OR user used explicit **relink** intent (see below) and you need a fresh decision → **ask once**: do they want to add job expectations / success criteria / level rubric as a lens for this brag doc?
  - **Yes** → intake (paste in chat, or fetch from a Notion URL they give) → write **only** to private `expectations.md`, never git.
  - **No** → write `expectations.md` containing **only** `## Status: declined` (and nothing else required) so later runs do not re-prompt.

**Turn criteria back on after declined:** only when the user uses **explicit phrases** such as “relink expectations”, “update brag criteria”, or “replace expectations.md”. **Confirm** before overwriting the sentinel or old file, then replace `expectations.md` with new content.

### 2) Time window gate

The user **states the time window in each run** (inclusive start/end dates, or a clear relative phrase you can convert).

- If **missing** → **blocking ask** for the window before MCP pulls.
- **Inclusive date boundaries** default to **UTC** unless the user specifies a different timezone in the prompt; state the assumption under `Window`.

**Automation / Loop:** the prompt must include an explicit range (e.g. `2026-06-02..2026-06-08`). Unattended runs should also have `expectations.md` already present (real criteria **or** `## Status: declined`) so the expectations gate does not stall.

## Minimum config

If `sources.md` has **no usable `### Me` pointers** (no GitHub handle, Linear identity notes, Notion URLs/DBs, Slack channel/thread scope, nor meeting links under Me), produce a **stub** with `Missing context` and do not broaden scope beyond what they listed.

## MCP retrieval order

**Shared conduct:** Default GitHub and Slack MCP behavior — see **`home-os`** (**MCP and source retrieval boundaries**). This skill adds **self-only / `### Me` scope**, Notion handling, caps, and ordering below.

After both gates pass:

1. **Notion** — Fetch pages/DBs linked under **Me** / Notion in `sources.md`. If Notion MCP supports attribution or “edited by me” in the window, run a **capped** in-window search (hard cap e.g. **30** items); merge with explicit links; dedupe. If MCP cannot attribute edits to the user, skip search and note in `Missing context`. Tag `[Notion]`.
2. **Linear** — Assigned or owned issues with activity in the window (per `sources.md` Me notes). Tag `[Linear]`.
3. **GitHub** — Authored PRs, reviews, and substantive comments in repos from `sources.md` Me scope. Tag `[GitHub]`.
4. **Slack** — **Only** channels and threads listed under **Me** / Slack in `sources.md`. **DMs off** unless DMs are explicitly listed there. Tag `[Slack]`.
5. **Meetings / Granola** — If `sources.md` lists meeting notes or Granola pointers, fetch **in-window**; tag `[meeting]`. If not linked, skip without asking.

Do **not** expand Me-linked Slack, Notion, or Linear scope beyond configured links and caps without an explicit user ask.

While pulling data you may mentally tag by system (`[Notion]`, `[Linear]`, etc.). In the **written output**, put system on the **`## References`** rows (e.g. `1. [GitHub] …`)—do **not** paste inline evidence URLs or `[text](url)` in narrative sections; use numeric cite markers there instead (see [reference.md](reference.md)).

## Dedup

When the same work appears in multiple systems with **high confidence** (shared URL, Linear issue key in PR title, obvious same title + same week), **merge** into **one** narrative bullet and attach **one set** of cite markers, e.g. “… shipped the fix for CRM-9999 [1][2].” where `[1]` is the PR and `[2]` is the issue—**not** trailing `[Linear][GitHub]` in the sentence. Reuse the same `[n]` when the same URL is cited again later in the file.

## Output

Section order, cite rules, golden shape, and optional headings: **[reference.md](reference.md)**.

## Saving

**Always write** (unless aborted at a blocking question):

`outputs/YYYY-MM-DD-brag-doc.md`

Use **run date** in the filename. Include generated timestamp, stated time window, **`## References`** (when any `[n]` cites exist), and **`Sources checked`** inside the file.

If the week had **zero** tagged cross-system evidence, **still write** the file with honest sparse sections and strong `Missing context`.

## Kill criteria

- Unknown private root → ask.
- Blocking gates unresolved → do not start MCP pulls.
- No usable **Me** pointers → stub + `Missing context`.
- Never use `directs/<slug>.md` as the brag subject.

## Loop / automation example prompt

```text
Run brag-doc. Window: 2026-06-02..2026-06-08 (UTC). Private root already has expectations.md (criteria or ## Status: declined). Pull per sources.md Me links only.
```

Adjust dates and paths to your setup.
