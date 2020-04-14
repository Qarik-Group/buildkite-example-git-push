#!/bin/bash

set -eu

echo "--- :date: bump datestamp"

date +%s > datestamp

echo "--- :git: git commit"

[[ -n "${BUILDKITE_BUILD_CREATOR_EMAIL}" ]] && {
  git config --global user.email "${BUILDKITE_BUILD_CREATOR_EMAIL}"
  git config --global user.name  "${BUILDKITE_BUILD_CREATOR}"
}
git config --global --get push.default || git config --global push.default simple

git add datestamp
git commit -m "Bump datestamp during CI"

echo "--- :git: git push"
git push