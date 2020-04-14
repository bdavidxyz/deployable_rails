# README

## Create Ruby-on-Rails application

```
$> docker-compose build
$> docker-compose run --rm runner
root@0c0e5a712d21:/app# create_new_rails_app 6.0.2.2
```
in another terminal type
```
dcr -p 127.0.0.1:3000:3000 rails 
```

in another terminal type
```
dcr webpacker
```

## Restart from scratch

```
$> docker stop $(docker ps -a -q)
$> docker rm $(docker ps -a -q)
$> docker rmi $(docker images -q) -f
$> docker volume prune

$> rm -rf -v !(".dockerenv"|".gitignore"|"README.md"|"docker-compose.yml") && rm .browserslistrc && rm .ruby-version
```
