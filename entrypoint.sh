#!/bin/bash

echo "=========="

git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUT_EMAIL}"
git config --global --add safe.directory /github/workspace

/usr/bin/generator
npm run build

git add -A && git commit -m "Update Website"
git push --set-upstream origin main

echo "=========="
