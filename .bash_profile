LANG="C.UTF-8"
EDITOR="mg -n"
#EDITOR="emacsclient -nw"
#ALTERNATE_EDITOR="emacs -nw --color=never"
PAGER="less -M"
LESSHISTFILE="-"
HISTFILE=""
#HISTSIZE="10000"
#HISTCONTROL="ignoreboth"

export LANG EDITOR ALTERNATE_EDITOR PAGER LESSHISTFILE HISTFILE # HISTSIZE HISTCONTROL

[[ -f "${HOME}/.bashrc" ]] && . "${HOME}/.bashrc"
