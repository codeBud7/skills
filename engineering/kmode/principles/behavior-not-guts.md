# behavior-not-guts

Call the code the way its users do. Assert a literal expected value.

**Why:** A test that still passes if every import returns `undefined` is theater.

**Apply when:** Writing or changing tests.

**Do:** Exercise the public surface. Assert the user-visible result. Delete tests that only inspect private wiring.

**Don't:** Mock the system under test into a no-op and call it coverage.

**Report:** The user-facing assertion you added or kept.
