FROM docker:dind

RUN apk add --update openjdk8 git openssh openssh-client bash curl pass

COPY init.sh /tmp/init.sh

RUN chmod +x /tmp/init.sh

RUN curl -sSL https://git.io/get-mo -o mo && \
    chmod +x mo && \
    mv mo /usr/local/bin/

