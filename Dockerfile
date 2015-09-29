FROM ubuntu:trusty

MAINTAINER connorxxl <christian.flaig@gmail.com>

RUN apt-get update && \
    apt-get install -y curl python-software-properties software-properties-common supervisor ca-certificates procps && \
    apt-add-repository -y multiverse && \
    add-apt-repository -y ppa:jcfp/ppa && \
    apt-get update && \
    apt-get install -y \
      sabnzbdplus sabnzbdplus-theme-classic sabnzbdplus-theme-mobile sabnzbdplus-theme-plush \
      par2 python-yenc unzip unrar && \
    apt-get -y autoremove && \
    apt-get -y clean

RUN mkdir -p /config && \
    mkdir -p /volumes/incomplete && \
    mkdir -p /volumes/complete

EXPOSE 8080

VOLUME ["/config"]
VOLUME ["/volumes/incomplete"]
VOLUME ["/volumes/complete"]

CMD ["/usr/bin/sabnzbdplus","--config-file","/config","--server",":8080","--console"]
