FROM inkton/nest.net

MAINTAINER nest.yt

ADD nester /usr/local/nester
# set up package cache
RUN apt-get update && \
    apt-get install -y build-essential vim inetutils-ping && \
    cd /usr/local/nester && make install && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
