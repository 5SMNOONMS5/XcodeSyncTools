#!/bin/sh

platform=$@

## declare an array contains supported application
declare -a APPLICATIONS=("xcode" "atom")

## declare an array contains supported application directories
declare -a DIRECTORIES=(
"~/Library/Developer/Xcode/UserData/CodeSnippets"
"~/.atom/snippets.cson")

#========================= xcode =========================

if [ "$platform" == "${APPLICATIONS[0]}" ]; then

  echo "start working with Xcode snippet"

  if [ -d "${DIRECTORIES[0]}" ]; then

    CURRENT_WORKING_HOME=`pwd`

    ln -s "${CURRENT_WORKING_HOME}"/xcode/* ~/Library/Developer/Xcode/UserData/CodeSnippets

    echo "Success update sinppet in ~/Library/Developer/Xcode/UserData/CodeSnippets"

  else

    echo "~/Library/Developer/Xcode/UserData/CodeSnippets doesn't exist , please create an one "

  fi

#========================= atom =========================

elif [ "$platform" == "${APPLICATIONS[1]}" ]; then

  echo "current working with Atom snippet "

  if [ -d "${DIRECTORIES[1]}" ]; then

    CURRENT_WORKING_HOME=`pwd`

    echo "Success update sinppet "

  else

    echo "~/.atom/snippets.cson doesn't exist , please create an one "

  fi

#========================= not support yet =========================
else

  echo "terminate, please enter support applicatins ! ex : sh update.sh ${APPLICATIONS[1]}";

  echo "current support applications : ${APPLICATIONS[@]}"

  exit

fi
