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

## Cost estimate

Follow the workspace **Plan Cost Estimation** rule after the H1.

## Frontmatter todos

Required fields per item: `id`, `content` (include done criteria in `content`).

Optional fields (backward compatible — omit = `pending`):

| Field            | Values                               | Use                                       |
| ---------------- | ------------------------------------ | ----------------------------------------- |
| `status`         | `pending` \| `in_progress` \| `done` | execution progress                        |
| `blocked_reason` | string                               | why stopped (env, flake, scope, approval) |

### Status invariants

- `status: done` requires **no** unresolved `blocked_reason`. Clear `blocked_reason` before marking `done`.
- `status: done` with a non-empty `blocked_reason` is invalid — treat as still blocked.
- When blocked, set `blocked_reason` and keep `status` as `pending` or `in_progress`; do not mark `done` until the blocker is resolved, waived with user input, or shown non-applicable.
- Clearing `blocked_reason` without resolving the underlying gate is not allowed.

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
