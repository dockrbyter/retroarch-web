# Retroarch-Web
[![Docker Pulls](https://img.shields.io/docker/pulls/dockrbyter/retroarch-web.svg)](https://hub.docker.com/r/dockrbyter/retroarch-web)
[![Image Size](https://img.shields.io/docker/image-size/dockrbyter/retroarch-web.svg)](https://hub.docker.com/r/dockrbyter/retroarch-web)

## HOW TO ⚙️
##### Open Firewall Ports:
 - 80/TCP

### DOCKER RUN
```bash
docker run -d --rm --name retroarch-web -p 80:80 dockrbyter/retroarch-web:latest
```

### DOCKER COMPOSE
#### Download DDOCKER COMPOSE FILE
```bash
mkdir -p $HOME/retroarch-web
cd $HOME/retroarch-web
curl https://raw.githubusercontent.com/dockrbyter/retroarch-web/master/docker-compose.yml docker-compose.yml
```

#### RUN DOCKER COMPOSE FILE
```bash
docker-compose up -d
```

##### Origin
Based on https://github.com/libretro/RetroArch/tree/master/pkg/emscripten,  
forked from https://github.com/Inglebard/dockerfiles  
