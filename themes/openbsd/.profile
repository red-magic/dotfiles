# $OpenBSD: dot.profile,v 1.5 2018/02/02 02:29:54 yasuoka Exp $
#
# sh/ksh initialization

PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games:/home/mori/.local/bin
export PATH HOME TERM

if [[ $(tty | grep C) == "" ]]; then
	export ENV=$HOME/.profile
else
	fortune | cowsay
fi

export PS1="\h\$ "
export PAGER="less -M"
export GIT_EDITOR=vim
export LC_CTYPE="en_US.UTF-8"
export GPG_TTY=$(tty)
export VIMINIT="set number | colorscheme ron | set viminfo="" | syntax on | set ruler"
alias l="ls -lha"
alias np="netstat -p tcp -f inet"
alias sc="ssh -v -C -p 755 mori@kraimira"
alias sp="ssh -f -C -N -D 8080 -p 755 mori@kraimira"
alias stc="ssh -v -C -p 755 mori@fddskzhvzfnvsepp3l63ndt35humenufxz33ui2xbuvbpwdvaglg5qad.onion -o 'ProxyCommand=nc -v -X 5 -x 127.0.0.1:9050 %h %p'"
alias stp="ssh -f -C -N -D 8080 -p 755 mori@fddskzhvzfnvsepp3l63ndt35humenufxz33ui2xbuvbpwdvaglg5qad.onion -o 'ProxyCommand=nc -v -X 5 -x 127.0.0.1:9050 %h %p'"
alias dl="doas rcctl start slim && exit"
alias ds="doas rcctl stop slim"
