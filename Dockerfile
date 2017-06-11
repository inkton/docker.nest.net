FROM microsoft/aspnetcore-build:2.0.0-preview1-jessie

MAINTAINER nest.yt

ENV ASPNETCORE_ENVIRONMENT Development
ENV NUGET_XMLDOC_MODE skip

RUN apt-get update && \
	apt-get install -y python-pip python-dev rsync && \
	git clone https://github.com/inkton/nester.git /usr/local/nester && \
	cd /usr/local/nester && make install

WORKDIR "/var/app"

