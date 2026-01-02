#!/bin/sh

. "$HOME/.profile"

setxkbmap -layout "us,ru" -option "grp:caps_toggle"
feh --bg-scale --no-fehbg "$HOME/pics/de_prodigy.jpg"
! pgrep emacs >/dev/null 2>&1 && emacs -nw --color=never --daemon

exec cwm
