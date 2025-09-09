stty werase undef
bind '\C-w:backward-kill-word'
bind '\C-n:history-search-forward'
bind '\C-p:history-search-backward'
shopt -s histappend

LANG="C.UTF-8"
PS1="\h\$ "
EDITOR="mg -n"
#EDITOR="emacs"
PAGER="less -M"
LESSHISTFILE="-"
HISTFILE=""
#HISTSIZE="10000"
#HISTCONTROL="ignoreboth"

export LANG PS1 EDITOR PAGER LESSHISTFILE HISTFILE HISTSIZE HISTCONTROL

alias sudo='sudo -E '
alias ls='ls --color=always'
alias l='ls -plha'
alias mg='mg -n'
alias emacs='emacsclient'
alias semacs='fn_semacs'
alias full-clean-git='git clean -dfx && git reset --hard'
alias short-logs='sudo journalctl --no-hostname -b'
alias defrag-root-ext4='fn_defrag_root_ext4'
alias grub-update-install='sudo grub-install --boot-directory=/boot --efi-directory=/boot/efi --target=x86_64-efi --bootloader-id=Linux --recheck'
alias grub-update-config='sudo grub-mkconfig -o /boot/grub/grub.cfg'

alias genmirlist='fn_genmirlist'
alias clean-pacman='fn_clean_pacman'

alias ssh-connect='ssh -v -o Ciphers=aes256-gcm@openssh.com -o KexAlgorithms=curve25519-sha256 -o HostKeyAlgorithms=ssh-ed25519 server.domain'
alias ssh-connect-tunnel='ssh -f -N -D 1080 server.domain'
alias ssh-connect-tor='fn_ssh_connect_tor'

alias rless='fn_rless'

fn_semacs() {
    if [[ -e "${1}" ]]; then
        file_path="$(realpath -- "${1}")"
    else
        file_path="$(realpath -- "$(dirname -- "${1}")")/$(basename -- "${1}")"
    fi
    emacs "/sudo::${file_path}"
}

fn_defrag_root_ext4() {
    sudo printf "Starting defragmentation...\n"
    for i in {1..3}; do
        printf "Defrag pass: %s\n" "${i}"
        sudo e4defrag / &> /dev/null
    done
}

fn_genmirlist() {
    sudo printf "Generating mirror list...\n"
    reflector --verbose --latest 20 --proto https --ipv4 --sort rate --save /tmp/mirrorlist
    sudo install -m 644 /tmp/mirrorlist -t /etc/pacman.d
    rm -vf /tmp/mirrorlist
}

fn_clean_pacman() {
    if [[ -x "$(command -v yay)" ]]; then
        yes | yay -Scc
        yay -Qttdq | yay -Rns -
    else
        yes | sudo pacman -Scc
        pacman -Qttdq | sudo pacman -Rns -
    fi
}

fn_ssh_connect_tor() {
    # OpenBSD netcat
    tor_domain="verylongtordomain.onion"
    ssh -v -C -o ProxyCommand="nc -x 127.0.0.1:9150 %h %p" "$tor_domain"
}

fn_rless() {
    # Example:
    # rless file.txt. 60 40
    # rless file.txt. - 80
    width="80"
    indent="0"
    if [[ -n "${2}" ]] && [[ "${2}" != "-" ]]; then
        width="${2}"
    fi
    if [[ -n "${3}" ]]; then
        indent="${3}"
    elif [[ "${2}" == "-" ]] && [[ -n "${3}" ]]; then
        indent="${3}"
    fi
    fold -sw "${width}" "${1}" | pr -To "${indent}" | less -J
}
