FROM golang:trixie

ARG LYREBIRD_VER=0.6.1

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y locales && \
    echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
    locale-gen

RUN apt-get clean -y && \
    apt-get autoremove -y && \
    apt-get autopurge -y && \
    rm -vrf /var/lib/apt.lists/*

COPY lyrebird-lyrebird-${LYREBIRD_VER}.tar.gz /

RUN mkdir -v /lyrebird-build && \
    cd /lyrebird-build && \
    tar xvf ../lyrebird-lyrebird-${LYREBIRD_VER}.tar.gz && \
    cd lyrebird-lyrebird-${LYREBIRD_VER} && \
    CGO_ENABLED=1 go build -ldflags="-X main.lyrebirdVersion=${LYREBIRD_VER}" -v -o lyrebird ./cmd/lyrebird && \
    strip -sv lyrebird
