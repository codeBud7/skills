# boundary-check

Validate at the edge. Trust typed internals.

**Why:** Guards in the middle of a function duplicate or miss the real untrusted input.

**Apply when:** Request bodies, env, files, plugin data, RPC, CLI args.

**Do:** Parse and reject at the boundary. Inner code takes a validated type.

**Don't:** Sprinkle `if (!x)` through domain logic for data that already passed the edge.

**Report:** Where validation now lives, and which inner guards you removed or kept.
