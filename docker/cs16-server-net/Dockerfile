ARG ADMIN_STEAMID="STEAM_0:0:123456"

ARG STEAMCMD_LINK="https://steamcdn-a.akamaihd.net/client/steamcmd_linux.tar.gz"
ARG METAMODP_LINK="https://github.com/Bots-United/metamod-p/releases/download/v1.21p109/metamod-p-v1.21p109-linux_ubuntu2404.tar.xz"
ARG AMXMODX_BASE_LINK="https://github.com/alliedmodders/amxmodx/releases/download/1.10.0.5476/amxmodx-1.10.0-git5476-base-linux.tar.gz"
ARG AMXMODX_CSTRIKE_LINK="https://github.com/alliedmodders/amxmodx/releases/download/1.10.0.5476/amxmodx-1.10.0-git5476-cstrike-linux.tar.gz"

FROM debian:trixie-slim

RUN apt-get update -y && \
    apt-get install -y locales lib32stdc++6 curl xz-utils && \
    localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 && \
    apt-get clean -y && \
    rm -vrf /var/lib/apt/lists/*

ENV LANG="en_US.UTF-8"

RUN mkdir -vm 700 /var/hlds && \
    useradd -r -M -s "$(command -v nologin)" -d /var/hlds -c "Counter-Strike 1.6 Dedicated Server" hlds && \
    mkdir -v /var/hlds/.steam && \
    mkdir -v /var/hlds/cs16 && \
    chown -vR hlds:hlds /var/hlds

USER hlds

ARG ADMIN_STEAMID
ARG STEAMCMD_LINK
ARG METAMODP_LINK
ARG AMXMODX_BASE_LINK
ARG AMXMODX_CSTRIKE_LINK

WORKDIR /var/hlds/.steam

RUN curl -L "${STEAMCMD_LINK}" | tar zxvf - -C . && \
    curl -L "${METAMODP_LINK}" | tar Jxvf - -C . && \
    curl -L "${AMXMODX_BASE_LINK}" | tar zxvf - -C . && \
    curl -L "${AMXMODX_CSTRIKE_LINK}" | tar zxvf - -C .

RUN ln -vsf . steam && \
    for i in {1..3}; do ./steamcmd.sh +force_install_dir /var/hlds/cs16 +login anonymous +app_update 90 validate +quit; done

RUN echo "\"${ADMIN_STEAMID}\" \"\" \"abcdefghijklmnopqrstuv\" \"ce\"" >> addons/amxmodx/configs/users.ini && \
    echo "linux addons/amxmodx/dlls/amxmodx_mm_i386.so" > addons/metamod/plugins.ini && \
    sed -i "s|gamedll_linux \"dlls/cs.so\"|gamedll_linux \"addons/metamod/dlls/metamod.so\"|" ../cs16/cstrike/liblist.gam

RUN mv -vf addons ../cs16/cstrike && \
    ln -vsf linux32 sdk32 && \
    touch ../cs16/cstrike/listip.cfg && \
    touch ../cs16/cstrike/banned.cfg

WORKDIR /var/hlds/cs16

ENTRYPOINT ["./hlds_run"]
CMD ["-game", "cstrike", "-secure", "-pingboost", "3", "+sv_lan", "0", "-maxplayers", "32", "+map", "de_dust2", "-norestart"]

STOPSIGNAL SIGINT
