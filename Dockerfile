FROM microsoft/dotnet:2.0.0-preview1-sdk-jessie

MAINTAINER nest.yt

RUN mkdir /var/app && \
    git clone https://github.com/inkton/nest.git /var/app/nest

WORKDIR "/var/app"

CMD /var/app/nest/utils/start 
