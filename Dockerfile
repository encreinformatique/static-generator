FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
  php-cli php-intl php-mbstring php-xml \
  git

RUN curl -sL https://deb.nodesource.com/setup_18.x -o /tmp/nodesource_setup.sh

RUN apt-get update && apt-get install -y nodejs

COPY generator.sh /usr/bin/generator

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
