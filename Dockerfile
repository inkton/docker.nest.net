FROM inkton/nest.net

MAINTAINER nest.yt

# set up package cache
RUN apt-get update && \
    apt-get install -y vim inetutils-ping && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
