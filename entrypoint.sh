#!/usr/bin/env bash

set -ex

part=${DEFAULT_BUMP:-patch}


raw_output=$(/app/bin/bump2version --list "$part" --dry-run)

old_version=$(echo "$raw_output" | grep -o 'current_version=\S*' | cut -d= -f2)
new_version=$(echo "$raw_output" | grep -o 'new_version=\S*' | cut -d= -f2)

/app/bin/bump2version "$part" --verbose

echo old_ver=$old_version >> $GITHUB_ENV
echo new_ver=$new_version >> $GITHUB_ENV
echo part=$part >> $GITHUB_ENV

echo "Semantic Version Part to Bump: $part"
echo "Current Version: $old_version"
echo "New Version: $new_version"
