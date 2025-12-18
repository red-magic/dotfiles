LANG="C.UTF-8"

if command -v emacsclient > /dev/null 2>&1; then
    EDITOR="emacsclient -nw"
else
    EDITOR="mg -n"
fi

PAGER="less -M"
ENV="$HOME/.kshrc"

export LANG EDITOR PAGER ENV
