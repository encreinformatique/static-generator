FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
  php-cli php-intl php-mbstring php-xml \
  git

COPY generator.sh /usr/bin/generator

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
