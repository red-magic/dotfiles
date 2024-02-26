# Counter-Strike 1.6 Dedicated Server for Linux

![screenshot](screenshot.jpg)

## Requirements

Make sure you have 32 bit libraries before installation

- ```pacman -S lib32-gcc-libs``` for Arch (enable multilib repo first)
- ```apt install lib32stdc++6``` for Debian based distros
- ```dnf install glibc.i686 libstdc++.i686``` for RHEL based distros

And basic tools

```sudo tar xz gzip unzip curl```

## Installation

Run ```./install```, it will place ```cs16-server``` main script to ```/usr/bin``` and ```cs16-server.conf``` with ```$server_parms``` to ```/etc/cs16-server```

It will also create ```steam``` user which will launch ```stage-two``` script

```stage-two``` downloads and installs ```steamcmd```, ```metamod-p```, ```amxmodx-1.10-latest``` and ```podbot```

```steam``` user is created without a password and account locked, use ```sudo su - steam``` if you need to do further server configurations in ```~/.steam``` directory

```metamod``` **is disabled by default**, if you need to enable it uncomment the second line in ```cs16-server.conf``` and comment the first one

### systemd

If you use a systemd based distro ```cs16-server.service``` will be installed to ```/usr/lib/systemd/system``` which you can enable to start ```cs16-server``` on boot

## Usage

```Usage: cs16-server [start | restart | stop | update]```

## cs16-server.conf

Default ```$server_params``` var looks like this

```server_params="-game cstrike -pingboost 3 -maxplayers 16 -secure +sv_lan 0 +map de_dust2"```

You can change it to whatever you want to, it just passes options to ```hlds_run```

## Removal

If you want to uninstall and clean everything

```
rm -vf /usr/bin/cs16-server
rm -vrf /etc/cs16-server
rm -vrf /home/steam
rm -vf /usr/lib/systemd/system/cs16-server.service
userdel steam
```
