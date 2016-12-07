FROM inkton/nest.net

MAINTAINER nest.yt

# set up package cache
RUN apt-get update && \
    apt-get install -y python-pip python-dev build-essential vim inetutils-ping && \
    git clone https://github.com/inkton/nester.git /usr/local/tree/nester && \
    pip install --upgrade pip virtualenv daemonize logging requests && \
    cd /usr/local/tree/nester && make install && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

