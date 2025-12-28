#!/bin/sh

. "$HOME/.profile"

setxkbmap -layout "us,ru" -option "grp:caps_toggle"
feh --bg-scale --no-fehbg "$HOME/pics/de_prodigy.jpg"
emacs -nw --color=never --daemon
exec cwm
