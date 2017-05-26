# wordpress-indieweb-docker
## setup
### install 
<!-- @setup -->
```bash
brew install docker
brew install docker-compose
brew cask install docker
brew install   docker-machine-driver-xhyve

```

### create machine
<!-- @machine -->
```bash
docker-machine create wordpress-indieweb-docker --driver xhyve
```

## run
<!-- @run -->
```bash
eval $(docker-machine env wordpress-indieweb-docker)
docker-machine start wordpress-indieweb-docker
docker-compose build
docker-compose up -d
```



## dependencies
aaronpk oh and double check but i think OYS needs Redis and OYG does not
# indieauth
* Sinatra
* nginx reverse proxy
* `bundle exec thin`
