#FROM microsoft/aspnetcore-build
FROM microsoft/dotnet:2.0.0-preview1-sdk-jessie

MAINTAINER nest.yt

ADD start-app.sh /etc/

RUN apt-get update -y && \
    apt-get install -y sudo git unzip jq rsync python-pip python-dev openssh-server build-essential vim inetutils-ping && \
    curl -sSL https://aka.ms/getvsdbgsh | bash /dev/stdin -v latest -l /vsdbg && \
    mkdir /usr/local/tree && \
    git clone https://github.com/inkton/nest.git /usr/local/tree/nest && \
    git clone https://github.com/inkton/nester.git /usr/local/tree/nester && \
    pip install --upgrade pip virtualenv daemonize logging requests jsonpickle Texttable && \
    cd /usr/local/tree/nester && make install && \
    chmod +x /etc/start-app.sh && \
    mkdir /var/run/sshd && \
    echo 'root:hello' | chpasswd && \
    sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd && \
    echo "export VISIBLE=now" >> /etc/profile

ENV NOTVISIBLE "in users profile"

WORKDIR "/var/app"

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]


