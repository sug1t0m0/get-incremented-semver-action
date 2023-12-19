#!/bin/sh

set -e

input_method="${1}"

git config --global --add safe.directory $PWD

git fetch --tags

input_version=$(git tag | sort -V | tail -n1)

if [ -z "$input_version" ]; then
    input_version="0.0.0"
fi

echo "input_method=$input_method"
echo "input_version=$input_version"

command_output=$(main -v="$input_version" -m="$input_method")

echo "command_output=$command_output"

while IFS='=' read -r key value; do
    case "$key" in
        version.current)
            current_version="$value"
            ;;
        version.next)
            next_version="$value"
            ;;
        method)
            method="$value"
            ;;
        *)
            # 不要なキーは無視
            ;;
    esac
done <<EOF
$command_output
EOF

echo "currentVersion=$current_version" >> $GITHUB_OUTPUT
echo "nextVersion=$next_version" >> $GITHUB_OUTPUT
echo "method=$method" >> $GITHUB_OUTPUT
