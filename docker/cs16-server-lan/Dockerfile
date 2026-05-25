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
    apt-get install -y locales lib32stdc++6 curl xz-utils && \
    localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*

ENV LANG="en_US.UTF-8"

RUN mkdir -m 700 /opt/hlds && \
    useradd -r -M -s "$(command -v nologin)" -d /opt/hlds -c "Counter-Strike 1.6 Dedicated Server" hlds && \
    mkdir /opt/hlds/.steam && \
    mkdir /opt/hlds/cs16 && \
    chown -R hlds:hlds /opt/hlds

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

WORKDIR /opt/hlds/.steam

RUN curl -L "${STEAMCMD_LINK}" | tar zxf - -C . && \
    curl -L "${YAPB_LINK}" | tar Jxf - -C .

RUN ln -sf . steam && \
    for i in 1 2 3; do ./steamcmd.sh +force_install_dir /opt/hlds/cs16 +login anonymous +app_update 90 validate +quit; done

RUN echo "rcon_password ${RCON_PASSWORD}" >> ../cs16/cstrike/server.cfg && \
    sed -i "s|yb_password \"\"|yb_password \"${YB_PASSWORD}\"|" addons/yapb/conf/yapb.cfg && \
    sed -i "s|yb_quota \"9\"|yb_quota \"${YB_QUOTA}\"|" addons/yapb/conf/yapb.cfg && \
    sed -i "s|yb_quota_mode \"normal\"|yb_quota_mode \"${YB_QUOTA_MODE}\"|" addons/yapb/conf/yapb.cfg && \
    sed -i "s|yb_difficulty \"3\"|yb_difficulty \"${YB_DIFFICULTY}\"|" addons/yapb/conf/yapb.cfg && \
    sed -i "s|yb_radio_mode \"2\"|yb_radio_mode \"${YB_RADIO_MODE}\"|" addons/yapb/conf/yapb.cfg && \
    sed -i "s|mp_timelimit 20|mp_timelimit ${MP_TIMELIMIT}|" ../cs16/cstrike/server.cfg && \
    sed -i "s|gamedll_linux \"dlls/cs.so\"|gamedll_linux \"addons/yapb/bin/yapb.so\"|" ../cs16/cstrike/liblist.gam

RUN find addons/yapb/data/graph -name "*_cz.graph" -delete && \
    chmod 755 addons/yapb/data/* && \
    mv -f addons ../cs16/cstrike && \
    ln -sf linux32 sdk32 && \
    touch ../cs16/cstrike/listip.cfg && \
    touch ../cs16/cstrike/banned.cfg

WORKDIR /opt/hlds/cs16

ENTRYPOINT ["./hlds_run"]
CMD ["-game", "cstrike", "-insecure", "-pingboost", "3", "-norestart", "-maxplayers", "32", "+sys_ticrate", "1024", "+sv_lan", "1", "+map", "de_dust2"]

STOPSIGNAL SIGINT
