FROM ubuntu:xenial

MAINTAINER connorxxl <christian.flaig@gmail.com>

RUN apt update && \
    apt full-upgrade -y && \
    apt install -y curl python-software-properties software-properties-common supervisor ca-certificates procps && \
    apt-add-repository -y multiverse && \
    add-apt-repository -y ppa:jcfp/ppa && \
    add-apt-repository -y ppa:jcfp/sab-addons && \
    apt update && \
    apt install -y sabnzbdplus && \
    apt install -y python-yenc unzip unrar && \
    apt install -y par2-tbb && \
    apt -y autoremove && \
    apt-get -y clean

RUN mkdir -p /config && \
    mkdir -p /volumes/incomplete && \
    mkdir -p /volumes/complete && \
    mkdir -p /volumes/watch

EXPOSE 8080

VOLUME ["/config"]
VOLUME ["/volumes/incomplete"]
VOLUME ["/volumes/complete"]
VOLUME ["/volumes/watch"]

CMD ["/usr/bin/sabnzbdplus","--config-file","/config","--server",":8080","--console"]
