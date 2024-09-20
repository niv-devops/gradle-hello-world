#!/bin/bash

VERSION=$(awk -F ' = "' '/^version =/ {print $2}' build.gradle.kts | tr -d '"')
echo "Current version: $VERSION"
IFS='.' read -r major minor patch <<< "$VERSION"
new_patch=$((patch + 1))
new_version="$major.$minor.$new_patch"
echo "New version: $new_version"
echo "version=$new_version" >> $GITHUB_OUTPUT
sed -i "s/version = \".*\"/version = \"$new_version\"/" build.gradle.kts
