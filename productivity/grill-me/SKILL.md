---
name: grill-me
description: Grill the user on a plan or design until each decision-tree branch is resolved or explicitly deferred. Use when the user says "grill me" or wants a plan stress-tested without doc/glossary updates.
---

# Grill me

## Fast path

One question at a time → walk every branch of the decision tree → shared understanding.

**You get:** Resolved plan/design with each branch decided or explicitly deferred.

**You need:** A plan or design to stress-test; user available to answer one question at a time.

**Done when:** Decision-tree branches are enumerated; each branch is resolved or listed as explicitly deferred; no blocking question remains; codebase was consulted where it could answer instead of asking the user.

## During

Ask one question at a time and provide a recommended answer with each question.

If a question can be answered by exploring the codebase, explore the codebase instead.

If the user mentions `CONTEXT.md`, ADRs, domain language, glossary, or doc updates, route to `grill-with-docs`.
