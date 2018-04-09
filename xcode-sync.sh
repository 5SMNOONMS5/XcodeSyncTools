#!/bin/sh

version="0.4.0"

#default config

# change to your own (ex: gitub, bitcket....etc)
path_source_url="git@github.com:5SMNOONMS5/XcodeSyncTools.git"

path_xcode_file_template=${HOME}/Library/Developer/Xcode/Templates
path_local_file_template=Templates

path_xcode_code_snippet=${HOME}/Library/Developer/Xcode/UserData/CodeSnippets
path_local_code_snippet=CodeSnippets


#for colorizing numbers
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
	if [ ! -d "$1" ]; then
		echo "$1 path not found, create a new one"
		mkdir "$1"
	fi
}

# usage info
usage() {
  cat <<EOF
  Usage: 

  	sh xcode-sync.sh [options]

  Options:
    -v, --version    Output version.
    -s, --sync     	 Sync code snippet and start fsevents-tools.
    -w, --watch      Observer the folder change.
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
		exit
	fi
}

# Embed fsevents-tools as submodule
updateSubmodule () {
    # Temp: 先確認有沒有 init 之後應該改成還要判斷有沒有新版本
    declare isSubmoduleInit="$(find ./fsevents-tools -print | wc -l | awk '{ print $1 }')"

    if [ "$isSubmoduleInit" != "0" ]; then
        echo "Already init submodule, skip this."
        return
    fi

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
syncCodeSnippet () {
    echo "Sync xcode snippets"
    check "$path_xcode_code_snippet"
    cp -r "$path_local_code_snippet" "$path_xcode_code_snippet"
}

# Sync file-template
syncCustomFileTemplate () {
  	echo "Sync xcode custom file"
  	check "$path_xcode_file_template"
  	cp -r "$path_local_file_template" "$path_xcode_file_template"
}

# Watch the folder change
watchFolder () {
    echo "Start watch $path_xcode_code_snippet change via fsevents-tools"
    cd fsevents-tools
    # Thanks to https://askubuntu.com/questions/476041/how-do-i-make-rsync-delete-files-that-have-been-deleted-from-the-source-folder
    ./notifyloop "$path_xcode_code_snippet" rsync -vrulptgoD "$path_xcode_code_snippet"/ ../"$path_xcode_code_snippet" --delete
}

testFunc () {

    echo "testFunc"
}

# parse options
while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do
  case $1 in
    -v | --version )
      echo $version
      exit
      ;;
    -s | --sync )
      close_xcode
      syncCodeSnippet
      syncCustomFileTemplate
      open_xcode
      updateSubmodule
      watchFolder
      exit
      ;;
    -w | --watch )
      watchFolder
      exit
      ;;
    -t | --test )
      testFunc
      exit
      ;;
    -h | --help | * )
      usage
      exit
      ;;
  esac
  shift
done
if [[ "$1" == "--" ]]; then shift; fi




