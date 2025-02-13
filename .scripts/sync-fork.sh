#!/bin/zsh
# Sync the forked repository with the upstream repository, both locally and on GitHub

git fetch upstream

# Determine the default branch (main or master)
if git show-ref --verify --quiet refs/remotes/upstream/main; then
    DEFAULT_BRANCH="main"
elif git show-ref --verify --quiet refs/remotes/upstream/master; then
    DEFAULT_BRANCH="master"
else
    echo "Error: Neither 'main' nor 'master' branch found in upstream"
    exit 1
fi

git checkout $DEFAULT_BRANCH
git merge upstream/$DEFAULT_BRANCH
git push origin $DEFAULT_BRANCH
