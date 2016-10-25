#!/bin/sh

PLATFORM=$@
PLATFORM=`echo "$PLATFORM" | tr '[A-Z]' '[a-z]'`

## declare an array contains supported application
declare -a APPLICATIONS=("xcode" "atom")

## declare an array contains supported application directories
# declare -a DIRECTORIES=("~/Library/Developer/Xcode/UserData/CodeSnippets" "~/.atom/snippets.cson")

PATHXCODE=~/Library/Developer/Xcode/UserData/CodeSnippets
PATHATOM=~/.atom/snippets.cso

#========================= xcode =========================

if [ "${PLATFORM}" == "${APPLICATIONS[0]}" ]; then

  echo "in order to renew snippets this will quit xcode,  press [y/n] to proceed :"

  read response

  if [ "${response}" == "y" ]; then

    kill 15 `lsof -c Xcode`

    echo "start working with Xcode snippet"

    # directory not exist , create a new one
    if [[ ! -d "${PATHXCODE}" ]]; then

       echo "codeSnippets directory not exist , create a new one"

       mkdir ${PATHXCODE}

    # if CodeSnippets already exis , move old code CodeSnippetsOld
    else
       echo "move old sources into codeSnippetsOld directory"

       mkdir ~/Library/Developer/Xcode/UserData/CodeSnippetsOld/

       cp ${PATHXCODE}/* ~/Library/Developer/Xcode/UserData/CodeSnippetsOld
    fi

    cp ./xcode/* ~/Library/Developer/Xcode/UserData/CodeSnippets

    open -a Xcode

    echo "success update sinppet into ~/Library/Developer/Xcode/UserData/CodeSnippets"

  else

    echo "oh ! see you next time "
  fi

#========================= atom =========================

elif [ "$PLATFORM" == "${APPLICATIONS[1]}" ]; then

  echo "current working with Atom snippet "

  if [ -d "$PATHATOM" ]; then

    echo "not done yet"

  else

    echo "~/.atom/snippets.cson doesn't exist , please create an one "

  fi

#========================= not support yet =========================
else

  echo "terminate, please enter support applicatins ! ex : sh update.sh ${APPLICATIONS[1]}";

  echo "current support applications : ${APPLICATIONS[@]}"

  exit

fi
