# prototype

**Triggers:** spike, prototype, try both, throwaway
**Capabilities:** `readFiles`, `editFiles`, `runCommand`, `git`
**Principles:** exhaust-options, smallest-change, prove-the-artifact
**Mutates:** throwaway only; isolate if possible
**Verification:** each option has a short receipt; pick is justified; delete losers unless user keeps one

## Stages

1. Invoke `prototype`. Name 2–3 options.
2. Spike each against one shared proof command.
3. Pick. Do not merge options.
4. Productionize only after `plan` if the spike graduates.

## Fallback

No isolation → sequential spikes; say so.

## Terminal

Evidence report + winner, or a `plan` handoff.
