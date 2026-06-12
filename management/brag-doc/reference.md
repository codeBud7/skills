# Brag doc — output shape and cite rules

Full narrative rules live here so [`SKILL.md`](SKILL.md) stays a routing surface.

## Output

Use **first person**, short paragraphs, facts over spin. **Prose-first** in every section: group related work (same theme, same epic, same incident) into fewer bullets instead of one bullet per raw event.

### Golden shape (illustrative stub)

Fenced example — fake URLs and dates; real runs use your window and `## References` rows.

```markdown
## Window
2026-06-02 .. 2026-06-08 (UTC)

## Week in brief
- Shipped the auth retry path behind a flag and unblocked the CRM team on CRM-2401.
- Paired with Alex on incident review; turned one follow-up into a tracked issue.

## Shipped and impact
- Landed PR #442 (repo X) adding exponential backoff for token refresh [1].
- Commented on design thread for API versioning [2].

## References
1. [GitHub] PR 442 — `https://github.com/org/repo/pull/442`
2. [Slack] #platform — `https://example.slack.com/archives/C0123456789/p1234567890`

## Sources checked
Private root `~/.agents/management/home-os`; GitHub MCP + `gh`; Slack #platform only; window as above.
```

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
