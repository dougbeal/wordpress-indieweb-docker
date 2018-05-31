FROM php:7.2-alpine

ADD docker-entrypoint.sh /docker-entrypoint.sh
RUN bash -x /docker-entrypoint.sh php-fpm
ADD php-fpm.conf /usr/local/etc/   
