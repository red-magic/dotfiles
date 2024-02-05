PS1='\h\$ '
EDITOR='mg -n'
#GPG_TTY=$(tty)
#VISUAL=emacs
#PAGER='less -M'
#LC_ALL=en_US.UTF-8
#LANG=en_US.UTF-8
#LC_TIME=C.UTF-8
#LESSHISTFILE=-
#VIMINIT='colorscheme desert
#	 syntax on
#	 set number
#	 set ruler
#	 set cursorline
#	 set viminfo=
#	 match errorMsg /\s\+$/
#	 hi ErrorMsg cterm=NONE ctermbg=darkred ctermfg=black
#	 hi CursorLineNr cterm=NONE ctermbg=white ctermfg=black
#	 hi CursorLine cterm=NONE ctermbg=white ctermfg=black'

export PS1 EDITOR
#export GPG_TTY VISUAL LC_ALL VIMINIT PAGER LANG LC_TIME LESSHISTFILE

alias doas='doas '
alias l='ls -plha'
alias mg='mg -n'
alias update-pkgs='doas pkg_add -vUu && doas pkg_delete -ac'
alias ssh-server='ssh -v -C -p 22 user@server.localdomain'

#set -o emacs

#if ! tty | grep -q C
#then
#	export ENV="$HOME/.profile"
#else
#	fortune | cowthink
#fi

#ssh_port=
#remote_host=
#tor_host=
#local_proxy_port=

#alias sc="ssh -v $remote_host"
#alias sp="ssh -f -N -D $local_proxy_port $remote_host"
#alias stc="ssh -v $tor_host -o 'ProxyCommand=nc -v -X 5 -x 127.0.0.1:9050 %h %p'"
#alias stc2="ssh -v -o 'ProxyCommand=nc --proxy 127.0.0.1:9050 --proxy-type socks5 %h %p' $tor_host"
#alias sc-torsocks="torsocks ssh -v $tor_host"
#alias stp="ssh -f -N -D $local_proxy_port $tor_host -o 'ProxyCommand=nc -v -X 5 -x 127.0.0.1:9050 %h %p'"
#alias sp-torsocks="torsocks ssh -v -f -N -D $local_proxy_port $tor_host"
#alias spl="ssh -v -f -N -L 127.0.0.1:$local_proxy_port:$remote_host:9050 $remote_host"
