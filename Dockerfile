FROM inkton/nest.net

MAINTAINER nest.yt

# set up package cache
RUN apt-get update && \
    apt-get install -y python-pip python-dev build-essential vim inetutils-ping && \
    mkdir /usr/local/tree && \
    git clone https://github.com/inkton/nest.git /usr/local/tree/nest && \
    git clone https://github.com/inkton/nester.git /usr/local/tree/nester && \
    pip install --upgrade pip virtualenv daemonize && \
    cd /usr/local/tree/nester && make install && \
    rm /etc/my_init.d/start-app.sh && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

