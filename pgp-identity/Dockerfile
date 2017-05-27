# similar https://github.com/redmatter/docker-gpg-s3sync
# cat setup.json |  docker run -i  ubuntu /bin/bash -c 'cat'
# echo "indieauth verify msg" | docker run -i 
FROM alpine

RUN apk add --no-cache \
    gnupg
    
ENV appdir /app 
ENV app ${appdir}/pgp-identity 
ENV GPG_TTY /dev/console

RUN mkdir -p ${app}/public-key
WORKDIR ${app}
ADD gpg.batch ${app}

RUN gpg --generate-key --batch gpg.batch && \
    gpg --armor --export -a "Docker Temp Identity" > ${app}/public.key

ENTRYPOINT ["gpg", "--clearsign", "--armor"]
