#!/usr/bin/bash

ICON= 				# default music icon
SPOTIFY_ICON=		# spotify icon

PLAY=契				# play icon
PAUSE=				# pause icon

playerctl status &>/dev/null || exit 1

if (playerctl -l | grep spotify) &>/dev/null; then
	ICON=$SPOTIFY_ICON
fi

player_status=$(playerctl status)
player_artist=$(playerctl metadata artist)
player_title=$(playerctl metadata title)

if [[ $player_status =~ 'Playing' ]]; then
	#STATUS_ICON=$PLAY
	:
elif [[ $player_status =~ 'Paused' ]]; then
	ICON=$PAUSE
fi

echo $ICON $player_artist - $player_title
