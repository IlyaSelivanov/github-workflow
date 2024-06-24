#!/bin/sh -l

results=$(echo "$@" | xargs github-workflow)
echo "results=$results" >> $GITHUB_OUTPUT
