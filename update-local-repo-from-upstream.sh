#!/bin/sh
source ./scripts\ source/color.sh

echo "${GREENCOLOR} Start synchronize remote repository"

git fetch upstream

git merge upstream/master
