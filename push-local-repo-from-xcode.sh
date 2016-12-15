#!/bin/sh
source ~/.bash_profile
source ./scripts\ source/path.sh
source ./scripts\ source/color.sh

message=$@

# check commit message
if [[ -z "${message}" ]]; then

  echo "${REDCOLOR} No commit mesage . Abort !"

else

  rm ./xcode/*

  echo "${GREENCOLOR} Update old codesnippet under xcode folder to newest one"

  cp ${PATHXCODE}/* ./xcode

  echo "${GREENCOLOR} Start push"

  git add -A

  git commit -m "${message}"

  git push

fi
