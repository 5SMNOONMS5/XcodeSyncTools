#!/bin/sh

version="0.7.0"

#default config

# change to your own (ex: gitub, bitcket....etc)
path_source_url="git@github.com:5SMNOONMS5/XcodeSyncTools.git"

src1="${HOME}/Library/Developer/Xcode/Templates/File Templates"
src1_local="File Templates"

src2="${HOME}/Library/Developer/Xcode/UserData/CodeSnippets"
src2_local="CodeSnippets"

# I will make colorful console output in the future
declare -a colors
colors[2]=33                  # yellow text
colors[4]=32                  # green text
colors[8]=34                  # blue text
colors[16]=36                 # cyan text
colors[32]=35                 # purple text
colors[64]="33m\033[7"        # yellow background
colors[128]="32m\033[7"       # green background
colors[256]="34m\033[7"       # blue background
colors[512]="36m\033[7"       # cyan background
colors[1024]="35m\033[7"      # purple background
colors[2048]="31m\033[7"      # red background (won with default target)

# check path
check() {
	# Thanks to https://askubuntu.com/questions/648577/copying-files-from-directories-having-spaces-in-its-name
  echo $(basename $1)
	if [ ! -d "$1" ]; then
		echo "$(basename $1) path not found, create a new one"
  else 
    echo "$(basename $1) already exist, duplicate a $(basename $1)_old folder"
    if [ -d "$1_old" ]; then 
      echo "has $1_old remove old version first"
      rm -rf "$1_old"
    fi
    mv "$1" "$1_old"
	fi
  mkdir "$1"
}

# Usage info
usage() {
  cat <<EOF
  Usage: 

  	sh xcode-sync.sh [options]

  Options:
    -v, --version    Output version.
    -s, --sync     	 Sync code snippet and start fsevents-tools.
    -w, --watch      Observer the folder change.
    -c, --change     Change remote git URL to your own repo.
    -t, --test       Test script, don't use this. 
    -h, --help       This message.
    --               End of options
EOF
}

# close Xcode project
close_xcode () {

  declare isXocdeOpen="$(ps aux | grep Xcode.app | wc -l | awk '{ print $1 }')"
  if [ "$isXocdeOpen" == "1" ]; then 
    # xcode not open, return this function
    return
  fi 

  # if xcode open, quit it first
	echo "In order to renew snippets, it will quit xcode first, please press [y/n] to proceed:"
	read response

	if [ "$response" == "y" ]; then
		# Thanks to http://osxdaily.com//09/05/gracefully-quit-application-command-line/
		osascript -e 'quit app "Xcode"'
	else
		echo "Goodbye 88"
		exit 1
	fi
}

# Embed fsevents-tools as submodule
updateSubmodule () {

    declare isGitRepo="$(git rev-parse --is-inside-work-tree)"
    # Thanks to https://stackoverflow.com/questions/2180270/check-if-current-directory-is-a-git-repository
    if [ ! "$isGitRepo" ]; then
        echo "Currently working directory is not git repositories"
        exit 1
    fi

    echo "Submodule update"
    git submodule update --init
    cd fsevents-tools
    sh autogen.sh
    cd ..
}

# open Xcode project
open_xcode () {
	 open -a Xcode
}

# Sync Code-snippets
syncCodeSnippets () {
    echo "Sync xcode snippets"
    check "$src2"
    cp -r "$src2_local"/* "$src2"
}

# Sync file-template
syncFileTemplates () {
  	echo "Sync xcode file template"
  	check "$src1"
  	cp -r "$src1_local"/* "$src1"
}

changeGitRemoteURL () {
    echo "Change remote git repo to "$path_source_url", remember to customize your .gitignore"
    git remote set-url origin $path_source_url
}

# Watch the folder change
watchFolder () {

    # Thanks to https://askubuntu.com/questions/476041/how-do-i-make-rsync-delete-files-that-have-been-deleted-from-the-source-folder
    declare local_source1="$(pwd)"/"$src1_local"
    declare rsync1=("rsync --exclude=.DS_Store -vrulptg "$src1/" "$local_source1" --delete")

    declare local_source2="$(pwd)"/"$src2_local"
    declare rsync2=("rsync --exclude=.DS_Store -vrulptg "$src2/" "$local_source2" --delete")

    cd fsevents-tools
    ./notifyloop ${src1}/ ${src2}/ "${rsync1}" "${rsync2}"
}

testFunc () {
    echo "testFunc"
}

# parse options
while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do
  case $1 in
    -v | --version )
      echo $version
      exit 1
      ;;
    -s | --sync )
      # updateSubmodule
      close_xcode
      syncCodeSnippets
      syncFileTemplates
      open_xcode
      watchFolder
      exit 1
      ;;
    -w | --watch )
      watchFolder
      exit 1
      ;;
    -c | --chagne )
      changeGitRemoteURL
      exit 1
      ;;
    -t | --test )
      # check "$src2"
      exit 1
      ;;
    -h | --help | * )
      usage
      exit 1
      ;;
  esac
  shift
done
if [[ "$1" == "--" ]]; then shift; fi


