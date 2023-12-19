#!/bin/sh

set -e

echo "$PWD"

sh -c "git config --global --add safe.directory $PWD"

echo "git config --global --list"
git config --global --list

echo "git config --list"
git config --list

# git remote のリストを取得し、各リモートについての URL を表示する
for remote in $(git remote); do
    echo "Remote name: $remote"
    echo "Remote URL:"
    git remote get-url "$remote"
    echo "" # 空行で区切る
done