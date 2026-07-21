---
name: code-review
description: Review a branch, PR, work-in-progress change, or harvest output along two axes: Standards and Spec. Use when the user asks for code review, review since a fixed point, or harvest reaches the post-cultivate review gate.
---

# Code Review

## Fast path

Pin fixed point -> identify spec -> identify standards -> run Standards and Spec read-only subagents in parallel -> report side by side -> stop harvest on severe findings.

**You get:** A two-axis review of the diff: repo standards and smell baseline, plus fidelity to the originating spec.

**You need:** A non-empty diff against a fixed point, and either a spec source or an explicit "no spec" decision.

**Done when:** Standards and Spec reports are delivered; gate is `pass` (no severe findings), `waived` (user approved continuing with severe findings documented), or `blocked` (severe findings unresolved — harvest stops). Non-severe findings alone do not block.

## Gate contract

- **`pass`** — reports delivered; no severe findings (or Spec skipped with "no spec available" and no severe Standards findings).
- **`waived`** — user explicitly approved continuing despite severe finding(s); list each waived item in plan or review output.
- **`blocked`** — severe finding(s) unresolved; do not report `pass` or advance to `docs-sync`.
- **`stop-user-input-needed`** — severe findings present; ask user before choosing `waived` or `blocked`.
- Delivering reports without classifying severity is not completion. Empty diff is blocked — resolve fixed point first.

## Fixed point

Harvest default: use the same `<base>...HEAD` range as `docs-sync` and `draft-pr`.

Standalone: use the fixed point supplied by the user. If missing, ask. Confirm it resolves with `git rev-parse <fixed-point>` and the three-dot diff is non-empty before launching subagents.

Capture once:

```bash
git diff <fixed-point>...HEAD
git log <fixed-point>..HEAD --oneline
```

## Spec source

Harvest default: the approved `seed` plan file is the spec. Use its todos, done criteria, acceptance criteria, scope notes, and explicit waivers.

Standalone fallback order:

1. Issue references in commit messages, fetched through the repo issue-tracker workflow when available.
2. A spec path supplied by the user.
3. A matching PRD or spec under `docs/`, `specs/`, or `.scratch/`.
4. If none found, ask the user where the spec is. If they say none exists, skip the Spec subagent and report "no spec available".

## Standards sources

Find repo standards such as `CODING_STANDARDS.md`, `CONTRIBUTING.md`, `AGENTS.md`, `CLAUDE.md`, `.cursor/rules/`, framework docs, or local README guidance for touched areas.

Always add the smell baseline below unless a documented repo standard overrides it. Smells are judgement calls, not hard violations. Skip issues already enforced by tooling.

- **Mysterious Name**: a function, variable, or type name does not reveal what it does or holds. Fix by renaming; if no honest name exists, the design is unclear.
- **Duplicated Code**: same logic shape appears in more than one hunk or file. Fix by extracting shared shape.
- **Feature Envy**: a method reaches into another object's data more than its own. Fix by moving behavior onto the envied data.
- **Data Clumps**: same fields or params travel together. Fix by bundling them into one type.
- **Primitive Obsession**: primitive or string stands in for a domain concept. Fix with a small domain type.
- **Repeated Switches**: same switch or if-cascade on the same type recurs. Fix with polymorphism or one shared map.
- **Shotgun Surgery**: one logical change forces scattered edits. Fix by gathering what changes together.
- **Divergent Change**: one file changes for several unrelated reasons. Fix by splitting responsibilities.
- **Speculative Generality**: abstraction, params, or hooks serve needs the spec does not have. Fix by deleting or inlining until real need appears.
- **Message Chains**: long `a.b().c().d()` navigation leaks structure. Fix with one method on the first object.
- **Middle Man**: class or function mostly delegates onward. Fix by calling the real target directly.
- **Refused Bequest**: subclass or implementer ignores most inherited behavior. Fix with composition.

## Parallel review

Launch two read-only subagents in one message when possible.

Standards prompt must include:

- Diff command and commit list.
- Standards-source paths or snippets.
- Smell baseline from this skill.
- Brief: "Report per file/hunk where relevant: documented-standard violations with standard citation; baseline smells with smell name and quoted hunk. Distinguish hard violations from judgement calls. Repo standards override the baseline. Skip anything tooling enforces. Under 400 words."

Spec prompt must include:

- Diff command and commit list.
- Spec path or fetched spec contents.
- Brief: "Report: missing or partial spec requirements; behavior not asked for; requirements that look implemented but wrong. Quote the spec line or plan todo for each finding. Under 400 words."

If no spec exists, skip Spec and say so.

## Severity and harvest gate

Report all findings, but classify them.

- **Severe**: secret in diff; security-sensitive bug; documented-standard violation that blocks merge; missing, partial, or wrong spec requirement; dangerous scope creep; behavior regression against the plan.
- **Non-severe**: judgement-call smell; naming, structure, or maintainability concern without clear behavior or policy break.

In harvest: severe finding stops the lifecycle. Ask the user whether to fix, waive, or block before continuing to `docs-sync`. Non-severe findings do not block; record them in the plan or PR body when useful.

## Output

Use:

```markdown
## Standards
[verbatim or lightly cleaned Standards report]

## Spec
[verbatim or lightly cleaned Spec report, or "No spec available"]

Summary: Standards: N findings, worst: X. Spec: N findings, worst: Y.
Gate: pass | stop-user-input-needed | waived | blocked

Use **`blocked`** when severe findings remain unresolved. Do not use **`pass`** as a synonym for "review ran."
```

Do not merge or rerank the two axes. They answer different questions.
