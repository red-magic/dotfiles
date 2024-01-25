stty werase undef
bind '\C-w:backward-kill-word'
bind '\C-n:history-search-forward'
bind '\C-p:history-search-backward'

#GPG_TTY=$(tty)
#VISUAL=emacs
#WLR_NO_HARDWARE_CURSORS=1
PS1='\h\$ '
PAGER='less -M'
HISTFILE=
LESSHISTFILE=-
LC_TIME=C.UTF-8
EDITOR=mg
#VIMINIT='colorscheme default
#	 syntax on
#	 set number
#	 set ruler
#	 set cursorline
#	 set viminfo=
#	 match errorMsg /\s\+$/
#	 hi Visual cterm=NONE ctermbg=black ctermfg=white
#	 hi CursorLine cterm=NONE ctermbg=white ctermfg=black
#	 hi CursorLineNr cterm=NONE ctermbg=white ctermfg=black
#	 hi ErrorMsg cterm=NONE ctermbg=darkred ctermfg=black'

export PS1 PAGER HISTFILE LESSHISTFILE LC_TIME EDITOR
#export GPG_TTY VISUAL WLR_NO_HARDWARE_CURSORS VIMINIT

alias sudo='sudo -E '
alias ls='ls --color=never'
alias l='ls -plha'
alias genmirlist='sudo reflector --latest 20 --proto https --ipv4 --sort rate --save /etc/pacman.d/mirrorlist'
alias clean-pacman='clean-pacman-cache && remove-orphans'
#alias ssh-debian='TERM=xterm ssh -v -p 22 username@debian'

clean-pacman-cache() {
	if [[ -x "$(command -v yay)" ]]; then
	    yes | yay -Scc
	fi
	yes | sudo pacman -Scc
}

remove-orphans() {
	if [[ -x "$(command -v yay)" ]]; then
		yay -Qtdq | yay -Rns -
	else
		pacman -Qtdq | sudo pacman -Rns -
	fi
}

#if tty | grep -q tty || tty | grep -q pts
#then
#	fortune | cowthink
#fi

#gammastep-tty() {
#	gammastep -l 55.0:73.3 -t 2000:2500 -m drm &> /dev/null &
#}

#if [[ -z "$(pgrep gammastep)" && ! -z "$(tty | grep tty)" && -x "$(command -v gammastep)" ]]; then
#	gammastep -l 55.0:73.3 -t 2000:2500 -m drm &> /dev/null &
#fi

#ssh_port=
#remote_host=
#tor_host=
#local_proxy_port=
#remote_dir=/home/$USER
#mnt_dir=~/$remote_host

#alias sc="ssh -v $remote_host"
#alias sp="ssh -f -N -D $local_proxy_port $remote_host"
#alias stc="ssh -v $tor_host -o 'ProxyCommand=nc -v -X 5 -x 127.0.0.1:9050 %h %p'"
#alias stc2="ssh -v -o 'ProxyCommand=nc --proxy 127.0.0.1:9050 --proxy-type socks5 %h %p' $tor_host"
#alias sc-torsocks="torsocks ssh -v $tor_host"
#alias stp="ssh -f -N -D $local_proxy_port $tor_host -o 'ProxyCommand=nc -v -X 5 -x 127.0.0.1:9050 %h %p'"
#alias sp-torsocks="torsocks ssh -v -f -N -D $local_proxy_port $tor_host"
#alias spl="ssh -v -f -N -L 127.0.0.1:$local_proxy_port:$remote_host:9050 $remote_host"

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
