---
name: brag-doc
description: >-
  Build a first-person weekly or on-demand brag document for the person invoking the skill only (not for directs). Summary-first artifact with numbered references: pulls evidence from sources.md Me-scoped links (Notion, Linear, GitHub, Slack, meetings when linked), optional private expectations.md; writes outputs/YYYY-MM-DD-brag-doc.md under the Home OS private root. Use for weekly brag doc, career wins, self performance review prep, or "update my brag document".
disable-model-invocation: true
---

# Brag doc

In the spirit of [Brag documents](https://jvns.ca/blog/brag-documents/)—first-person, evidence-backed, for reviews, promos, and resumes. The **artifact is summary-first**: a short **Week in brief** up front, then grouped detail; **claim-level URLs live only in `## References`**, not inline in the narrative (avoid activity-log link soup).

## Who this is for (hard rule)

**Only the user running this skill** (the Home OS owner / operator). **Not** for brag material **about directs**.

- Do **not** ask for a direct slug or use `directs/<slug>.md` as the subject of the doc.
- If the user’s wording sounds like they want someone else’s packet, **stop**, clarify, and route to `review-prep` or `1on1` as appropriate.

## Inputs (read order)

1. **Private Home OS root** — same resolution as `home-os`: `Path:` under `## Private Root` in private `sources.md` → else default `~/.agents/management/home-os` if it exists → else ask before writing.
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

After both gates pass:

1. **Notion** — Fetch pages/DBs linked under **Me** / Notion in `sources.md`. If Notion MCP supports attribution or “edited by me” in the window, run a **capped** in-window search (hard cap e.g. **30** items); merge with explicit links; dedupe. If MCP cannot attribute edits to the user, skip search and note in `Missing context`. Tag `[Notion]`.
2. **Linear** — Assigned or owned issues with activity in the window (per `sources.md` Me notes). Tag `[Linear]`.
3. **GitHub** — Authored PRs, reviews, and substantive comments in repos from `sources.md` Me scope. Prefer GitHub MCP; if unavailable, read-only `gh` as fallback. Tag `[GitHub]`.
4. **Slack** — **Only** channels and threads listed under **Me** / Slack in `sources.md`. **DMs off** unless DMs are explicitly listed there. Prefer channel/thread reads over workspace-wide search. Tag `[Slack]`.
5. **Meetings / Granola** — If `sources.md` lists meeting notes or Granola pointers, fetch **in-window**; tag `[meeting]`. If not linked, skip without asking.

Do **not** expand Slack, Notion, or Linear scope beyond configured links and caps without an explicit user ask.

While pulling data you may mentally tag by system (`[Notion]`, `[Linear]`, etc.). In the **written output**, put system on the **`## References`** rows (e.g. `1. [GitHub] …`)—do **not** paste inline evidence URLs or `[text](url)` in narrative sections; use numeric cite markers there instead (see **Output**).

## Dedup

When the same work appears in multiple systems with **high confidence** (shared URL, Linear issue key in PR title, obvious same title + same week), **merge** into **one** narrative bullet and attach **one set** of cite markers, e.g. “… shipped the fix for CRM-9999 [1][2].” where `[1]` is the PR and `[2]` is the issue—**not** trailing `[Linear][GitHub]` in the sentence. Reuse the same `[n]` when the same URL is cited again later in the file.

## Output

Use **first person**, short paragraphs, facts over spin. **Prose-first** in every section: group related work (same theme, same epic, same incident) into fewer bullets instead of one bullet per raw event.

### Optional preface (above `Window`)

You may include a **short** optional block before `## Window` (canonical path, run date, one-line provenance). **No** cite numbers there. **No** claim-evidence URLs unless the user explicitly wants them in preface (default: none).

### Cites and references (required pattern)

- In **narrative sections** (everything from `Week in brief` through `Addendum` when present): **no** raw `https://…` strings and **no** markdown links `[label](url)` for claim evidence. **Exception:** file paths, command examples (e.g. `gh search prs --merged-at …`), and hostnames mentioned as plain words are fine when they are not hotlinks.
- Use **numeric markers** only for evidence: `[1]`, `[2]`, … immediately after the claim they support. **Reuse** the same number when the same URL appears again anywhere in the file (including across sections).
- Put **all** claim-evidence URLs in a single **`## References`** section: numbered list `1.` … `n.`; each line = optional source kind in brackets + short human-readable label (repo, PR number, issue key, Slack thread/channel + date) + full URL. **Assign numbers in first-appearance order** through the whole file (including **Addendum**).
- Slack: use plain text `#channel-name` + date in the narrative; put the archive/thread URL **once** per distinct thread in `References`.
- Linear/GitHub: plain issue keys (`CRM-1234`) and PR numbers in prose are encouraged; URLs only under `References`.

### `Missing context` vs `References`

- **`## References`**: URLs (and labels) that **prove** narrative claims (PRs, issues, Slack threads, Notion pages cited).
- **`## Missing context`**: operational gaps (skipped MCPs, caps hit, declined criteria). Use **paths and tool names**; do **not** duplicate long Slack/Linear/GitHub URLs already listed in `References`—point to `References` or `sources.md` instead. Claim-evidence URLs **do not** belong here.

### Headings (in order)

`Window`  
Inclusive dates and **UTC** (or user-specified TZ). Slack/query date quirks one line if material.

`Week in brief` (**always**)  
**3–6 bullets** or one short paragraph: what mattered this week—outcomes, themes, leadership highlights. **No URLs, no `[n]` cite markers, no link-style evidence**—pure summary. If the week was light, say so honestly.

`Shipped and impact`  
Grouped outcomes; cite with `[n]` only. **Cheap metrics** (counts, `gh` one-liners as **command text**, small LOC if trivial) welcome—still no hotlinked evidence URLs in prose.

`Against my stated expectations`  
**Only** if `expectations.md` contains real criteria (not declined sentinel). Tie bullets to criteria with `[n]` cites. For criteria with **no** tagged activity this window, add **neutral** lines: no tagged activity — validate if still a priority (**not** scored as failure).

`Leadership and collaboration`  
Reviews, pairing, cross-team—only with evidence via `[n]`.

`Learning and craft`  
Tools, incidents, postmortems—evidence-backed with `[n]`; **reuse** refs from `Shipped` when pointing at the same URL.

`Visibility`  
Talks, demos, blog—only if evidenced (`[n]`).

`Possible improvements`  
Evidence-grounded gaps, friction, slipped dates. Plain issue keys in prose + `[n]` where a URL exists. If evidence is thin, use **questions to validate**, not harsh self-labels. No invented performance judgments.

`Carry into next week`  
Open threads; plain keys + `[n]`, no inline URLs.

`Missing context`  
Per **Missing context vs `References`** above.

`Addendum` (optional)  
Extra date range or same-day refresh—**same cite rules** as the main body. Cite indices **continue** the global numbering; **do not** reset at 1. If no addendum, omit the heading.

`## References`  
Single numbered list for the **entire** file (main + addendum). Every `[n]` in the doc appears here exactly once per distinct URL.

`Sources checked`  
**Methodology only**: private root path, which MCPs/commands, handles, date brackets, repo lists—**not** a second dump of PR/issue/Slack **claim** URLs (those belong only in `## References`).

### `Themes for my narrative` (default: omit)

**Do not** include this heading by default—synthesis belongs in **`Week in brief`**.  
**Only** if the user **explicitly** asks in the run prompt for a separate “themes / narrative” section: add a **short** `Themes for my narrative` section that **must not repeat** `Week in brief`; label it as synthesis, not primary evidence.

**Names:** keep collaborator names as they appear in evidence (private file). Add one line: sanitize before external paste.

**Tone:** Evidence binding—if the week was light, say so. Optional “so what” only where `[n]` citations exist.

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
