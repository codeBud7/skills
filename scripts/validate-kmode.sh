#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
ENGINEERING_DIR="${REPO_ROOT}/engineering"
KMODE_DIR="${ENGINEERING_DIR}/kmode"
FAILURE_COUNT=0

fail() {
  printf 'fail: %s\n' "$*" >&2
  FAILURE_COUNT=$((FAILURE_COUNT + 1))
}

need_file() {
  local file_path="$1"
  [[ -f "${file_path}" ]] || fail "missing file: ${file_path}"
}

frontmatter_value() {
  local field_name="$1"
  local file_path="$2"
  awk -v field_name="${field_name}" '
    NR == 1 {
      if ($0 != "---") exit
      in_frontmatter = 1
      next
    }
    in_frontmatter && $0 == "---" { exit }
    in_frontmatter && index($0, field_name ":") == 1 {
      sub("^[^:]+:[[:space:]]*", "")
      print
      exit
    }
  ' "${file_path}"
}

has_closed_frontmatter() {
  local file_path="$1"
  awk '
    NR == 1 && $0 != "---" { exit 1 }
    NR > 1 && $0 == "---" { found_close = 1; exit }
    END { if (!found_close) exit 1 }
  ' "${file_path}"
}

# --- skills ---
REQUIRED_SKILLS=(
  kmode seed harvest repo-safety tdd-cycle local-quality-gate cultivate
  code-review docs-sync draft-pr ci-green dep-upgrade
  verify create-verify maintain-verify
  investigate bugfix feature performance refactor architect prototype
  orchestrate handoff
)
ALLOWED_GATE_STATUSES=" pass blocked waived not-applicable stop-user-input-needed "

for skill in "${REQUIRED_SKILLS[@]}"; do
  skill_md="${ENGINEERING_DIR}/${skill}/SKILL.md"
  need_file "${skill_md}"
  [[ -f "${skill_md}" ]] || continue
  has_closed_frontmatter "${skill_md}" || fail "${skill_md}: frontmatter must open and close"
  skill_name="$(frontmatter_value name "${skill_md}")"
  if [[ "${skill_name}" != "${skill}" ]]; then
    fail "${skill_md}: frontmatter name must be '${skill}' (got '${skill_name}')"
  fi
  [[ -n "$(frontmatter_value description "${skill_md}")" ]] || fail "${skill_md}: missing frontmatter description"
  grep -q '## Fast path' "${skill_md}" || fail "${skill_md}: missing Fast path"
  grep -Fq '**You get:**' "${skill_md}" || fail "${skill_md}: missing You get"
  grep -Fq '**You need:**' "${skill_md}" || fail "${skill_md}: missing You need"
  grep -Fq '**Done when:**' "${skill_md}" || fail "${skill_md}: missing Done when"
  if [[ "${skill}" != "kmode" ]]; then
    grep -q '^## Gate contract' "${skill_md}" || fail "${skill_md}: missing Gate contract"
    gate_contract="$(
      awk '/^## Gate contract/{capture=1; next} capture && /^## /{exit} capture{print}' "${skill_md}"
    )"
    while IFS= read -r gate_status; do
      [[ -z "${gate_status}" ]] && continue
      case "${ALLOWED_GATE_STATUSES}" in
        *" ${gate_status} "*) ;;
        *) fail "${skill_md}: unknown gate status \`${gate_status}\`" ;;
      esac
    done < <(
      printf '%s\n' "${gate_contract}" |
        grep -oE '\*\*`[a-z-]+`\*\*' |
        tr -d '*`' ||
        true
    )
  fi
done

# --- playbooks ---
PLAYBOOK_IDS=(
  pause resume orchestrate plan ship ci deps review verify-harness
  investigate bug performance refactor prototype architect feature cleanup
)

for playbook_id in "${PLAYBOOK_IDS[@]}"; do
  playbook_path="${KMODE_DIR}/playbooks/${playbook_id}.md"
  need_file "${playbook_path}"
  [[ -f "${playbook_path}" ]] || continue
  grep -qE '^\*\*Triggers:\*\*' "${playbook_path}" || fail "${playbook_path}: missing Triggers"
  grep -qE '^\*\*Capabilities:\*\*' "${playbook_path}" || fail "${playbook_path}: missing Capabilities"
  grep -qE '^\*\*Principles:\*\*' "${playbook_path}" || fail "${playbook_path}: missing Principles"
  grep -qE '^\*\*Mutates:\*\*' "${playbook_path}" || fail "${playbook_path}: missing Mutates"
  grep -qE '^\*\*Verification:\*\*' "${playbook_path}" || fail "${playbook_path}: missing Verification"
  grep -q '## Stages' "${playbook_path}" || fail "${playbook_path}: missing Stages"
  grep -q '## Fallback' "${playbook_path}" || fail "${playbook_path}: missing Fallback"
  grep -q '## Terminal' "${playbook_path}" || fail "${playbook_path}: missing Terminal"
  terminal_body="$(awk '/^## Terminal/{capture=1; next} capture && /^## /{exit} capture && NF{print}' "${playbook_path}")"
  [[ -n "${terminal_body}" ]] || fail "${playbook_path}: empty Terminal"
  mutates_value="$(grep -E '^\*\*Mutates:\*\*' "${playbook_path}" | sed -E 's/^\*\*Mutates:\*\*[[:space:]]*//')"
  case "${mutates_value}" in
    no|no,*) ;;
    *)
      if grep -qiE '^\*\*Verification:\*\*.*(not-applicable only|none)' "${playbook_path}"; then
        fail "${playbook_path}: mutating playbook cannot waive all verification in the header"
      fi
      ;;
  esac
done

# --- principles ---
need_file "${KMODE_DIR}/principles/index.md"
while IFS= read -r principle_file; do
  [[ -z "${principle_file}" ]] && continue
  need_file "${KMODE_DIR}/principles/${principle_file}"
done < <(grep -oE '\[[a-z0-9-]+\.md\]\([a-z0-9-]+\.md\)' "${KMODE_DIR}/principles/index.md" | sed -E 's/.*\(([^)]+)\)/\1/' | sort -u)

# --- principles referenced in playbooks ---
allowed_principles="$(
  sed -n '/^| Name |/,/^$/p' "${KMODE_DIR}/principles/index.md" |
    awk -F '|' 'NR > 2 {
      principle = $2
      gsub(/^[[:space:]]+|[[:space:]]+$/, "", principle)
      if (principle != "") print principle
    }' |
    sort -u |
    tr '\n' ' '
)"
for playbook_path in "${KMODE_DIR}"/playbooks/*.md; do
  principles_line="$(grep -E '^\*\*Principles:\*\*' "${playbook_path}" || true)"
  while IFS= read -r principle; do
    [[ -z "${principle}" ]] && continue
    case " ${allowed_principles} " in
      *" ${principle} "*) ;;
      *) fail "${playbook_path}: unknown principle '${principle}'" ;;
    esac
  done < <(
    printf '%s\n' "${principles_line}" |
      sed -E 's/^\*\*Principles:\*\*[[:space:]]*//' |
      tr ',' '\n' |
      sed -E 's/^[[:space:]]+|[[:space:]]+$//g'
  )
done

# --- capabilities referenced in playbooks ---
CAPABILITIES_FILE="${KMODE_DIR}/hosts/capabilities.md"
need_file "${CAPABILITIES_FILE}"
allowed_capabilities="$(
  sed -n '/^| Capability |/,/^$/p' "${CAPABILITIES_FILE}" |
    grep -oE '\`[a-zA-Z]+\`' |
    tr -d '`' |
    sort -u |
    tr '\n' ' '
)"
while IFS= read -r -d '' playbook_path; do
  capabilities_line="$(grep -E '^\*\*Capabilities:\*\*' "${playbook_path}" || true)"
  [[ -z "${capabilities_line}" ]] && continue
  # extract backtick names
  while IFS= read -r capability; do
    [[ -z "${capability}" ]] && continue
    case " ${allowed_capabilities} " in
      *" ${capability} "*) ;;
      *) fail "${playbook_path}: unknown capability \`${capability}\`" ;;
    esac
  done < <(printf '%s\n' "${capabilities_line}" | grep -oE '\`[a-zA-Z]+\`' | tr -d '`')
done < <(find "${KMODE_DIR}/playbooks" -name '*.md' -print0)

# --- host-specific terms forbidden in core ---
CORE_PATHS=(
  "${KMODE_DIR}/playbooks"
  "${KMODE_DIR}/principles"
  "${KMODE_DIR}/contracts.md"
  "${KMODE_DIR}/orchestration"
)
FORBIDDEN_PATTERNS=(
  'CreateGoal'
  'SwitchMode'
  'CreatePlan'
  'Task tool'
  'is_background'
  'spawn_agent'
  'wait_agent'
  'resume_agent'
  'AskQuestion'
  'AskUserQuestion'
  'subagent_type'
)
for core_path in "${CORE_PATHS[@]}"; do
  [[ -e "${core_path}" ]] || continue
  for forbidden_pattern in "${FORBIDDEN_PATTERNS[@]}"; do
    while IFS= read -r line; do
      [[ -z "${line}" ]] && continue
      fail "host-specific term in core: ${line}"
    done < <(grep -R -n --include='*.md' -E "${forbidden_pattern}" "${core_path}" || true)
  done
done

# --- hosts ---
for host_file in capabilities.md cursor.md claude.md codex.md openai.yaml; do
  need_file "${KMODE_DIR}/hosts/${host_file}"
done

# Every host profile must map every capability required by a playbook.
for host in cursor.md claude.md codex.md; do
  host_path="${KMODE_DIR}/hosts/${host}"
  while IFS= read -r capability; do
    [[ -z "${capability}" ]] && continue
    grep -Fq "\`${capability}\`" "${host_path}" || fail "${host_path}: missing capability \`${capability}\`"
  done < <(
    grep -hE '^\*\*Capabilities:\*\*' "${KMODE_DIR}"/playbooks/*.md |
      grep -oE '\`[a-zA-Z]+\`' |
      tr -d '`' |
      sort -u
  )
done

# --- fixtures ---
need_file "${KMODE_DIR}/fixtures/routes.md"
for playbook_id in "${PLAYBOOK_IDS[@]}"; do
  grep -qE "[|\`]${playbook_id}[|\` ]" "${KMODE_DIR}/fixtures/routes.md" || grep -q "${playbook_id}" "${KMODE_DIR}/fixtures/routes.md" || fail "fixtures: playbook ${playbook_id} not mentioned"
done

fixture_routes="$(
  awk -F '|' '
    NR > 2 {
      route = $3
      gsub(/^[[:space:]]+|[[:space:]]+$/, "", route)
      if (route != "") print route
    }
  ' "${KMODE_DIR}/fixtures/routes.md"
)"
last_fixture_line=0
for playbook_id in "${PLAYBOOK_IDS[@]}"; do
  fixture_line="$(printf '%s\n' "${fixture_routes}" | awk -v route="${playbook_id}" '$0 == route { print NR; exit }')"
  [[ -n "${fixture_line}" ]] || {
    fail "fixtures: missing exact route row '${playbook_id}'"
    continue
  }
  if (( fixture_line <= last_fixture_line )); then
    fail "fixtures: route '${playbook_id}' is out of precedence order"
  fi
  last_fixture_line="${fixture_line}"
done

# --- kmode dispatcher names all playbooks ---
for playbook_id in "${PLAYBOOK_IDS[@]}"; do
  grep -q "\`${playbook_id}\`" "${KMODE_DIR}/SKILL.md" || fail "kmode SKILL.md missing route \`${playbook_id}\`"
done

dispatcher_routes="$(
  awk '
    /^1\. `pause`/ { capture=1 }
    capture && /^[0-9]+\. `/ {
      line=$0
      sub(/^[0-9]+\. `/, "", line)
      sub(/`.*/, "", line)
      print line
      next
    }
    capture && !/^[0-9]+\. `/ { exit }
  ' "${KMODE_DIR}/SKILL.md"
)"
expected_routes="$(printf '%s\n' "${PLAYBOOK_IDS[@]}")"
if [[ "${dispatcher_routes}" != "${expected_routes}" ]]; then
  fail "kmode SKILL.md precedence differs from validator route order"
fi

# --- relative Markdown links ---
while IFS= read -r -d '' markdown_path; do
  while IFS= read -r link_target; do
    [[ -z "${link_target}" ]] && continue
    case "${link_target}" in
      \#*|/*|*://*|mailto:*) continue ;;
    esac
    link_path="${link_target%%#*}"
    link_path="${link_path%%\?*}"
    [[ -e "$(dirname "${markdown_path}")/${link_path}" ]] ||
      fail "${markdown_path}: broken relative link '${link_target}'"
  done < <(
    grep -oE '\]\([^)]+' "${markdown_path}" |
      sed -E 's/^\]\(//' ||
      true
  )
done < <(find "${ENGINEERING_DIR}" -name '*.md' -print0)

if (( FAILURE_COUNT > 0 )); then
  printf 'validate-kmode: %s failure(s)\n' "${FAILURE_COUNT}" >&2
  exit 1
fi
printf 'validate-kmode: ok\n'
exit 0
