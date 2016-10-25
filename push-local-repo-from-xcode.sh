#!/bin/sh
#source ~/.bash_profile
#source ./scripts\ source/path.sh

#fetch all arguments via $@
message=$@


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

fi
