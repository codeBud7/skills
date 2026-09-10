# illegal-states

Make illegal combinations unrepresentable.

**Why:** A boolean pair that cannot both be true will be both true in production.

**Apply when:** Status flags, optional fields that depend on each other, stringly-typed modes.

**Do:** Use a union, enum, or constructor that only builds valid states.

**Don't:** Document "don't set both" and leave the type open.

**Report:** The illegal state you closed.
