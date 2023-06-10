xset -dpms # Mouse acceleration fix
xset s off # Disable screensaver
setxkbmap -layout "us,ru" -option "grp:caps_toggle,grp_led:scroll"
redshift -l 55.0:73.4 -t 2000:2500 &> /dev/null &
xmodmap -e "pointer = 1 2 3 4 5 6 7 0 9 10 11 12" # Mouse wheel fix for Firefox
exec i3
