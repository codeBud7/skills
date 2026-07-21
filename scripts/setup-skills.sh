#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

DRY_RUN=0
FORCE=0
TOOL=""
DEST=""
INSTALL_ALL=0
CONFLICT_COUNT=0

usage() {
  cat <<'EOF'
Install skills from this repo into agent tool homes via flat symlinks.

Usage:
  ./scripts/setup-skills.sh --tool cursor|claude|agents
  ./scripts/setup-skills.sh --dest PATH
  ./scripts/setup-skills.sh --all
  ./scripts/setup-skills.sh --help

Options:
  --tool TOOL   Install to a known tool home:
                  cursor -> ~/.cursor/skills
                  claude -> ~/.claude/skills
                  agents -> ~/.agents/skills
  --dest PATH   Install to an arbitrary skills directory
  --all         Install to all known tool homes
  --dry-run     Print planned actions without changing anything
  --force       Replace conflicting entries at managed skill names
  --help        Show this help

Each skill is installed flat:
  <dest>/<skill-name> -> <repo>/<collection>/<skill-name>

Only folders containing SKILL.md under engineering/, management/, and productivity/ are installed.

Exit status:
  0  success — all planned links installed or already correct; at least one skill discovered
  1  usage/selector error, zero skills discovered, or unresolved conflicts (including --dry-run)
EOF
}

log() {
  printf '%s\n' "$*"
}

warn() {
  printf 'warning: %s\n' "$*" >&2
}

die() {
  printf 'error: %s\n' "$*" >&2
  exit 1
}

record_conflict() {
  CONFLICT_COUNT=$((CONFLICT_COUNT + 1))
}

expand_home() {
  local path="$1"
  if [[ "${path}" == "~" ]]; then
    printf '%s\n' "${HOME}"
  elif [[ "${path:0:2}" == "~/" ]]; then
    printf '%s/%s\n' "${HOME}" "${path:2}"
  else
    printf '%s\n' "${path}"
  fi
}

tool_dest() {
  case "$1" in
    cursor) expand_home "~/.cursor/skills" ;;
    claude) expand_home "~/.claude/skills" ;;
    agents) expand_home "~/.agents/skills" ;;
    *) die "unknown tool: $1" ;;
  esac
}

expected_target() {
  local collection="$1"
  local skill="$2"
  printf '%s/%s/%s' "${REPO_ROOT}" "${collection}" "${skill}"
}

collect_skills() {
  local collection skill_dir skill_name
  for collection in engineering management productivity; do
    [[ -d "${REPO_ROOT}/${collection}" ]] || continue
    for skill_dir in "${REPO_ROOT}/${collection}"/*; do
      [[ -d "${skill_dir}" ]] || continue
      [[ -f "${skill_dir}/SKILL.md" ]] || continue
      skill_name="$(basename "${skill_dir}")"
      printf '%s\t%s\n' "${collection}" "${skill_name}"
    done
  done
}

prepare_destination() {
  local dest="$1"

  if [[ -L "${dest}" ]]; then
    if (( FORCE )); then
      if (( DRY_RUN )); then
        log "would remove destination symlink: ${dest}"
      else
        rm "${dest}"
      fi
    elif (( DRY_RUN )); then
      warn "${dest} is a symlink (whole-repo link?); use --force to replace it with a directory"
      record_conflict
      return 1
    else
      die "${dest} is a symlink (whole-repo link?). Re-run with --force to replace it with a directory."
    fi
  fi

  if [[ ! -e "${dest}" ]]; then
    if (( DRY_RUN )); then
      log "would create directory: ${dest}"
    else
      mkdir -p "${dest}"
    fi
  elif [[ ! -d "${dest}" ]]; then
    die "${dest} exists and is not a directory"
  fi
}

install_skill_link() {
  local dest="$1"
  local collection="$2"
  local skill="$3"
  local link_path="${dest}/${skill}"
  local target
  target="$(expected_target "${collection}" "${skill}")"

  if [[ -L "${link_path}" ]]; then
    local current
    current="$(readlink "${link_path}")"
    if [[ "${current}" == "${target}" ]]; then
      log "ok ${link_path} -> ${target}"
      return 0
    fi
    if (( FORCE )); then
      if (( DRY_RUN )); then
        log "would replace symlink: ${link_path} -> ${target}"
      else
        rm "${link_path}"
        ln -s "${target}" "${link_path}"
        log "linked ${link_path} -> ${target}"
      fi
      return 0
    fi
    warn "skip ${link_path}: symlink points elsewhere (${current})"
    record_conflict
    return 1
  fi

  if [[ -e "${link_path}" ]]; then
    if (( FORCE )); then
      if (( DRY_RUN )); then
        log "would replace ${link_path} with symlink -> ${target}"
      else
        rm -rf "${link_path}"
        ln -s "${target}" "${link_path}"
        log "linked ${link_path} -> ${target}"
      fi
      return 0
    fi
    warn "skip ${link_path}: path exists and is not the expected symlink"
    record_conflict
    return 1
  fi

  if (( DRY_RUN )); then
    log "would link ${link_path} -> ${target}"
  else
    ln -s "${target}" "${link_path}"
    log "linked ${link_path} -> ${target}"
  fi
}

install_to_dest() {
  local dest="$1"
  local expanded
  local skills skill_count=0
  expanded="$(expand_home "${dest}")"
  CONFLICT_COUNT=0

  log "installing skills into ${expanded}"

  skills="$(collect_skills)"
  if [[ -z "${skills}" ]]; then
    die "no skills discovered under engineering/, management/, or productivity/"
  fi

  prepare_destination "${expanded}" || true

  while IFS=$'\t' read -r collection skill; do
    [[ -n "${collection}" ]] || continue
    skill_count=$((skill_count + 1))
    install_skill_link "${expanded}" "${collection}" "${skill}" || true
  done <<< "${skills}"

  if (( skill_count == 0 )); then
    die "no skills discovered under engineering/, management/, or productivity/"
  fi

  if (( CONFLICT_COUNT > 0 )); then
    return 1
  fi
  return 0
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --tool)
      [[ $# -ge 2 ]] || die "--tool requires an argument"
      TOOL="$2"
      shift 2
      ;;
    --dest)
      [[ $# -ge 2 ]] || die "--dest requires an argument"
      DEST="$2"
      shift 2
      ;;
    --all)
      INSTALL_ALL=1
      shift
      ;;
    --dry-run)
      DRY_RUN=1
      shift
      ;;
    --force)
      FORCE=1
      shift
      ;;
    --help|-h)
      usage
      exit 0
      ;;
    *)
      die "unknown argument: $1 (use --help)"
      ;;
  esac
done

if (( INSTALL_ALL )) && [[ -n "${TOOL}" || -n "${DEST}" ]]; then
  die "--all cannot be combined with --tool or --dest"
fi

if [[ -n "${TOOL}" && -n "${DEST}" ]]; then
  die "use either --tool or --dest, not both"
fi

if (( INSTALL_ALL )); then
  exit_code=0
  for preset in cursor claude agents; do
    if ! install_to_dest "$(tool_dest "${preset}")"; then
      exit_code=1
    fi
  done
  exit "${exit_code}"
fi

if [[ -n "${TOOL}" ]]; then
  case "${TOOL}" in
    cursor|claude|agents) ;;
    *) die "unknown tool: ${TOOL} (expected cursor, claude, or agents)" ;;
  esac
  install_to_dest "$(tool_dest "${TOOL}")"
  exit 0
fi

if [[ -n "${DEST}" ]]; then
  install_to_dest "${DEST}"
  exit 0
fi

usage >&2
exit 1
