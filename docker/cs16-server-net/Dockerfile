ARG ADMIN_STEAMID="STEAM_0:0:123456"

ARG STEAMCMD_LINK="https://steamcdn-a.akamaihd.net/client/steamcmd_linux.tar.gz"
ARG AMXMODX_BASE_LINK="https://github.com/alliedmodders/amxmodx/releases/download/1.10.0.5476/amxmodx-1.10.0-git5476-base-linux.tar.gz"
ARG AMXMODX_CSTRIKE_LINK="https://github.com/alliedmodders/amxmodx/releases/download/1.10.0.5476/amxmodx-1.10.0-git5476-cstrike-linux.tar.gz"

FROM debian:trixie-slim

RUN apt-get update -y && \
    apt-get install -y locales lib32stdc++6 curl xz-utils && \
    localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 && \
    apt-get clean -y && \
    rm -vrf /var/lib/apt/lists/*

ENV LANG="en_US.UTF-8"

RUN mkdir -v /var/hlds && \
    chmod -v 700 /var/hlds && \
    useradd -r -M -s "$(command -v nologin)" -d /var/hlds -c "Counter-Strike 1.6 Dedicated Server" hlds && \
    chown -v hlds:hlds /var/hlds

USER hlds

ARG ADMIN_STEAMID

ARG STEAMCMD_LINK
ARG AMXMODX_BASE_LINK
ARG AMXMODX_CSTRIKE_LINK

RUN mkdir -v /var/hlds/.steam && \
    cd /var/hlds/.steam && \
    ln -vsf . steam && \
    curl -L "${STEAMCMD_LINK}" | tar zxvf - -C . && \
    for i in {1..3}; do ./steamcmd.sh +force_install_dir /var/hlds/cs16 +login anonymous +app_update 90 validate +quit; done

RUN cd /var/hlds/.steam && \
    curl -L "${AMXMODX_BASE_LINK}" | tar zxvf - -C . && \
    curl -L "${AMXMODX_CSTRIKE_LINK}" | tar zxvf - -C . && \
    echo "\"${ADMIN_STEAMID}\" \"\" \"abcdefghijklmnopqrstuv\" \"ce\"" >> addons/amxmodx/configs/users.ini

RUN cd /var/hlds/.steam && \
    mv -vf addons ../cs16/cstrike && \
    ln -vsf linux32 sdk32 && \
    touch ../cs16/cstrike/listip.cfg && \
    touch ../cs16/cstrike/banned.cfg

WORKDIR /var/hlds/cs16

ENTRYPOINT ["./hlds_run"]
CMD ["-game", "cstrike", "-secure", "-pingboost", "3", "+sv_lan", "0", "-maxplayes", "32", "+map", "de_dust2", "-dll", "cstrike/addons/amxmodx/dlls/amxmodx_mm_i386.so", "-norestart"]

STOPSIGNAL SIGINT
