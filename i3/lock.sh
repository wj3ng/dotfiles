#!/bin/bash

scrot /tmp/screen.png

convert /tmp/screen.png -blur 0x8 /tmp/screen.png
[[ -f ~/.config/i3/lock.png ]] && convert /tmp/screen.png ~/.config/i3/lock.png -gravity center -composite /tmp/screen.png
i3lock -u -e -i /tmp/screen.png
