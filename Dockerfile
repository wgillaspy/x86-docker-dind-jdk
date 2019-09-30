FROM docker:dind

RUN apk add --update openjdk8 git openssh openssh-client bash curl

COPY init.sh /tmp/init.sh

RUN chmod +x /tmp/init.sh

RUN mkdir -p /etc/docker/

COPY daemon.json /etc/docker/daemon.json

RUN curl -sSL https://git.io/get-mo -o mo && \
    chmod +x mo && \
    mv mo /usr/local/bin/

