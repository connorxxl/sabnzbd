FROM ubuntu:xenial

MAINTAINER connorxxl <christian.flaig@gmail.com>

RUN apt-get update
RUN apt-get install -y curl python-software-properties software-properties-common supervisor ca-certificates procps
RUN apt-add-repository -y multiverse
RUN add-apt-repository -y ppa:jcfp/ppa
RUN apt-get update
RUN apt-get install -y sabnzbdplus
#sabnzbdplus-theme-classic sabnzbdplus-theme-mobile sabnzbdplus-theme-plush
RUN apt-get install -y par2 python-yenc unzip unrar
RUN apt-get -y autoremove
RUN apt-get -y clean

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
