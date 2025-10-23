#!/bin/bash

# Check if a version bump type is provided (patch, minor, major)
if [ -z "$1" ]; then
  echo "Usage: $0 <patch|minor|major>"
  exit 1
fi

# Store the bump type (patch, minor, major)
BUMP_TYPE=$1

# Read the current version from package.json
CURRENT_VERSION=$(jq -r '.version' package.json)

if [ -z "$CURRENT_VERSION" ]; then
  echo "Error: Could not find version in package.json"
  exit 1
fi

# Split the version into parts (major, minor, patch)
IFS='.' read -r MAJOR MINOR PATCH <<< "$CURRENT_VERSION"

# Increment the version based on the bump type
case $BUMP_TYPE in
  patch)
    PATCH=$((PATCH + 1))
    ;;
  minor)
    MINOR=$((MINOR + 1))
    PATCH=0
    ;;
  major)
    MAJOR=$((MAJOR + 1))
    MINOR=0
    PATCH=0
    ;;
  *)
    echo "Invalid bump type. Use 'patch', 'minor', or 'major'."
    exit 1
    ;;
esac

# Create the new version string
NEW_VERSION="$MAJOR.$MINOR.$PATCH"

# Update the version in package.json
jq --arg new_version "$NEW_VERSION" '.version = $new_version' package.json > temp.json && mv temp.json package.json

# Output the updated version
echo "Version updated to $NEW_VERSION"