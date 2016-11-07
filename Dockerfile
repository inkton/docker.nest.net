FROM inkton/nest.net

MAINTAINER nest.yt

ADD nester /usr/local/nester

# set up package cache
RUN cd /usr/local/nester && make install && \
    apt-get update && \
    apt-get install -y vim inetutils-ping && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
