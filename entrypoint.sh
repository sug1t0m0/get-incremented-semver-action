#!/bin/sh

set -e

# git remote のリストを取得し、各リモートについての URL を表示する
for remote in $(git remote); do
    echo "Remote name: $remote"
    echo "Remote URL:"
    git remote get-url "$remote"
    echo "" # 空行で区切る
done