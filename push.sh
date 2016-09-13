#!/bin/sh
source ~/.bash_profile

#fetch all arguments via $@
message=$@

if [[ $(git diff) ]]; then

  # mv new .codesnippet to ./xcode
  find ~/Library/Developer/Xcode/UserData/CodeSnippets/*.codesnippet -type f -exec mv {} ./xcode \;

  # remove all file include symbolic link and newest snippets
  rm ~/Library/Developer/Xcode/UserData/CodeSnippets/*.codesnippet



  CURRENT_WORKING_HOME=`pwd`

  # re-link again
  ln -s "$CURRENT_WORKING_HOME"/xcode/* ~/Library/Developer/Xcode/UserData/CodeSnippets

  git add -A

  git commit -m $message

  git push

else

  echo "not thing to commit , working directory clear"

  exit
fi
