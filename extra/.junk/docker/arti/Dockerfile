FROM rust:slim-trixie

ARG ARTI_VER=1.5.0

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y pkg-config libssl-dev libsqlite3-dev locales && \
    echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
    locale-gen

RUN apt-get clean -y && \
    apt-get autoremove -y && \
    apt-get autopurge -y && \
    rm -vrf /var/lib/apt.lists/*

COPY arti-arti-v${ARTI_VER}.tar.gz /

RUN mkdir -v /arti-build && \
    cd /arti-build && \
    tar xvf ../arti-arti-v${ARTI_VER}.tar.gz && \
    cd arti-arti-v${ARTI_VER} && \
    cargo build -p arti --locked --release && \
    strip -sv target/release/arti
