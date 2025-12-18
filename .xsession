#!/bin/sh

ENV="$HOME/.profile"
export ENV

setxkbmap -layout "us,ru" -option "grp:caps_toggle"
feh --bg-scale "$HOME/pics/de_prodigy.jpg"
emacs --daemon
exec cwm
