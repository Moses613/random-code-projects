#!/bin/bash

#script for printing current playing song in rhythmbox inside cowsay's speech bubble
#depends on rhythmbox and cowsay being installed
#script by me Jan 1 2024

CURRENT_SONG=$(rhythmbox-client --print-playing)

#checks if a song is playing, then prints initial cow to screen, otherwise displays message

if [ "$CURRENT_SONG" != " - " ];
then
	clear
	cowsay `echo "NOW PLAYING:" && rhythmbox-client --print-playing`
else
	echo "No song currently playing"
	echo "Opening RhythmBox..."
	echo
	echo "Queue a song with the 'queue' alias or type 'play' to start playing from the beginning of the RhythmBox library"
	exit 1
fi


#checks (every 3 seconds) if song has changed and updates cow accordingly
while (true);
	if [ "$CURRENT_SONG" != "$(rhythmbox-client --print-playing)" ];
	then 
		clear
		cowsay `echo "NOW PLAYING:" && rhythmbox-client --print-playing`
		CURRENT_SONG=$(rhythmbox-client --print-playing)
	fi
do sleep 3;
done
