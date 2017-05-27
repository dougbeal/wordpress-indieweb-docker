FROM ruby:2.4-alpine

RUN echo "ipv6" >> /etc/modules

ENV appdir /app
ENV app ${appdir}/indieauth.com
ENV RACK_ENV development


RUN mkdir ${appdir}



# https://github.com/gliderlabs/docker-alpine/issues/24
RUN apk add --no-cache \
    alpine-sdk \
    build-base \
    git \
    gpgme \
    gpgme-dev \
    libassuan-dev \
    libgpg-error-dev \
    libxml2-dev \
    libxslt-dev \
    linux-headers \
    ruby-dev 

WORKDIR ${app}
ADD indieauth.com ${app}

# https://github.com/gliderlabs/docker-alpine/issues/53#issuecomment-172272511
RUN bundle config build.nokogiri --use-system-libraries && \
    bundle config build.gpgme --use-system-libraries && \
    bundle install 

ENV tiller_base ${app}/tiller
ADD tiller ${app}/tiller
# install config templating to supply dynamic docker config to indieauth
RUN gem install tiller --no-ri --no-rdoc



ADD docker-entrypoint.sh entrypoint.sh

CMD ["./entrypoint.sh"]
