FROM debian:trixie-slim

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y lib32stdc++6 curl xz-utils mg && \
    apt-get install -y locales && \
    echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
    locale-gen

RUN apt-get clean -y && \
    apt-get autoremove -y && \
    apt-get autopurge -y && \
    rm -vrf /var/lib/apt/lists/*

RUN mkdir -v /var/hlds && \
    chmod -v 700 /var/hlds && \
    useradd -r -M -s "$(command -v nologin)" -d /var/hlds -c "Counter-Strike 1.6 Dedicated Server" hlds && \
    chown -v hlds:hlds /var/hlds

USER hlds

RUN mkdir -v /var/hlds/.steam && \
    cd /var/hlds/.steam && \
    ln -sfv . steam && \
    curl -L https://steamcdn-a.akamaihd.net/client/steamcmd_linux.tar.gz | tar zxvf - -C . && \
    for i in {1..3}; do ./steamcmd.sh +force_install_dir /var/hlds/cs16 +login anonymous +app_update 90 validate +quit; done

RUN cd /var/hlds/.steam && \
    curl -L https://www.amxmodx.org/amxxdrop/1.10/amxmodx-1.10.0-git5473-base-linux.tar.gz | tar zxvf - -C . && \
    curl -L https://www.amxmodx.org/amxxdrop/1.10/amxmodx-1.10.0-git5473-cstrike-linux.tar.gz | tar zxvf - -C . && \

RUN cd /var/hlds/.steam && \
    echo '"STEAM_0:0:123456" "" "abcdefghijklmnopqrstuv" "ce"' >> addons/amxmodx/configs/users.ini && \
    mv -vf addons ../cs16/cstrike && \
    ln -sfv linux32 sdk32

USER hlds

WORKDIR /var/hlds/cs16

CMD ["./hlds_run", "-game", "cstrike", "-secure", "-pingboost", "3", "+sv_lan", "0", "+map", "de_dust2", "-dll", "cstrike/addons/amxmodx/dlls/amxmodx_mm_i386.so"]
