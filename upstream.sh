#!/bin/sh

echo "start synchronize remote repository"

git fetch upstream

git merge upstream/master
