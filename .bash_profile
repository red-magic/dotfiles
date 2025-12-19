LANG="C.UTF-8"
PS1="\h\$ "
EDITOR="mg -n"
#EDITOR="emacsclient -nw -a emacs"
PAGER="less -M"
LESSHISTFILE="-"
HISTFILE=""
#HISTSIZE="10000"
#HISTCONTROL="ignoreboth"

export LANG PS1 EDITOR PAGER LESSHISTFILE # HISTFILE HISTSIZE HISTCONTROL

if [[ -f "${HOME}/.bashrc" ]]; then
    . "${HOME}/.bashrc"
fi
