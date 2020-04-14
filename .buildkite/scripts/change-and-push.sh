#!/bin/bash

set -eu

echo "--- :git: setup git"

[[ -n "${BUILDKITE_BUILD_CREATOR_EMAIL}" ]] && {
  git config --global user.email "${BUILDKITE_BUILD_CREATOR_EMAIL}"
  git config --global user.name  "${BUILDKITE_BUILD_CREATOR}"
}
git config --global --get push.default || git config --global push.default simple

[[ -n "$BUILDKITE_BRANCH" ]] && {
  git checkout "${BUILDKITE_BRANCH}"
}

echo "--- :date: bump datestamp"

date +%s > datestamp

echo "--- :git: git commit"

git add datestamp
git commit -m "Bump datestamp during CI"

echo "--- :git: git push"
git push