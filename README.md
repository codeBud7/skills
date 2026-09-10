# ✨ Skills

You already context-switch between shipping and leading. These folders are **repeatable playbooks** for your agent: same week you might land a hotfix _and_ walk into a 1:1 you did not have headspace to prep. The repo holds the skills and templates.

## 💡 Why this exists

One afternoon the ticket is fuzzy but the deadline is not. Another morning you need review bullets that do not sound like vibes. **Engineering** skills bias toward **classify → principles → prove → ship** with less thrash. **Management** skills bias toward evidence-backed briefs (1:1s, reviews, hiring, strategy) once your private Home OS has enough signal. Same idea in both places: less reinventing the workflow every time.

## 🛤️ Pick your lane

**IC or tech lead: shipping**

Name **`kmode`**. It classifies feature, bug, investigation, performance, refactor, plan, and ship work; applies named engineering principles; **does not mark mutating work done without a real-artifact receipt**; then hands approved plans to **`harvest`** for TDD, local gates, docs, draft PR, and CI. Impact: fewer silent patches, fewer “it compiles” false dones, a PR reviewers can reason about.

Escape hatch: still `@seed` / `@harvest` / `@tdd-cycle` if you already know the step.

**Manager or EM: people and planning**

Your notes live in five tools and your calendar says the 1:1 is tomorrow. You run **`home-os`** once, fill **`context.md`** and a **`directs/<slug>.md`**, and link sources when you can. Then **`1on1`**, **`1on1-log`**, **`review-prep`**, **`brag-doc`** (self-only wins doc), **`strategy-brief`**, or **`hiring-feedback`** can turn that into a short brief or artifact with tagged evidence instead of a Sunday-night re-read of everything. Impact: calmer prep, clearer follow-ups, feedback that cites reality.

**Anyone: stress-test a plan before you build**

The scope feels clear until the third edge case. Run **`grill-me`** for a one-question-at-a-time interview that walks every branch of the decision tree, or **`grill-with-docs`** when you also want the plan challenged against domain language and `CONTEXT.md` / ADRs updated as terms resolve. Impact: fewer wrong-direction plans and sharper shared vocabulary before **`seed`** or implementation.

## ⚙️ Install

Flat symlinks: `<dest>/<skill-name>` → file in this repo. The script does not create nested `engineering/` or `management/` under the destination. After install, the engineering entry skill is **`kmode`**.

```bash
./scripts/setup-skills.sh --tool cursor
./scripts/setup-skills.sh --tool claude
./scripts/setup-skills.sh --tool codex
./scripts/setup-skills.sh --tool agents
./scripts/setup-skills.sh --dest ~/.some-agent/skills
./scripts/setup-skills.sh --all
./scripts/setup-skills.sh --dry-run --tool agents   # print only
./scripts/validate-kmode.sh                        # engineering dispatcher + proof contracts
```

**Selectors (pick one):**

- `--tool cursor|claude|codex|agents` — install to one known tool home
- `--dest PATH` — install to an arbitrary skills directory
- `--all` — install to every known tool home (cannot combine with `--tool` or `--dest`)

**Options:**

- `--dry-run`: print planned links and conflicts; change nothing. Exit `1` when real install would fail (conflicts, zero skills).
- `--force`: replace conflicting entries for managed skill names only.
- If the destination is a single symlink to this whole repo (e.g. `~/.claude/skills` → here), use `--force` to replace it with a directory of per-skill links.

**Exit status:**

- `0` — success: at least one skill discovered; all links installed or already correct
- `1` — usage/selector error, zero skills discovered, or unresolved conflicts (including under `--dry-run`)

Correct existing symlinks are idempotent: re-run returns `0` without changes.

If this repo is checked out at `~/.cursor/skills`, the `cursor` preset adds top-level links (e.g. `kmode` → `engineering/kmode`, `harvest` → `engineering/harvest`) next to the `engineering/` and `management/` trees.

**Upgrade:** If you had an old layout with delivery skills at repo root, re-run `./scripts/setup-skills.sh --tool cursor` (or your home) so links target `engineering/`. Management skills live under `management/`.

## 🔒 Privacy

Do not commit real people data, secrets, filled Home OS files, or generated briefs. Private EM data stays outside git. See [management/README.md](management/README.md) and the privacy rules in each management `SKILL.md`.
