# $OpenBSD: dot.profile,v 1.5 2018/02/02 02:29:54 yasuoka Exp $
#
# sh/ksh initialization

PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games:/home/mori/.local/bin
export PATH HOME TERM

fortune | cowsay

export PS1="\h\$ "
export PAGER="less -M"
export GIT_EDITOR=vim
export LC_ALL="en_US.UTF-8"
export LC_TIME="en_GB.UTF-8"
export GPG_TTY=$(tty)
export LESSHISTFILE="-"
export VIMINIT="set number | colorscheme ron | set viminfo="" | syntax on | set ruler"

REMOTEHOST=kraimira
TORHOST=fddskzhvzfnvsepp3l63ndt35humenufxz33ui2xbuvbpwdvaglg5qad.onion
SSHPORT=755
LOCALPROXYPORT=8080

alias l="ls -lha"
alias sc="ssh -v -C -p $SSHPORT $USER@$REMOTEHOST"
alias sp="ssh -f -C -N -D $LOCALPROXYPORT -p $SSHPORT $USER@$REMOTEHOST"
alias stc="ssh -v -C -p $SSHPORT $USER@$TORHOST -o 'ProxyCommand=nc -v -X 5 -x 127.0.0.1:9050 %h %p'"
alias stc2="ssh -v -C -o 'ProxyCommand=nc --proxy 127.0.0.1:9050 --proxy-type socks5 %h %p' -p $SSHPORT $USER@$TORHOST" 
alias stp="ssh -f -C -N -D $LOCALPROXYPORT -p $SSHPORT $USER@$TORHOST -o 'ProxyCommand=nc -v -X 5 -x 127.0.0.1:9050 %h %p'"
