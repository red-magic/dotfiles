export ENV="$HOME"/.profile

setxkbmap -layout "us,ru" -option "grp:caps_toggle"

#xrandr -s 1920x1080
#xsetroot -solid grey27
#xset -dpms # Mouse acceleration fix
#xset s off # Disable screensaver
#xmodmap -e "pointer = 1 2 3 4 5 6 7 0 9 10 11 12" # Mouse wheel fix for Firefox
#redshift -l 55.0:73.3 -t 2700:3000 > /dev/null 2>&1 &
#oneko -fg black -bg white -sakura &
#feh --bg-scale pics/de_prodigy.jpg
#emacs --daemon

exec cwm
