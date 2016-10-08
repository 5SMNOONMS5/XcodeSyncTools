#!/bin/sh
source ~/.bash_profile

#fetch all arguments via $@
message=$@

PATHXCODE=~/Library/Developer/Xcode/UserData/CodeSnippets

# find ~/Library/Developer/Xcode/UserData/CodeSnippets/*.codesnippet -type f -exec cp {} ./xcode \;

# check commit message
if [[ -z "${message}"  ]]; then

  echo "no commit message . abort !"

else

  rm ./xcode/*

  echo "update old codesnippet under xcode folder to newest one"
  cp ${PATHXCODE}/* ./xcode

  echo "start push"
  git add -A

  git commit -m "${message}"

  git push
  echo "done"

fi
