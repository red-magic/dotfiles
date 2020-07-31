stty werase undef
bind '\C-w:backward-kill-word'
unset HISTFILE

if [[ $- == *i* ]]; then
	bind '"\e[A": history-search-backward'
	bind '"\e[B": history-search-forward'
fi

if [[ $(pgrep redshift) == "" && $(tty) == /dev/tty* ]]; then
	redshift -l 55.0:73.4 -t 2000:2500 -m drm &> /dev/null &
fi

gogetsomesleep()
{
	if [[ $(tty | grep tty) != "" ]]; then
		sudo systemctl suspend && physlock
		else
		sudo true && i3lock -i pictures/lock.png && sudo systemctl suspend
	fi
}

if ! shopt -oq posix; then
	. /etc/bash_completion
fi

if [[ $(tty | grep tty) != "" ]]; then
	fortune | cowsay
fi

export LANG=en_US.UTF-8
export LC_CTYPE="en_US.UTF-8"
export LC_NUMERIC=ru_RU.UTF-8
export LC_TIME=ru_RU.UTF-8
export LC_COLLATE="en_US.UTF-8"
export LC_MONETARY=ru_RU.UTF-8
export LC_MESSAGES="en_US.UTF-8"
export LC_PAPER=ru_RU.UTF-8
export LC_NAME="en_US.UTF-8"
export LC_ADDRESS="en_US.UTF-8"
export LC_TELEPHONE="en_US.UTF-8"
export LC_MEASUREMENT=ru_RU.UTF-8
export LC_IDENTIFICATION="en_US.UTF-8"
export PS1='\[\033[01;34m\][\u@\h \w]\$ \[\033[00m\]'
export ALSA_CARD=Generic_1
export GPG_TTY=$(tty)
export LESSHISTFILE="-"

alias tr-auth="transmission-remote -n transmission:transmission"
alias linuxmake='make O=/usr/src/build CFLAGS="-O3 -march=znver1 -mtune=znver1 -mcpu=znver1 -pipe" -j9'
alias linuxclean='make clean && make distclean && make mrproper'
