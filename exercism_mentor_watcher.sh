#!/bin/bash

# Assuming the dockerfile is in the same dir as the script
# Courtesy of : https://stackoverflow.com/a/630645/7235297
function getScriptPath() {
	prg=$0

	if [ ! -e "$prg" ]; then
	  case $prg in
	    (*/*) exit 1;;
	    (*) prg=$(command -v -- "$prg") || exit;;
	  esac
	fi

	dir=$(
	  cd -P -- "$(dirname -- "$prg")" && pwd -P
	) || exit
}

# Run docker build in a new terminal
function dockerRun() {
	getScriptPath
	command="docker build --build-arg token=$token --build-arg trackId=$uuid $dir/exercism_docker_c/ --no-cache"
	gnome-terminal -x sh -c "printf \"\e]2;EXERCISM\a\";$command; bash"
}

# Watches the clipboard and matches the string simiral to the one you copy on an exercise
function watch() {
	while true
	do
	CLIPBOARD=$(xsel)
		if [[ $CLIPBOARD =~ "exercism download --uuid="[a-zA-Z0-9]+ ]]; then
			uuid=${CLIPBOARD#"exercism download --uuid="}
			dockerRun
			$(xsel -c)
		fi
	sleep 2
	done
}

# The argument beign your exercism token
if [[ $# -eq 1 ]]
then
	token=$1
elif [[ $# -eq 0 ]]
then
	token=$EXERCISM_MENTOR_TOKEN
else
	echo "Either pass one argument being the exercism token, or nothing to use EXERCISM_MENTOR_TOKEN from your env"
	exit 1
fi
watch
