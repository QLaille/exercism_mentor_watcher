#!/bin/bash

while true
do
CLIPBOARD=$(xsel)
	if [[ $CLIPBOARD =~ "exercism download --uuid="[a-zA-Z0-9]+ ]]; then
		uuid=${CLIPBOARD#"exercism download --uuid="}
		echo $uuid
		gnome-terminal -x sh -c "printf \"\e]2;EXERCISM\a\";mentor_track.sh $uuid; bash"
		$(xsel -c)
	fi
sleep 2
done