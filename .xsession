#!/bin/sh

. "$HOME/.profile"

setxkbmap -layout "us,ru" -option "grp:caps_toggle"
feh --bg-scale --no-fehbg "$HOME/pics/depthcore.jpg"
! pgrep emacs && emacs -nw --color=never --daemon

xbindkeys &

exec cwm
