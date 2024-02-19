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

To change TTY colors on user logon add ```tty-colors <colorscheme>``` to ```.profile```

## Screenshots

![screenshot 1] (https://github.com/red-magic/dotfiles/raw/master/linux/scripts/tty-colors/images/screenshot-1.png)

![screenshot 2] (https://github.com/red-magic/dotfiles/raw/master/linux/scripts/tty-colors/images/screenshot-2.png)

![screenshot 3] (https://github.com/red-magic/dotfiles/raw/master/linux/scripts/tty-colors/images/screenshot-3.png)

![screenshot 4] (https://github.com/red-magic/dotfiles/raw/master/linux/scripts/tty-colors/images/screenshot-4.png)
