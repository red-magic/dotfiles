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
#alias fastfetch='fastfetch --pipe'
alias update-pkgs='doas pkg_add -vUu && doas pkg_delete -ac'
#alias ssh-server='ssh -v -o Ciphers=aes256-gcm@openssh.com -o KexAlgorithms=curve25519-sha256 -o HostKeyAlgorithms=ssh-ed25519 -p 22 user@server.localdomain'
alias full-clean-git='git clean -dfx && git reset --hard'
#alias ssh-tor-connect='fn_ssh_tor_connect'

fn_semacs() {
    if [ -e "$1" ]; then
        file_path=$(realpath -- "$1")
    else
        file_path=$(realpath -- "$(dirname -- "$1")")/$(basename -- "$1")
    fi
    emacs "/doas::$file_path"
}

#fn_ssh_tor_connect() {
#    # OpenBSD netcat
#    tor_domain="verylongtordomain.onion"
#    ssh -v -C -o ProxyCommand="nc -x 127.0.0.1:9150 %h %p" "$USER@$tor_domain"
#}

# Extra

#GPG_TTY="$(tty)"
#VISUAL="emacs"
#LC_ALL="en_US.UTF-8"
#LANG="en_US.UTF-8"
#LC_TIME="C.UTF-8"
#LESSHISTFILE="-"
#VIMINIT="colorscheme desert
#         syntax on
#         set number
#         set ruler
#         set cursorline
#         set viminfo=
#         match errorMsg /\s\+$/
#         hi ErrorMsg cterm=NONE ctermbg=darkred ctermfg=black
#         hi CursorLineNr cterm=NONE ctermbg=white ctermfg=black
#         hi CursorLine cterm=NONE ctermbg=white ctermfg=black"

#export GPG_TTY VISUAL LC_ALL VIMINIT LANG LC_TIME LESSHISTFILE

#set -o emacs

#if ! tty | grep -q C
#then
#    export ENV="${HOME}/.profile"
#else
#    fortune | cowthink
#fi

#ssh_port=""
#remote_host=""
#tor_host=""
#local_proxy_port=""

#alias sc="ssh -v ${remote_host}"
#alias sp="ssh -f -N -D ${local_proxy_port} ${remote_host}"
#alias stc="ssh -v ${tor_host} -o ProxyCommand='nc -v -X 5 -x 127.0.0.1:9050 %h %p'"
#alias stc2="ssh -v -o ProxyCommand='nc --proxy 127.0.0.1:9050 --proxy-type socks5 %h %p' ${tor_host}"
#alias sc-torsocks="torsocks ssh -v ${tor_host}"
#alias stp="ssh -f -N -D ${local_proxy_port} ${tor_host} -o ProxyCommand='nc -v -X 5 -x 127.0.0.1:9050 %h %p'"
#alias sp-torsocks="torsocks ssh -v -f -N -D ${local_proxy_port} ${tor_host}"
#alias spl="ssh -v -f -N -L 127.0.0.1:${local_proxy_port}:${remote_host}:9050 ${remote_host}"
