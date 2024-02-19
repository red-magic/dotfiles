# Colorschemes for the linux TTY

## Installation

Run ```install``` script as root to install tty-colors script and colorschemes

If you want to uninstall it simply pass remove argument ```install remove```

### systemd

If you are using systemd it will also install ```tty-colors.service``` which you can enable to change TTY colors on boot

Desired colorscheme can be set in ```/etc/tty-colors/tty-colors.conf```

## Usage

```
Usage: tty-colors [color_scheme]
  -l    list colorschemes
  -p    list colorschemes and print colors
  -h    print help
```

## Screenshots
