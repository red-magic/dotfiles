stty werase undef
bind '\C-w:backward-kill-word'
bind '\C-n:history-search-forward'
bind '\C-p:history-search-backward'
unset HISTFILE

if [[ ! -z "$(tty | grep tty)" || ! -z "$(tty | grep pts)" ]]; then
	fortune | cowsay
fi

export GPG_TTY="$(tty)"
export LESSHISTFILE="-"
export PS1="\h\$ "
export PAGER="less -M"
export GIT_EDITOR="vim"
export VIMINIT="set number | colorscheme ron | set viminfo="" | syntax on | set ruler"
alias l="ls -lha --color=always"
alias sudo="sudo -E"

alias genmirlist="sudo reflector --latest 10 --proto https --ipv4 --sort rate --save /etc/pacman.d/mirrorlist"
clean-pacman-cache() {
	if [[ -x "$(command -v yay)" ]]; then 
		echo y | yay -Scc
	fi
	echo y | sudo pacman -Scc
	echo
}

REMOTEHOST=kraimira
REMOTEDIR=/home/$USER
MNTDIR=~/$REMOTEHOST

mount-remote-host() {
	if [[ ! -d $MNTDIR  ]]; then
		mkdir -v $MNTDIR
	fi

	if [[ -z "$(ls -A $MNTDIR)" ]]; then
		sshfs -p $SSHPORT -C $USER@$REMOTEHOST:$REMOTEDIR $MNTDIR
	else
		echo "$MNTDIR directory is not empty, refusing to mount"
	fi
}

umount-remote-host() {
	fusermount3 -u $MNTDIR

	if [[ -z "$(ls -A $MNTDIR)" && -z "$(ps aux | grep sshfs | grep $REMOTEHOST)" ]]; then
		rm -rfv $MNTDIR
 	else
		echo "$MNTDIR directory is not empty or still mounted, refusing to remove"
	fi
}

TORHOST=fddskzhvzfnvsepp3l63ndt35humenufxz33ui2xbuvbpwdvaglg5qad.onion
SSHPORT=755
LOCALPROXYPORT=8080

alias sc="ssh -v -C -p $SSHPORT $USER@$REMOTEHOST"
alias sp="ssh -f -C -N -D $LOCALPROXYPORT -p $SSHPORT $USER@$REMOTEHOST"
alias stc="ssh -v -C -p $SSHPORT $USER@$TORHOST -o 'ProxyCommand=nc -v -X 5 -x 127.0.0.1:9050 %h %p'"
alias stc2="ssh -v -C -o 'ProxyCommand=nc --proxy 127.0.0.1:9050 --proxy-type socks5 %h %p' -p $SSHPORT $USER@$TORHOST" 
alias stp="ssh -f -C -N -D $LOCALPROXYPORT -p $SSHPORT $USER@$TORHOST -o 'ProxyCommand=nc -v -X 5 -x 127.0.0.1:9050 %h %p'"


if [[ -z "$(pgrep redshift)" && ! -z "$(tty | grep tty)" && -x "$(command -v redshift)" ]]; then
	redshift -l 55.0:73.4 -t 2000:2500 -m drm &> /dev/null &
fi

go-get-some-sleep() {
	if [[ $(tty | grep tty) != "" ]]; then
		sudo systemctl suspend && physlock
		else
		sudo true && i3lock -i pictures/lock.png && sudo systemctl suspend
	fi
}
