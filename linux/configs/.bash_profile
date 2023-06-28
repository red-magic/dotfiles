stty werase undef
bind '\C-w:backward-kill-word'
bind '\C-n:history-search-forward'
bind '\C-p:history-search-backward'
unset HISTFILE

GPG_TTY=$(tty)
LESSHISTFILE=-
PS1='\h\$ '
PAGER='less -M'
GIT_EDITOR=vim
VIMINIT='set number | colorscheme ron | syntax on | set viminfo='' | set ruler'

export GPG_TTY LESSHISTFILE PS1 PAGER GIT_EDITOR VIMINIT

alias sudo='sudo -E '
alias ls='ls --color=always'
alias l='ls -plha'
alias genmirlist='sudo reflector --latest 20 --proto https --ipv4 --sort rate --save /etc/pacman.d/mirrorlist'

clean-pacman-cache() {
	if [[ -x "$(command -v yay)" ]]; then
		echo y | yay -Scc
	fi
	echo y | sudo pacman -Scc
	echo
}

remove-orphans() {
	if [[ -x "$(command -v yay)" ]]; then
		yay -Qtdq | yay -Rns -
	else
		pacman -Qtdq | sudo pacman -Rns -
	fi
}

#if [[ ! -z "$(tty | grep tty)" || ! -z "$(tty | grep pts)" ]]; then
#	fortune | cowsay
#fi

#gammastep-tty() {
#	gammastep -l 55.0:73.3 -t 2000:2500 -m drm &> /dev/null &
#}

#if [[ -z "$(pgrep gammastep)" && ! -z "$(tty | grep tty)" && -x "$(command -v gammastep)" ]]; then
#	gammastep -l 55.0:73.3 -t 2000:2500 -m drm &> /dev/null &
#fi

#remote_host=
#remote_dir=/home/$USER
#mnt_dir=~/$remote_host
#tor_host=
#ssh_port=
#local_proxy_port=

#alias sc='ssh -v -C -p $ssh_port $USER@$remote_host'
#alias sp='ssh -f -C -N -D $local_proxy_port -p $ssh_port $USER@$remote_host'
#alias stc='ssh -v -C -p $ssh_port $USER@$tor_host -o 'ProxyCommand=nc -v -X 5 -x 127.0.0.1:9050 %h %p''
#alias stc2='ssh -v -C -o 'ProxyCommand=nc --proxy 127.0.0.1:9050 --proxy-type socks5 %h %p' -p $ssh_port $USER@$tor_host'
#alias stp='ssh -f -C -N -D $local_proxy_port -p $ssh_port $USER@$tor_host -o 'ProxyCommand=nc -v -X 5 -x 127.0.0.1:9050 %h %p''

#mount-remote-host() {
#	if [[ ! -d $mnt_dir  ]]; then
#		mkdir -v $mnt_dir
#	fi
#
#	if [[ -z "$(ls -A $mnt_dir)" ]]; then
#		sshfs -p $ssh_port -C $USER@$remote_host:$remote_dir $mnt_dir
#	else
#		echo "$mnt_dir directory is not empty, refusing to mount"
#	fi
#}

#umount-remote-host() {
#	fusermount3 -u $mnt_dir
#
#	if [[ -z "$(ls -A $mnt_dir)" && -z "$(ps aux | grep sshfs | grep $remote_host)" ]]; then
#		rm -rfv $mnt_dir
# 	else
#		echo "$mnt_dir directory is not empty or still mounted, refusing to remove"
#	fi
#}

#go-get-some-sleep() {
#	if [[ $(tty | grep tty) != "" ]]; then
#		sudo systemctl suspend && physlock
#		else
#		sudo true && i3lock -i pictures/lock.png && sudo systemctl suspend
#	fi
#}
