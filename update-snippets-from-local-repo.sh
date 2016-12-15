#!/bin/sh
source ~/.bash_profile
source ./scripts\ source/path.sh
source ./scripts\ source/color.sh

PLATFORM=$@
PLATFORM=`echo "$PLATFORM" | tr '[A-Z]' '[a-z]'`

## declare an array contains supported application
declare -a APPLICATIONS=("xcode" "atom")

#========================= xcode =========================

if [ "${PLATFORM}" == "${APPLICATIONS[0]}" ]; then

  echo "${YELLOWCOLOR} In order to renew snippets , it will quit xcode first, please press [y/n] to proceed :"

  read response

  if [ "${response}" == "y" ]; then

    kill 15 `lsof -c Xcode`

    echo "${GREENCOLOR} Start working with Xcode snippet"

    # directory not exist , create a new one
    if [[ ! -d "${PATHXCODE}" ]]; then

       echo "${GREENCOLOR} CodeSnippets directory not exist , create a new one"

       mkdir ${PATHXCODE}

    # if CodeSnippets already exis , move old code CodeSnippetsOld
    else
       echo "${GREENCOLOR} Move old sources into codeSnippetsOld directory"

       mkdir ~/Library/Developer/Xcode/UserData/CodeSnippetsOld/

       cp ${PATHXCODE}/* ~/Library/Developer/Xcode/UserData/CodeSnippetsOld
    fi

    cp ./xcode/* ~/Library/Developer/Xcode/UserData/CodeSnippets

    open -a Xcode

    echo "${GREENCOLOR} Success update sinppet into ~/Library/Developer/Xcode/UserData/CodeSnippets"

  else

    echo "${GREENCOLOR} Oh ! see you next time "
  fi

#========================= atom =========================

elif [ "$PLATFORM" == "${APPLICATIONS[1]}" ]; then

  echo "${GREENCOLOR} Current working with Atom snippet "

  if [ -d "$PATHATOM" ]; then

    echo "${REDCOLOR} Not done yet"

  else

    echo "${GREENCOLOR} ~/.atom/snippets.cson doesn't exist , please create an one "

  fi

#========================= not support yet =========================
else

  echo "${REDCOLOR} Terminate, please enter support applicatins ! ex : sh update.sh ${APPLICATIONS[1]}";

  echo "${GREENCOLOR} Current support applications : ${APPLICATIONS[@]}"

  exit

fi
