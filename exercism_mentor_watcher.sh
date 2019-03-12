#!/bin/bash

#Assuming the dockerfile is in the same dir as the script
#Courtesy of : https://stackoverflow.com/a/630645/7235297
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
	prg=$dir/$(basename -- "$prg") || exit 
}

# Run docker build in a new terminal
function dockerRun() {
	getScriptPath
	command="sudo docker build --build-arg token=$EXERCISM_MENTOR_TOKEN --build-arg trackId=$uuid $dir --no-cache"
	gnome-terminal -x sh -c "printf \"\e]2;EXERCISM\a\";$command; bash"
}

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