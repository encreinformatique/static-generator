FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
  php-cli php-intl php-mbstring php-xml \
  git curl

RUN curl -sL https://deb.nodesource.com/setup_18.x -o /tmp/nodesource_setup.sh

RUN apt-get update && apt-get install -y nodejs

RUN apt-get install -y npm

COPY --chmod=0755 generator.sh /usr/bin/generator
COPY --chmod=0755 entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
