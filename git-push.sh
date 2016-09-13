#!/bin/sh
source ~/.bash_profile

#fetch all arguments via $@
message=$@

if [[ $(git diff) ]]; then

  git add -A

  git commit -m '$message'

  git push

else

  echo "not thing to commit , working directory clear"

  exit
fi
