#!/usr/bin/env bash
# Ensure this repository has GitHub Pages enabled with Actions (workflow) builds.
# Called from .github/workflows/pages.yml — no manual Settings changes required.
set -euo pipefail

: "${GITHUB_REPOSITORY:?GITHUB_REPOSITORY must be set}"

pages_api() {
  gh api "repos/${GITHUB_REPOSITORY}/pages" "$@"
}

if build_type="$(pages_api --jq '.build_type // empty' 2>/dev/null)" && [[ "${build_type}" == "workflow" ]]; then
  echo "GitHub Pages is already enabled (build_type=workflow)."
  exit 0
fi

if pages_api >/dev/null 2>&1; then
  echo "Updating GitHub Pages to build_type=workflow…"
  gh api -X PUT "repos/${GITHUB_REPOSITORY}/pages" \
    --input - <<< '{"build_type":"workflow"}'
else
  echo "Creating GitHub Pages site (build_type=workflow)…"
  gh api -X POST "repos/${GITHUB_REPOSITORY}/pages" \
    --input - <<< '{"build_type":"workflow"}'
fi

echo "GitHub Pages is configured for GitHub Actions deployment."
