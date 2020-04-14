#!/bin/bash

set -euo pipefail
set -x

function git_clone {
  echo "--- :git: setup git"

  [[ -n "${BUILDKITE_BUILD_CREATOR_EMAIL}" ]] && {
    git config --global user.email "${BUILDKITE_BUILD_CREATOR_EMAIL}"
    git config --global user.name  "${BUILDKITE_BUILD_CREATOR}"
  }
  git config --global --get push.default >/dev/null || git config --global push.default simple

  git config --list

  echo "--- :git: clone"

  repo_url="$(git config remote.origin.url)"
  branch="${BUILDKITE_BRANCH:-$(git branch --show-current)}"
  git clone "$repo_url" -b "$branch" tmp/pushme
  cd tmp/pushme
}
