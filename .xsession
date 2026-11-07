#!/bin/sh

. "$HOME/.profile"

setxkbmap -layout "us,ru" -option "grp:caps_toggle"
feh --bg-scale --no-fehbg "$HOME/.wallpaper.jpg"
emacs -nw --bg-daemon

xbindkeys

exec cwm
