#!/usr/bin/env bash

part=${DEFAULT_BUMP:-patch}


/app/bin/bump2version "$part" --verbose

raw_output=$(bumpversion --list "$part" --dry-run)

old_version=$(echo "$raw_output" | grep -o 'current_version=\S*' | cut -d= -f2)
new_version=$(echo "$raw_output" | grep -o 'new_version=\S*' | cut -d= -f2)

echo ::set-output name=old_ver::"$old_version"
echo ::set-output name=new_ver::"$new_version"
echo ::set-output name=part::"$part"

echo "Semantic Version Part to Bump: $part"
echo "Current Version: $old_version"
echo "New Version: $new_version"
