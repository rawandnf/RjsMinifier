#!/bin/bash

# JavaScript minification command.
# @author Rawand Fatih


# The help output. Shows the help and quits the program.
function helpOutput {
	echo "- You can specify file names in a sequence:"
	echo "	- In this case all the files will be merged and compressed."
	echo "	- and the output will be script.js and script.min.js"
	echo ""
	echo "- You can specify params:"
	echo "	- [-n] followed with the output file name. Do NOT write extensions."
	echo "	- [-f] followed with the file names separated with space wrapped in double quotes [\"]"
	echo "	* THESE PARAMS ARE REQUIRED in this case."
	echo "	- User [-r] to remove the .css file automatically."
	exit
}


# Starts by checking if all the files exist. Then merges them to one single file based
# on their order in the arguments. Then posts the code to
# http://javascript-minifier.com/raw to get the code minified.
# Creates two files, the merged and compressed.
#
# @param List of all the files to be merged and minified.
function minifyCss {
	# Checking if files are provided
	if [ $# -eq 0 ]; then
  		echo "Please provide the files to minify"
	else

  		echo "Checking if all files exsist"
  
  		for f in "$@"; do
    		if [ -e $f ]; then
      			echo "$f -> File exists"
    		else 
      			echo "$f -> File does not exists"
      			echo "Script has stoped."
      			exit
    		fi
  		done 
  
  		echo ""
  		echo "Merging the files...."

  		# merging all files and making a new file.
  		jsFileName=$name$jsExtension
  		cat $@ > $jsFileName

		echo "Minifying the files...."

  		# minimising a CSS file (e.g. style.css -> style.min.css
  		minJsFileName=$name$minJsExtension
  		curl -X POST -s --data-urlencode 'input@'$jsFileName http://javascript-minifier.com/raw > $minJsFileName
  
  		echo ""
  		echo "Done!"
  		echo ""
  		echo "Two files been created"
  		echo "    $jsFileName --> merged code."
  		echo "    $minJsFileName --> merged minified code."
  		echo ""
  		echo "Process Completed!"

		if [ $removeJsFile == 1 ]; then
			rm $jsFileName
			echo ""
			echo "Removed the "$jsFileName
		fi
	fi

}


# Default merged file name.
name="script"

# Default extension for css.
jsExtension=".js"

# Default minified css extension.
minJsExtension=".min.js"

# Flags used in the program.
filesSet=0
nameSet=0
removeJsFile=0


# Looping through the 
while getopts hrf:n: o
    do
        case $o in
            h ) helpOutput;; # Show help and exit
            f ) files=$OPTARG # The files are set.
                filesSet=1;;
            n ) name=$OPTARG # The name is manually set.
            	nameSet=1;;
            r ) removeJsFile=1;; # Remove the merged file.
    esac
done


# echo $filesSet;
# echo $nameSet;


# If one of the options is set, then we shall not continuo anymore.
if ([ $filesSet == 1 ] && [ $nameSet == 0 ]) || ([ $filesSet == 0 ] && [ $nameSet = 1 ]); then
	echo "When using -n, both -n and -f should be specified"
	exit
fi

# If both are not set, Then we shall take all the parameters as file names.
if ([ $filesSet == 0 ] && [ $nameSet == 0 ]); then
	minifyCss $@
fi

# If both are set, then we should run the command based on the options.
if ([ $filesSet == 1 ] && [ $nameSet == 1 ]); then
	minifyCss $files
fi