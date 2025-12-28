PS1="\h$ "

export LANG="C.UTF-8"
export EDITOR="mg -n"
#export EDITOR="emacsclient -nw"
#export ALTERNATE_EDITOR="emacs -nw"
export PAGER="less -M"
export MANWIDTH="80"
export LESSHISTFILE="-"

HISTFILE=""
#HISTSIZE="10000"
#HISTCONTROL="ignoreboth"

[[ -f "${HOME}/.bashrc" ]] && . "${HOME}/.bashrc"
