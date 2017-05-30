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
docker-machine create indieweb --driver xhyve
```

## run
<!-- @run -->
```bash
eval $(docker-machine env indieweb)
export COMPOSE_PROJECT_NAME=indieweb
docker-machine start indieweb
docker-compose build
docker-compose -p indieweb up -d
```
### debug up, use project name indieweb
<!-- @debug -->
```bash
docker-compose -f docker-compose.yml -f debug.yml -p indieweb up -d
```



## dependencies
aaronpk oh and double check but i think OYS needs Redis and OYG does not
# indieauth
* Sinatra
* nginx reverse proxy
* `bundle exec thin`
