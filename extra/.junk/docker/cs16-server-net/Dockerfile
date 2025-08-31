FROM debian:13

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y lib32stdc++6 curl xz-utils mg && \
    apt-get install -y locales && \
    echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
    locale-gen && \
    useradd -r -m -s "$(command -v nologin)" -d /var/hlds -c "Counter-Strike 1.6 Dedicated Server" hlds

RUN apt-get clean -y && \
    apt-get autoremove -y && \
    apt-get autopurge -y && \
    rm -vrf /var/lib/apt/lists/*

USER hlds

RUN mkdir -v /var/hlds/.steam && \
    cd /var/hlds/.steam && \
    ln -sfv . steam && \
    curl -L https://steamcdn-a.akamaihd.net/client/steamcmd_linux.tar.gz | tar zxvf - -C . && \
    for i in {1..3}; do ./steamcmd.sh +force_install_dir cs16 +login anonymous +app_update 90 validate +quit; done

RUN cd /var/hlds/.steam && \
    curl -L https://github.com/Bots-United/metamod-p/releases/download/v1.21p38/metamod_i686_linux_win32-1.21p38.tar.xz | tar Jxvf - -C . && \
    curl -L https://www.amxmodx.org/amxxdrop/1.10/amxmodx-1.10.0-git5468-base-linux.tar.gz | tar zxvf - -C . && \
    curl -L https://www.amxmodx.org/amxxdrop/1.10/amxmodx-1.10.0-git5468-cstrike-linux.tar.gz | tar zxvf - -C . && \
    curl -L https://github.com/yapb/yapb/releases/download/4.4.957/yapb-4.4.957-linux.tar.xz | tar Jxvf - -C .

RUN cd /var/hlds/.steam && \
    chmod -v 755 addons/yapb/data/* && \
    mv -vf addons cs16/cstrike && \
    mkdir -vp cs16/cstrike/addons/metamod/dlls && \
    mv -vf metamod.so cs16/cstrike/addons/metamod/dlls && \
    rm -vf metamod.dll && \
    echo "linux addons/amxmodx/dlls/amxmodx_mm_i386.so" > cs16/cstrike/addons/metamod/plugins.ini && \
    echo ";;linux addons/yapb/bin/yapb.so" >> cs16/cstrike/addons/metamod/plugins.ini && \
    ln -sfv linux32 sdk32

USER hlds

WORKDIR /var/hlds/.steam/cs16

EXPOSE 27015/tcp 27015/udp

CMD ["./hlds_run", "-game", "cstrike", "-secure", "-pingboost", "3", "+sv_lan", "0", "+map", "de_dust2", "-dll", "cstrike/addons/metamod/dlls/metamod.so"]
