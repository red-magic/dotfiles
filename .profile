LANG="C.UTF-8"
PS1="\h\$ "
EDITOR="mg -n"
#EDITOR="emacsclient -nw"
PAGER="less -M"

export LANG PS1 EDITOR PAGER

alias doas='doas '
alias l='ls -plha'
alias mg='mg -n'
alias emacs='emacsclient -nw'
alias semacs='fn_semacs'
alias ranger='TERM=xterm ranger'
alias fastfetch='fastfetch --pipe'
alias update-pkgs='doas pkg_add -vUu && doas pkg_delete -ac'
alias full-clean-git='git clean -dfx && git reset --hard'

#alias ssh-connect='ssh -v domain.tld'
#alias ssh-connect-tunnel='ssh -f -N -D 1080 domain.tld'
#alias ssh-connect-tor='fn_ssh_connect_tor'

fn_semacs() {
    file_path=$(realpath -- "$(dirname -- "$1")")/$(basename -- "$1")
    emacs "/doas::$file_path"
}

#fn_ssh_connect_tor() {
#    tor_domain="verylongtordomain.onion"
#    ssh -v -C -o ProxyCommand="nc -X 5 -x 127.0.0.1:9150 %h %p" "$tor_domain"
#}
