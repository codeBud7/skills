# 🧠 Productivity skills

You have a plan that sounds plausible until someone asks the third question. These skills **stress-test intent before code**: one question at a time, walking the decision tree until branches resolve or get explicitly deferred. **`grill-me`** is the fast path when you just need shared understanding. **`grill-with-docs`** adds domain language, glossary checks, and inline updates to `CONTEXT.md` / ADRs when terminology and trade-offs matter.

## 🧰 Skills

- [`grill-me`](grill-me/SKILL.md): **Moment:** the design doc reads fine but you have not walked every branch. **Outcome:** shared understanding via relentless one-at-a-time questions; the agent explores the codebase instead of asking when it can.

- [`grill-with-docs`](grill-with-docs/SKILL.md): **Moment:** the plan uses fuzzy terms that might clash with how the repo already talks about the domain. **Outcome:** same grilling plus glossary challenges, code cross-checks, and inline updates to `CONTEXT.md`; ADRs offered only when a decision is hard to reverse, surprising, and the result of a real trade-off.

Both skills auto-invoke from natural language (e.g. "grill me", "grill me with docs").
