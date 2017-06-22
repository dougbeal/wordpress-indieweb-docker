FROM composer:1.4

ENV appdir /app
ENV app ${appdir}/ownyourgram.com

RUN mkdir -p ${appdir}

RUN cd /usr/local/bin \
    && curl -L https://github.com/kelseyhightower/confd/releases/download/v0.11.0/confd-0.11.0-linux-amd64 -o confd \
    && chmod +x confd \
    && mkdir -p /etc/confd/{conf.d,templates}

WORKDIR ${app}

ADD ownyourgram.com /app/ownyourgram.com
