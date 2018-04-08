#!/bin/sh

version="0.2.0"

#default config
path_source_url="git@github.com:5SMNOONMS5/XcodeSyncTools.git" # change to your own (ex: gitub, bitcket....etc)
path_xcode_custom_file=${HOME}/Library/Developer/Xcode/
path_xcode_code_snippet=${HOME}/Library/Developer/Xcode/UserData/CodeSnippets

#for colorizing numbers
declare -a colors
colors[2]=33         # yellow text
colors[4]=32         # green text
colors[8]=34         # blue text
colors[16]=36        # cyan text
colors[32]=35        # purple text
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
		mkdir "$path_xcode_code_snippet"
	fi
}

# usage info
usage() {
  cat <<EOF
  Usage: 

  	sh xcode-sync.sh [options]

  Options:
    -v, --version    Output version
    -s, --sync     	 Sync code snippet and start fsevents-tools.
    -w, --watch      Observer the folder change  
    -h, --help       This message.
    --               End of options
EOF
}

# close Xcode project
close_xcode () {

	echo "In order to renew snippets, it will quit xcode first, please press [y/n] to proceed:"
	read response

	if [ "$response" == "y" ]; then2014
		# Thanks to http://osxdaily.com//09/05/gracefully-quit-application-command-line/
		osascript -e 'quit app "Xcode"'
	else
		echo "goodbye 88"
		exit
	fi
}

# Embed fsevents-tools as submodule
updateSubmodule () {
  git submodule update --init
  sh fsevents-tools/autogen.sh
}

# open Xcode project
open_xcode () {
	open -a Xcode
}

# sync code-snippet from ./code_snippets into xcode load path
syncCodeSnippet () {
	echo "sync xcode snippets"
	check "$path_xcode_code_snippet"
	cp ./code_snippets/* "$path_xcode_code_snippet"
}

# sync custom template from ./custom_file folder into xcode load path
syncCustomFileTemplate () {
	echo "sync xcode custom file"
	check "$path_xcode_custom_file"
	cp -r ./custom_files/* "$path_xcode_custom_file"
}

watchFolder () {
  echo "Start watch the folder change via fsevents-tools"
  cd fsevents-tools
  # Thanks to https://askubuntu.com/questions/476041/how-do-i-make-rsync-delete-files-that-have-been-deleted-from-the-source-folder
  ./notifyloop /Users/stephenchen/Desktop/test1 rsync -vrulptgoD /Users/stephenchen/Desktop/test1/ /Users/stephenchen/Desktop/test2/ --delete
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
    -h | --help | * )
      usage
      exit
      ;;
  esac
  shift
done
if [[ "$1" == "--" ]]; then shift; fi




