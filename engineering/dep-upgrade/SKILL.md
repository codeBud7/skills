---
name: dep-upgrade
description: Dep upgrade assesses changelog and breakage risk, upgrades incrementally, and verifies through local quality gate and CI. Use when upgrading a dependency, bumping dependencies, or asking if an upgrade is safe.
---

# Dep upgrade

## Fast path

Assess current vs target → route trivial inline or risky via `seed` → bump → `local-quality-gate` + `ci-green`.

**You get:** Dependency upgraded with lockfile updated, breakages fixed, checks green (or clear blocker report).

**You need:** Target dependency and version (or assessment ask); package manager access.

**Done when:** Target version installed; lockfile updated by the package manager; breakages fixed; `local-quality-gate` green; pushed branches pass `ci-green`; risky upgrades used an approved `seed` plan; blockers have clear user-visible status.

## Assess

1. Identify package manager + lockfile (npm/pnpm/yarn, pip/poetry, cargo, go mod, etc.).
2. Record current vs target version; classify semver jump (patch / minor / major).
3. Read changelog, release notes, migration guide for breaking changes.
4. Find in-repo usages and call sites (imports, config, API surface).
5. Check transitive / peer dependency constraints.

## Route

**Trivial** (patch/minor, no breaking changes, few call sites) → upgrade inline.

**Risky** (major bump, breaking changes, framework/build/auth/runtime dep, many call sites, transitive conflicts) → run `seed` for a plan first; after approval, execute via `harvest`.

Assessment-only ("is this safe?") → report findings; don't upgrade unless user confirms.

## Upgrade

1. One dependency or logical group at a time.
2. Use the package manager to bump versions — never hand-edit lockfiles.
3. Apply codemods or migration steps from upstream docs when available.
4. Fix call-site breakages; minimal diff per `repo-safety`.

## Verify

1. Run `local-quality-gate`.
2. Fix failures; rerun affected checks.
3. After push: run `ci-green`.

## Stop

Report clearly when blocked:

- Unresolved transitive or peer dependency conflicts
- No migration path for breaking API changes
- Requires runtime/engine bump user hasn't approved
- Peer-dependency deadlock the package manager can't resolve
