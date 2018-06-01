# wordpress-indieweb-docker
## setup
### install 
<!-- @setup @docker -->
```bash
brew install docker
brew install docker-compose
brew cask install docker
brew install   docker-machine-driver-xhyve

```
### wordpress combined Dockefile
must be run from README.md directory :(
`(cd ~/git/wordpress-indieweb-docker/ &&  mdrip --label wordpress --label dockerfile --mode test README.md )`
#### preq
<!-- @preq @wordpress @dockerfile -->
```
brew install jq
brew install gnu-sed
```
#### install
<!-- @install @wordpress @dockerfile -->
```
shopt -s expand_aliases
alias sed=$(which gsed)
cd wordpress/docker-library-wordpress
source ./update.sh

```
### create machine
<!-- @machine -->
```bash
docker-machine create wordpress-indieweb-docker --driver xhyve
```

### (Create confd Alpine package for runtime config templating)[https://github.com/kelseyhightower/confd/blob/master/docs/installation.md]
<!-- @build @confd -->
```
cd deps/confd
docker build -t confd_builder -f Dockerfile.build.alpine .
docker run -ti --rm -v $(pwd):/app confd_builder ./build
cd -
```

## run
<!-- @run -->
```bash
eval $(docker-machine env wordpress-indieweb-docker)
export COMPOSE_PROJECT_NAME=indieweb
docker-machine start wordpress-indieweb-docker
docker-compose build
docker-compose -p indieweb up -d
```
### debug up, use project name indieweb
<!-- @debug -->
```bash
docker-compose -f docker-compose.yml -f debug.yml -p indieweb up -d
```

## wordpress 
### themes
<!-- @wordpress @theme -->
```
docker exec indieweb_wordpress_1 wp --allow-root theme install --activate SemPress 
```

### plugins
<!-- @wordpress @plugin -->
```
docker exec indieweb_wordpress_1 wp --allow-root plugin install --activate indieweb 
    
```


## dependencies
aaronpk oh and double check but i think OYS needs Redis and OYG does not
# indieauth
* Sinatra
* nginx reverse proxy
* `bundle exec thin`


# rebuild specific container
docker-compose -f docker-compose.yml build webserver-quill

You can only do one mapping between container and host port, so need
seperate webservers for wordpress and quill
