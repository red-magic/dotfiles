case "$-" in
    *"i"*) ;;
    *) return ;;
esac

stty werase undef
bind '\C-w:backward-kill-word'
bind '\C-n:history-search-forward'
bind '\C-p:history-search-backward'
#shopt -s histappend

PS1="\h$ "
ALTERNATE_EDITOR="emacs -nw --color=never"

alias ls='ls --color=always'
alias l='ls -plha'
alias sl='fn_sl'
alias mg='mg -n'
alias smg='fn_smg'
alias emacs='emacsclient -nw'
alias semacs='fn_semacs'
alias full-clean-git='git clean -dfx && git reset --hard'
alias short-logs='sudo journalctl --no-hostname -b'
alias defrag-root-ext4='fn_defrag_root_ext4'
alias defrag-root-btrfs='fn_defrag_root_btrfs'
alias grub-update-install='sudo grub-install --boot-directory=/boot --efi-directory=/boot/efi --target=x86_64-efi --bootloader-id=Linux'
alias grub-update-config='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias genmirlist='fn_genmirlist'
alias clean-pacman='fn_clean_pacman'

#alias ssh-connect='ssh -v domain.tld'
#alias ssh-connect-tunnel='ssh -f -T -N -D 1080 domain.tld'
#alias ssh-connect-tor='fn_ssh_connect_tor'

fn_sl() {
    sudo ls -plha --color=always "$@"
}

fn_smg() {
    sudo mg -n "$@"
}

fn_semacs() {
    file_path="$(realpath -- "$(dirname -- "${1}")")/$(basename -- "${1}")"
    emacs "/sudo::${file_path}"
}

fn_defrag_root_ext4() {
    printf "Starting defragmentation...\n"
    for i in {1..3}; do
        printf "Defrag pass: %s\n" "${i}"
        sudo e4defrag / &> /dev/null
    done
}

fn_defrag_root_btrfs() {
    printf "Starting defragmentation...\n"
    for i in {1..3}; do
        printf "Defrag pass: %s\n" "${i}"
        sudo btrfs filesystem defragment -r / &> /dev/null
    done
}

fn_genmirlist() {
    printf "Generating mirror list...\n"
    reflector --verbose --latest 20 --proto https --ipv4 --sort rate --save /tmp/mirrorlist
    sudo install -m 644 /tmp/mirrorlist -t /etc/pacman.d
    rm -vf /tmp/mirrorlist
}

fn_clean_pacman() {
    if [[ -x "$(command -v yay)" ]]; then
        yay -Scc --noconfirm
        yay -Qttdq | yay -Rns -
    else
        sudo pacman -Scc --noconfirm
        pacman -Qttdq | sudo pacman -Rns -
    fi
}

#fn_ssh_connect_tor() {
#    tor_domain="verylongtordomain.onion"
#    ssh -v -C -o ProxyCommand="nc -X 5 -x 127.0.0.1:9150 %h %p" "$tor_domain"
#}
