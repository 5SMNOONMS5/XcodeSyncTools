#!/bin/sh

PLATFORM=$@
PLATFORM=`echo "$PLATFORM" | tr '[A-Z]' '[a-z]'`

## declare an array contains supported application
declare -a APPLICATIONS=("xcode" "atom")

## declare an array contains supported application directories
# declare -a DIRECTORIES=("~/Library/Developer/Xcode/UserData/CodeSnippets" "~/.atom/snippets.cson")

PATHXCODE=~/Library/Developer/Xcode/UserData/CodeSnippets
PATHATOM=~/.atom/snippets.cson

#========================= xcode =========================

if [ "$PLATFORM" == "${APPLICATIONS[0]}" ]; then

  echo "start working with Xcode snippet"

  if [ -d "$PATHXCODE" ]; then

    rm ${PATHXCODE}/*.codesnippet

    cp ./xcode/* ${PATHXCODE}

    echo "success update sinppet into ${PATHXCODE}"

  else

    echo "\"BUT\" ${PATHXCODE} doesn't exist "

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
