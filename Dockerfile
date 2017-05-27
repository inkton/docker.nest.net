#FROM microsoft/aspnetcore-build
FROM microsoft/dotnet:2.0.0-preview1-sdk-jessie

MAINTAINER nest.yt

ADD start-app.sh /etc/

RUN apt-get update -y && \
    apt-get install -y sudo git unzip jq rsync python-pip python-dev build-essential vim inetutils-ping && \
    curl -sSL https://aka.ms/getvsdbgsh | bash /dev/stdin -v latest -l /vsdbg && \
    mkdir /usr/local/tree && \
    git clone https://github.com/inkton/nest.git /usr/local/tree/nest && \
    git clone https://github.com/inkton/nester.git /usr/local/tree/nester && \
    pip install --upgrade pip virtualenv daemonize logging requests jsonpickle Texttable && \
    cd /usr/local/tree/nester && make install && \
    chmod +x /etc/start-app.sh

WORKDIR "/var/app"
