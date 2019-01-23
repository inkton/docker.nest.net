FROM microsoft/dotnet:2.1-sdk-stretch

MAINTAINER nest.yt

ENV ASPNETCORE_ENVIRONMENT Development
ENV NUGET_XMLDOC_MODE skip
ENV DEBIAN_FRONTEND=noninteractive

ADD run.sh /run.sh

RUN apt-get update && \
	apt-get install -y vim jq python-pip python-dev mariadb-client sudo unzip rsync dropbear && \
	dotnet tool install -g dotnet-reportgenerator-globaltool && \
	rm /etc/dropbear/dropbear_dss_host_key /etc/dropbear/dropbear_rsa_host_key && \
	curl -sSL https://aka.ms/getvsdbgsh | bash /dev/stdin -v latest -l /vsdbg && \
	git clone https://github.com/inkton/nester.cli.git /usr/local/nester && \
	chmod +x /usr/sbin/dropbear && \
	chmod +x /run.sh && \
	cd /usr/local/nester && make install

# add the nest.yt dropbear
ADD bin/dropbear /usr/sbin/dropbear

WORKDIR "/var/app"

EXPOSE 22

CMD ["/run.sh"]
