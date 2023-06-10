GPG_TTY=$(tty)
PS1='\h\$ '
PAGER='less -M'
GIT_EDITOR=vim
LC_ALL=en_US.UTF-8
LC_TIME=en_GB.UTF-8
LANG=en_US.UTF-8
LESSHISTFILE=-
VIMINIT='set number | colorscheme ron | set viminfo='' | syntax on | set ruler'

export GPG_TTY PS1 PAGER GIT_EDITOR LC_ALL LC_TIME LANG LESSHISTFILE VIMINIT

alias doas='doas '
alias l='ls -plha'
alias update-pkgs='doas pkg_add -vUu && doas pkg_delete -ac'

#if [[ $(tty | grep C) == "" ]]; then
#	export ENV=$HOME/.profile
#else
#	fortune | cowsay
#fi

#remote_host=
#tor_host=
#ssh_port=
#local_proxy_port=

#alias sc='ssh -v -C -p $ssh_port $USER@$remote_host'
#alias sp='ssh -f -C -N -D $local_proxy_port -p $ssh_port $USER@$remote_host'
#alias stc='ssh -v -C -p $ssh_port $USER@$tor_host -o 'ProxyCommand=nc -v -X 5 -x 127.0.0.1:9050 %h %p''
#alias stc2='ssh -v -C -o 'ProxyCommand=nc --proxy 127.0.0.1:9050 --proxy-type socks5 %h %p' -p $ssh_port $USER@$tor_host'
#alias stp='ssh -f -C -N -D $local_proxy_port -p $ssh_port $USER@$tor_host -o 'ProxyCommand=nc -v -X 5 -x 127.0.0.1:9050 %h %p''
