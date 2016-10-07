#!/bin/sh

echo "start synchronize remote repository"

git fetch upstream

git merge upstream/master

git push

sh update.sh xcode
