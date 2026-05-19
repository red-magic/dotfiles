ARG RCON_PASSWORD="qwerty123456"
ARG YB_PASSWORD="qwerty123456"
ARG YB_QUOTA="16"
ARG YB_QUOTA_MODE="fill"
ARG YB_DIFFICULTY="0"
ARG YB_RADIO_MODE="0"
ARG MP_TIMELIMIT="0"

ARG STEAMCMD_LINK="https://steamcdn-a.akamaihd.net/client/steamcmd_linux.tar.gz"
ARG YAPB_LINK="https://github.com/yapb/yapb/releases/download/4.4.957/yapb-4.4.957-linux.tar.xz"

FROM debian:trixie-slim

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y lib32stdc++6 curl xz-utils && \
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

ARG RCON_PASSWORD
ARG YB_PASSWORD
ARG YB_QUOTA
ARG YB_QUOTA_MODE
ARG YB_DIFFICULTY
ARG YB_RADIO_MODE
ARG MP_TIMELIMIT

ARG STEAMCMD_LINK
ARG YAPB_LINK

RUN mkdir -v /var/hlds/.steam && \
    cd /var/hlds/.steam && \
    ln -sfv . steam && \
    curl -L "${STEAMCMD_LINK}" | tar zxvf - -C . && \
    for i in {1..3}; do ./steamcmd.sh +force_install_dir /var/hlds/cs16 +login anonymous +app_update 90 validate +quit; done && \
    curl -L "${YAPB_LINK}" | tar Jxvf - -C .

RUN cd /var/hlds/.steam && \
    chmod -v 755 addons/yapb/data/* && \
    mv -vf addons ../cs16/cstrike && \
    ln -sfv linux32 sdk32 && \
    touch ../cs16/cstrike/listip.cfg && \
    touch ../cs16/cstrike/banned.cfg

RUN cd /var/hlds && \
    echo "rcon_password ${RCON_PASSWORD}" >> cs16/cstrike/server.cfg && \
    sed -i "s|yb_password \"\"|yb_password \"${YB_PASSWORD}\"|" cs16/cstrike/addons/yapb/conf/yapb.cfg && \
    sed -i "s|yb_quota \"9\"|yb_quota \"${YB_QUOTA}\"|" cs16/cstrike/addons/yapb/conf/yapb.cfg && \
    sed -i "s|yb_quota_mode \"normal\"|yb_quota_mode \"${YB_QUOTA_MODE}\"|" cs16/cstrike/addons/yapb/conf/yapb.cfg && \
    sed -i "s|yb_difficulty \"3\"|yb_difficulty \"${YB_DIFFICULTY}\"|" cs16/cstrike/addons/yapb/conf/yapb.cfg && \
    sed -i "s|yb_radio_mode \"2\"|yb_radio_mode \"${YB_RADIO_MODE}\"|" cs16/cstrike/addons/yapb/conf/yapb.cfg && \
    sed -i "s|mp_timelimit 20|mp_timelimit ${MP_TIMELIMIT}|" cs16/cstrike/server.cfg

WORKDIR /var/hlds/cs16

CMD ["./hlds_run", "-game", "cstrike", "-pingboost", "3", "+sv_lan", "1", "-maxplayers", "16", "+map", "de_dust2", "-dll", "cstrike/addons/yapb/bin/yapb.so"]
