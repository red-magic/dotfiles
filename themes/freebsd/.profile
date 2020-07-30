export ENV=$HOME/.profile
export PS1="\$ "
export PAGER="less -M"
export LC_CTYPE="en_US.UTF-8"
export GPG_TTY=$(tty)
alias l="ls -lha"
alias np="netstat -p tcp -f inet"
alias sp="ssh -f -C -N -D 8080 mori@fddskzhvzfnvsepp3l63ndt35humenufxz33ui2xbuvbpwdvaglg5qad.onion -o 'ProxyCommand=nc -X 5 -x 127.0.0.1:9050 %h %p'"
alias sc="ssh -C mori@fddskzhvzfnvsepp3l63ndt35humenufxz33ui2xbuvbpwdvaglg5qad.onion -o 'ProxyCommand=nc -X 5 -x 127.0.0.1:9050 %h %p'"
alias tpl="doas sockstat -4 | grep _tor | wc -l"
alias tor-stat="clear && vnstat && echo && tpl"
