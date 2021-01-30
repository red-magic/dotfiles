stty werase undef
bind '\C-w:backward-kill-word'
unset HISTFILE

if [[ $- == *i* ]]; then
	bind '"\e[A": history-search-backward'
	bind '"\e[B": history-search-forward'
fi

if [[ $(tty | grep tty) != "" ]]; then
	fortune | cowsay
fi

export GPG_TTY=$(tty)
export LESSHISTFILE="-"
export PS1="\h\$ "
export PAGER="less -M"
export GIT_EDITOR=vim
export VIMINIT="set number | colorscheme ron | set viminfo="" | syntax on | set ruler"
alias l="ls -lha --color=always"
alias sc="ssh -v -C -p 755 mori@kraimira"
alias sp="ssh -f -C -N -D 8080 -p 755 mori@kraimira"
alias stc="ssh -v -C -p 755 mori@fddskzhvzfnvsepp3l63ndt35humenufxz33ui2xbuvbpwdvaglg5qad.onion -o 'ProxyCommand=nc -v -X 5 -x 127.0.0.1:9050 %h %p'"
#alias stc2="ssh -v -C -o 'ProxyCommand=nc --proxy 127.0.0.1:9050 --proxy-type socks5 %h %p' -p 755 mori@fddskzhvzfnvsepp3l63ndt35humenufxz33ui2xbuvbpwdvaglg5qad.onion" 
alias stp="ssh -f -C -N -D 8080 -p 755 mori@fddskzhvzfnvsepp3l63ndt35humenufxz33ui2xbuvbpwdvaglg5qad.onion -o 'ProxyCommand=nc -v -X 5 -x 127.0.0.1:9050 %h %p'"
alias genmirlist="sudo reflector --latest 10 --proto https --ipv4 --sort rate --save /etc/pacman.d/mirrorlist"
alias clean-pacman-cache="echo y | yay -Scc && echo y | sudo pacman -Scc; echo"
