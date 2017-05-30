# similar https://github.com/redmatter/docker-gpg-s3sync
# cat setup.json |  docker run -i  ubuntu /bin/bash -c 'cat'
# echo "indieauth verify msg" | docker run -i 
FROM alpine

RUN apk add --no-cache \
    gnupg
    
ENV appdir /app 
ENV app ${appdir}/pgp-identity
ENV dest ${app}/public-key
ENV GPG_TTY /dev/console

RUN mkdir -p ${app}/public-key
WORKDIR ${app}
ADD gpg.batch ${app}
ADD entrypoint.sh ${app}

RUN gpg --generate-key --batch gpg.batch \
    && echo "dest ${dest}" \
    && addgroup -S nginx \  
    && adduser -D -S -h /var/cache/nginx -s /sbin/nologin -G nginx nginx \    
    && gpg --armor --export -a "Docker Temp Identity" > ${dest}/public-key.asc \
    && cd ${dest} \
    && chown -R nginx:nginx * \
    && stat ${dest}/public-key.asc \
    && cat ${dest}/public-key.asc 

ENTRYPOINT ["./entrypoint.sh"]
