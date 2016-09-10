#!/bin/sh


$DIRECTORY="~/Library/Developer/Xcode/UserData/CodeSnippets"

if [ -d "$DIRECTORY" ]; then

  cp swift/*.codesnippets ~/Library/Developer/Xcode/UserData/CodeSnippets

  alias cdCodeSnippet='cd ~/Library/Developer/Xcode/UserData/CodeSnippets'

  open -a finder ./

else
  echo "~/Library/Developer/Xcode/UserData/CodeSnippets doesn't exist , please create an one "
fi
