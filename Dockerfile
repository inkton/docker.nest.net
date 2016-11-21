FROM inkton/nest.net

MAINTAINER nest.yt

ADD forest /usr/local/tree
# set up package cache
RUN apt-get update && \
    apt-get install -y python-pip python-dev python-libuser build-essential vim inetutils-ping && \
    pip install --upgrade pip  && \
    pip install --upgrade virtualenv  && \
    cd /usr/local/tree/nester && make install && \
    rm /etc/my_init.d/start-app.sh && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

