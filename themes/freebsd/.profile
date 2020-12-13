export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export GPG_TTY=$(tty)
export PS1="\h\$ "
export PAGER="less -M"
export GIT_EDITOR=vim
export VIMINIT="set number | colorscheme ron | set viminfo="" | syntax on | set ruler"
#export ENV=$HOME/.profile
#export LC_CTYPE="en_US.UTF-8"

alias l="ls -lha"
alias np="netstat -p tcp -f inet"
alias sp="ssh -f -C -N -D 8080 mori@fddskzhvzfnvsepp3l63ndt35humenufxz33ui2xbuvbpwdvaglg5qad.onion -o 'ProxyCommand=nc -X 5 -x 127.0.0.1:9050 %h %p'"
alias sc="ssh -C mori@fddskzhvzfnvsepp3l63ndt35humenufxz33ui2xbuvbpwdvaglg5qad.onion -o 'ProxyCommand=nc -X 5 -x 127.0.0.1:9050 %h %p'"
#alias tpl="doas sockstat -4 | grep _tor | wc -l"
#alias tor-stat="clear && vnstat && echo && tpl"

fortune | cowsay
