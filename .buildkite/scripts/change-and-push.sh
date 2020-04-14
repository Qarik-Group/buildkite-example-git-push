#!/bin/bash

set -euo pipefail

# shellcheck disable=SC1091
source .buildkite/scripts/git-helpers.sh
git_clone

echo "--- :date: bump datestamp"

date +%s > datestamp

echo "--- :git: git commit"

git add datestamp
git commit -m "Bump datestamp during CI"

echo "--- :git: git push"
git pull --rebase
git push
