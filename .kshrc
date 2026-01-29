case $- in
    *i*) ;;
    *) return 0 ;;
esac

alias l='ls -plha'
alias sl=fn_sl
alias longlines='grep -n ".\{81,\}"'
alias man='man -T ascii -O width=80'
alias mg='mg -n'
alias smg=fn_smg
alias emacs='emacsclient -nw'
alias semacs=fn_semacs
alias ranger='TERM=xterm ranger'
alias fastfetch='fastfetch --pipe'
alias full-clean-git='git clean -dfx && git reset --hard'
alias update-pkgs='doas pkg_add -vUu && doas pkg_delete -ac'
#alias ssh-connect='ssh -v domain.tld'
#alias ssh-connect-tunnel='ssh -f -T -N -D 1080 domain.tld'
#alias ssh-connect-tor=fn_ssh_connect_tor

fn_sl() { doas ls -plha "$@"; }
fn_smg() { doas mg -n "$@"; }
fn_semacs() { emacs "/doas::$(realpath -- "$1")"; }

#fn_ssh_connect_tor()
#{
#    tor_domain="verylongtordomain.onion"
#    ssh -v -C -o ProxyCommand="nc -X 5 -x 127.0.0.1:9150 %h %p" "$tor_domain"
#}
