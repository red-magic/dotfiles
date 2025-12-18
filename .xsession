#!/bin/sh

export ENV="$HOME/.profile"

setxkbmap -layout "us,ru" -option "grp:caps_toggle"
feh --bg-scale "$HOME/pics/de_prodigy.jpg"
emacs --daemon
exec cwm
