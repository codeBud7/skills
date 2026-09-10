# Verification receipt

```markdown
# Receipt: <slug>

- **When:** <ISO-8601 UTC>
- **Route:** <playbook-id or skill>
- **Surface:** UI | CLI | API | library
- **Command:** `<exact command>`
- **Expected:** <literal>
- **Observed:** <literal>
- **Gate:** pass | blocked | waived | not-applicable
- **Artifacts:** <paths that still exist after cleanup>
- **Not exercised:** <paths/states skipped>
- **Missing capability:** <or none>
```

Skip-all, compile-only, or "should work" → `blocked`.
