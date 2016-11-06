FROM inkton/nest.net

MAINTAINER nest.yt

# set up package cache
RUN apt-get update -y && apt-get install -y sudo git jq && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    chmod +x /etc/my_init.d/start-app.sh

# set env var for packages cache
ENV DOTNET_HOSTING_OPTIMIZATION_CACHE /var/packagescache

WORKDIR "/var/app"

EXPOSE 5000
