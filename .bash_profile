LANG="C.UTF-8"
EDITOR="mg -n"
#EDITOR="emacsclient -nw"
PAGER="less -M"
LESSHISTFILE="-"
HISTFILE=""
#HISTSIZE="10000"
#HISTCONTROL="ignoreboth"

export LANG EDITOR PAGER LESSHISTFILE HISTFILE # HISTSIZE HISTCONTROL

[[ -f "${HOME}/.bashrc" ]] && . "${HOME}/.bashrc"
