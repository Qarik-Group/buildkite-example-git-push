#!/bin/bash

set -euo pipefail

# shellcheck disable=SC1091
source .buildkite/scripts/git-helpers.sh
git_clone

echo "--- :date: bump datestamp"
(
  set -x
  date +%s > datestamp
)

echo "--- :git: git commit"
(
  set -x

  git add datestamp
  git commit -m "Bump datestamp during CI"
)

echo "--- :git: git push"
(
  set -x
  git pull --rebase
  git push
)
