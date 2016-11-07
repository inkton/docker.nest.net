FROM inkton/nest.net

MAINTAINER nest.yt

ADD forest /usr/local/forest
# set up package cache
RUN apt-get update && \
    apt-get install -y python-pip python-dev build-essential vim inetutils-ping && \
    pip install --upgrade pip  && \
    pip install --upgrade virtualenv  && \
    cd /usr/local/forest/nester && make install && \
    chmod 777 /etc/container_environment && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

