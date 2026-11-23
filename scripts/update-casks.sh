#!/usr/bin/env bash
set -euo pipefail

tap=${1:?Usage: bash scripts/update-casks.sh owner/tap}
updates=$(brew livecheck --cask --tap "$tap" --full-name --json | jq -r '
  if length == 0 then error("No casks found; check the tap and its trust")
  elif any(.[]; .status != null and .status != "skipped") then
    error(map(select(.status != null and .status != "skipped")) | tostring)
  else .[] | select(.version.outdated == true) | [.cask, .version.latest] | @tsv
  end
')

if [[ -z "$updates" ]]; then
  echo "All checked casks are up to date."
  exit 0
fi

while IFS=$'\t' read -r cask version; do
  brew bump-cask-pr --write-only --version="$version" "$cask"
done <<< "$updates"
