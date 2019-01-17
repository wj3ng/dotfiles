#!/usr/bin/env bash

caps=' '
num=''

if (xset q | grep 'Caps Lock:   on') &>/dev/null; then
	caps='ﮰ '
fi

if (xset q | grep 'Num Lock:    on') &>/dev/null; then
	num=''
fi

echo "$caps $num"
