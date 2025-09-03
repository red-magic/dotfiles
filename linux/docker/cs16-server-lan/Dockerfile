FROM debian:13-slim

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y lib32stdc++6 curl xz-utils && \
    apt-get install -y locales && \
    echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
    locale-gen

RUN mkdir -v /var/hlds && \
    chmod -v 700 /var/hlds && \
    useradd -r -M -s "$(command -v nologin)" -d /var/hlds -c "Counter-Strike 1.6 Dedicated Server" hlds && \
    chown -v hlds:hlds /var/hlds

RUN apt-get clean -y && \
    apt-get autoremove -y && \
    apt-get autopurge -y && \
    rm -vrf /var/lib/apt/lists/*

USER hlds

RUN mkdir -v /var/hlds/.steam && \
    cd /var/hlds/.steam && \
    ln -sfv . steam && \
    curl -L https://steamcdn-a.akamaihd.net/client/steamcmd_linux.tar.gz | tar zxvf - -C . && \
    for i in {1..3}; do ./steamcmd.sh +force_install_dir /var/hlds/cs16 +login anonymous +app_update 90 validate +quit; done && \
    curl -L https://github.com/yapb/yapb/releases/download/4.4.957/yapb-4.4.957-linux.tar.xz | tar Jxvf - -C .

RUN cd /var/hlds/.steam && \
    chmod -v 755 addons/yapb/data/* && \
    mv -vf addons ../cs16/cstrike && \
    ln -sfv linux32 sdk32

RUN cd /var/hlds && \
    sed -i 's|yb_radio_mode "2"|yb_radio_mode "0"|' cs16/cstrike/addons/yapb/conf/yapb.cfg && \
    sed -i 's|yb_difficulty "3"|yb_difficulty "0"|' cs16/cstrike/addons/yapb/conf/yapb.cfg && \
    sed -i 's|yb_quota "0"|yb_quota "16"|' cs16/cstrike/addons/yapb/conf/yapb.cfg && \
    sed -i 's|yb_quota_mode "normal"|yb_quota_mode "fill"|' cs16/cstrike/addons/yapb/conf/yapb.cfg && \
    sed -i 's|mp_timelimit 20|mp_timelimit 0|' cs16/cstrike/server.cfg && \
    echo "rcon_password qwerty123456" >> cs16/cstrike/server.cfg

WORKDIR /var/hlds/cs16

CMD ["./hlds_run", "-game", "cstrike", "-secure", "-pingboost", "3", "+sv_lan", "1", "+map", "de_dust2", "-dll", "cstrike/addons/yapb/bin/yapb.so"]
