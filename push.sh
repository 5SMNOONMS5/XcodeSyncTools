#!/bin/sh
source ~/.bash_profile

#fetch all arguments via $@
message=$@

if [[ $(git diff) ]]; then

  # check message is empty
  if [[ -z "${message}"  ]]; then

    echo "no commit message . abort !"

  else

    find ~/Library/Developer/Xcode/UserData/CodeSnippets/*.codesnippet -type f -exec cp {} ./xcode \;

    git add -A

    git commit -m "${message}"

    git push

  fi

else

  echo "not thing to commit , working directory clear"

fi
