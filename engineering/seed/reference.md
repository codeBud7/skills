# Seed reference

## Plan body (after YAML frontmatter)

```markdown
# Plan: [short title]

> _Estimated costs for executing this plan:_
> **Current Model** ([Model]): … | **$X.XX – $Y.YY**
> **Auto Model**: … | **$A.AA – $B.BB**

## Goal

## Non-goals

## Context

## Constraints & assumptions

## Approach

## Work breakdown

## Risks & mitigations

## Testing & verification

## Rollout / follow-ups
```

## Cost estimate (workspace Plan Cost Estimation rule)

After H1: identify model → rates per 1M tokens → classify per todo + 20% overhead → two blockquotes (Current + Auto; min–max = calc × 1.5).

## Frontmatter todos

Required fields per item: `id`, `content` (include done criteria in `content`).

Optional fields (backward compatible — omit = `pending`):

| Field            | Values                               | Use                                       |
| ---------------- | ------------------------------------ | ----------------------------------------- |
| `status`         | `pending` \| `in_progress` \| `done` | execution progress                        |
| `blocked_reason` | string                               | why stopped (env, flake, scope, approval) |

Example:

```yaml
todos:
  - id: add-auth
    content: Add login endpoint; tests cover 401/200
    status: pending
  - id: draft-pr
    content: Open draft PR with scoped commits
    status: pending
```

After plan approval, **harvest** may advance `status` (and set `blocked_reason`) on the same file during ship.
