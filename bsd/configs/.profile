LANG="C.UTF-8"
PS1="\h\$ "
EDITOR="mg -n"
#EDITOR="emacs"
PAGER="less -M"

export LANG PS1 EDITOR PAGER

alias doas='doas '
alias l='ls -plha'
alias mg='mg -n'
alias semacs='fn_semacs'
alias ranger='TERM=xterm ranger'
alias fastfetch='fastfetch --pipe'
alias update-pkgs='doas pkg_add -vUu && doas pkg_delete -ac'
alias full-clean-git='git clean -dfx && git reset --hard'

alias ssh-connect='ssh -v -o Ciphers=aes256-gcm@openssh.com -o KexAlgorithms=curve25519-sha256 -o HostKeyAlgorithms=ssh-ed25519 server.domain'
alias ssh-connect-tunnel='ssh -f -N -D 1080 server.domain'
alias ssh-connect-tor='fn_ssh_connect_tor'

fn_semacs() {
    if [ -e "$1" ]; then
        file_path=$(realpath -- "$1")
    else
        file_path=$(realpath -- "$(dirname -- "$1")")/$(basename -- "$1")
    fi
    emacs "/doas::$file_path"
}

fn_ssh_connect_tor() {
    tor_domain="verylongtordomain.onion"
    ssh -v -C -o ProxyCommand="nc -x 127.0.0.1:9150 %h %p" "$tor_domain"
}
