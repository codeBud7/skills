# Shared contracts

Use these words in every engineering skill, playbook, and receipt. Do not invent synonyms.

## Gate status

| Status | Meaning |
|--------|---------|
| `pass` | Work completed and **executed** proof exists. |
| `blocked` | Stop. Name the gap. Do not advance. |
| `waived` | User explicitly accepted a named gap and risk. |
| `not-applicable` | Stage does not apply; one-sentence why. |
| `stop-user-input-needed` | Severe finding; ask before waive or block. |

Skip-all is never `pass`. Self-report is never `pass`. Compile/lint alone is never user-path proof.

## Skill body

Every `SKILL.md`: YAML `name` + `description`; `## Fast path`; **You get** / **You need** / **Done when**. Mutating skills add **Gate contract**.

## Principle citation

When a principle applies, name it and the **decision it changed**. Citation with no decision is name-drop. Do not invoke principles as skills; read the file, then steer.

## Terminals

A route ends with one route-specific artifact or handoff, classified with a gate
status when its leaf skill defines one. Terminal sections must name the artifact
or handoff and any allowed outcomes. Gate statuses use only the shared words
above.

## Capabilities

Playbooks list required **capabilities** from [hosts/capabilities.md](hosts/capabilities.md). Host profiles map them. Core files never name product tools.
