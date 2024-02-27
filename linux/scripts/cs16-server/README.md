# Counter-Strike 1.6 Dedicated Server for Linux

![screenshot](screenshot.jpg)

## Requirements

Make sure you have 32 bit libraries before installation:

- ```pacman -S lib32-gcc-libs``` for Arch (enable multilib repo first)
- ```apt install lib32stdc++6``` for Debian based distros
- ```dnf install glibc.i686 libstdc++.i686``` for RHEL based distros

And basic tools:

```sudo tar xz gzip unzip curl```

## Installation

Run ```./install``` script, first it downloads **steamcmd**, **metamod-p-v1.21p38**, **amxmodx-1.10-latest** and **podbot-V3B24** to ```/tmp/cs16-server```.

Once it's done it places ```cs16-server``` main script to ```/usr/bin``` and ```cs16-server.conf``` with ```$server_parms``` to ```/etc/cs16-server```.

It also creates ```steam``` user which launches ```stage-two``` script.

```stage-two``` is run by ```steam``` user and basically extracts all acrhives from ```/tmp/cs16-server``` to ```/home/steam/.steam``` directory, makes necessary symlinks and updates **steamcmd**.

```steam``` user is created with account locked and password disabled, use ```sudo su - steam``` if you need to do further server configuration in ```/home/steam/.steam``` directory.

**metamod is disabled by default**, if you need to enable it uncomment ```enable_metamod``` line in ```cs16-server.conf```

Optionally you can install ```nftables.example``` for a simple firewall.

### systemd

If you use a systemd based distro ```cs16-server.service``` will be installed to ```/usr/lib/systemd/system``` which you can enable to start ```cs16-server``` on boot.

## Usage

```Usage: cs16-server [start | restart | stop | update]```

## cs16-server.conf

```
custom_params="-pingboost 3 -maxplayers 32 +sv_lan 0 +map de_dust2"
#enable_metamod="-dll cstrike/addons/metamod/dlls/metamod.so"
server_params="-game cstrike -secure $custom_params $enable_metamod"
```
By default it's a vanilla server, but you can uncomment ```enable_metamod``` line which enables **amxmodx** and **podbod**.

You can change ```custom_params``` to whatever you want to, it all just passes options to ```hlds_run```.

## Removal

If you want to uninstall and clean everything:

```
rm -vf /usr/bin/cs16-server
rm -vrf /etc/cs16-server
rm -vrf /home/steam
rm -vf /usr/lib/systemd/system/cs16-server.service
userdel steam
```
