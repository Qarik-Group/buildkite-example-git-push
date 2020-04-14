# Buildkite Example - git push

This repo includes an example for a Buildkite step adding a new `git commit` and then doing a `git push`.

[![Add to Buildkite](https://buildkite.com/button.svg)](https://buildkite.com/new)

![sample](https://p198.p4.n0.cdn.getcloudapp.com/items/Jrubzlrd/Screen%20Shot%202020-04-15%20at%208.30.36%20am.png?v=cfef6d580f967d9deb4aa59c5f3779be)

The [`change-and-push.sh`](https://github.com/starkandwayne/buildkite-example-git-push/blob/master/.buildkite/scripts/change-and-push.sh) script creates a fresh clone of the currently built repo and branch. I am doing this because the default `git fetch` performed by a `buildkite-agent` is `git fetch -v --prune` and `git checkout -f <sha>` which loses the git history required for subsequent pushing of new commits.
