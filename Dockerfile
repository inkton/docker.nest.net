FROM microsoft/aspnetcore-build

MAINTAINER nest.yt

ADD start-app.sh /etc/

RUN apt-get update -y && \
    apt-get install -y python-pip python-dev build-essential vim inetutils-ping && \
    mkdir /usr/local/tree && \
    git clone https://github.com/inkton/nest.git /usr/local/tree/nest && \
    git clone https://github.com/inkton/nester.git /usr/local/tree/nester && \
    pip install --upgrade pip virtualenv daemonize logging requests jsonpickle Texttable && \
    cd /usr/local/tree/nester && make install && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*  && \ 
    chmod +x /etc/start-app.sh

WORKDIR "/var/app"

CMD ["/etc/start-app.sh"]
