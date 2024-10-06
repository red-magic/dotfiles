stty werase undef
bind '\C-w:backward-kill-word'
bind '\C-n:history-search-forward'
bind '\C-p:history-search-backward'

PS1="\h\$ "
PAGER="less -M"
HISTFILE=""
LESSHISTFILE="-"
LANG="C.UTF-8"
EDITOR="mg"
#all_proxy="socks5://127.0.0.1:9050"

export PS1 PAGER HISTFILE LESSHISTFILE LANG EDITOR

alias sudo='sudo -E '
alias ls='ls --color=always'
alias l='ls -plha'
alias genmirlist='reflector --verbose --latest 20 --proto https --ipv4 --sort rate --save /tmp/mirrorlist && sudo install -m 644 /tmp/mirrorlist -t /etc/pacman.d && rm -vf /tmp/mirrorlist'
alias clean-pacman='remove_pacman_cache && remove_pacman_orphans'
alias short-logs='sudo journalctl --no-hostname -b'
#alias defrag-root='for i in {1..3}; do sudo e4defrag /; done'
#alias grub-update='sudo grub-install --boot-directory=/boot --efi-directory=/boot/efi --target=x86_64-efi --bootloader-id=Linux --recheck && sudo grub-mkconfig -o /boot/grub/grub.cfg'
#alias ssh-server='TERM=linux ssh -v -o Ciphers=aes128-gcm@openssh.com -o KexAlgorithms=curve25519-sha256 -o HostKeyAlgorithms=ssh-ed25519 -p 22 user@server.localdomain'

remove_pacman_cache() {
    if [[ -x "$(command -v yay)" ]]; then
        yes | yay -Scc
    fi
    yes | sudo pacman -Scc
}

remove_pacman_orphans() {
    if [[ -x "$(command -v yay)" ]]; then
        yay -Qttdq | yay -Rns -
    else
        pacman -Qttdq | sudo pacman -Rns -
    fi
}

# Extra

#printf "\033[?112;255;127c"

#LC_TIME="C.UTF-8"
#TIME_STYLE="long-iso"
#GPG_TTY="$(tty)"
#VISUAL="emacs"
#WLR_NO_HARDWARE_CURSORS=1
#VIMINIT="colorscheme default
#         syntax on
#         set number
#         set ruler
#         set cursorline
#         set viminfo=
#         match errorMsg /\s\+$/
#         hi Visual cterm=NONE ctermbg=black ctermfg=white
#         hi CursorLine cterm=NONE ctermbg=white ctermfg=black
#         hi CursorLineNr cterm=NONE ctermbg=white ctermfg=black
#         hi ErrorMsg cterm=NONE ctermbg=darkred ctermfg=black"

#export GPG_TTY VISUAL WLR_NO_HARDWARE_CURSORS VIMINIT LC_TIME TIME_STYLE

#alias date='date "+%Y-%m-%d %H:%M:%S %:z"'
#alias date='date --rfc-3339=seconds'
#alias date='date --iso-8601=seconds'
#alias journalctl='journalctl -o short-full'
#alias journalctl='journalctl -o short-iso'

#if tty | grep -q tty || tty | grep -q pts; then
#    fortune | cowthink
#fi

#gammastep-tty() {
#    gammastep -l 55.0:73.3 -t 2700:3000 -m drm > /dev/null 2>&1 &
#}

#if [ -z "$(pgrep gammastep)" ] && tty | grep -q tty && [ -x "$(command -v gammastep)" ]; then
#    gammastep -l 55.0:73.3 -t 2700:3000 -m drm > /dev/null 2>&1 &
#fi

#ssh_port=""
#remote_host=""
#tor_host=""
#local_proxy_port=""
#remote_dir="/home/${USER}"
#mnt_dir="~/${remote_host}"

#alias sc="ssh -v ${remote_host}"
#alias sp="ssh -f -N -D ${local_proxy_port} ${remote_host}"
#alias stc="ssh -v ${tor_host} -o 'ProxyCommand=nc -v -X 5 -x 127.0.0.1:9050 %h %p'"
#alias stc2="ssh -v -o 'ProxyCommand=nc --proxy 127.0.0.1:9050 --proxy-type socks5 %h %p' ${tor_host}"
#alias sc-torsocks="torsocks ssh -v ${tor_host}"
#alias stp="ssh -f -N -D ${local_proxy_port} ${tor_host} -o 'ProxyCommand=nc -v -X 5 -x 127.0.0.1:9050 %h %p'"
#alias sp-torsocks="torsocks ssh -v -f -N -D ${local_proxy_port} ${tor_host}"
#alias spl="ssh -v -f -N -L 127.0.0.1:${local_proxy_port}:${remote_host}:9050 ${remote_host}"

#mount-remote-host() {
#    if [[ ! -d "${mnt_dir}"  ]; then
#        mkdir -v "${mnt_dir}"
#    fi
#
#    if [[ -z "$(ls -A "${mnt_dir}")" ]]; then
#        sshfs -p "${ssh_port}" -C "${USER}@${remote_host}":"${remote_dir}" "${mnt_dir}"
#    else
#        echo "${mnt_dir} directory is not empty, refusing to mount"
#    fi
#}

#umount-remote-host() {
#    fusermount3 -u $mnt_dir
#
#    if [[ -z "$(ls -A "${mnt_dir}")" ]] && [ -z "$(ps aux | grep sshfs | grep "${remote_host}")" ]]; then
#        rm -rfv "${mnt_dir}"
#     else
#        echo "${mnt_dir} directory is not empty or still mounted, refusing to remove"
#    fi
#}

#go-get-some-sleep() {
#    if tty | grep -q tty; then
#        sudo systemctl suspend && physlock
#        else
#        sudo true && i3lock -i pictures/lock.png && sudo systemctl suspend
#    fi
#}
