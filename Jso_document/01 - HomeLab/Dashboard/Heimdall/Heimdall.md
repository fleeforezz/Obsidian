---
banner: https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/heimdall-banner.png
content-start: "300"
banner-display: cover
banner-fade: "-100"
---

## Install

> [!note] 
> Make sure you have [[Docker]] and [[Docker Compose]]
### Docker

```docker
docker run -d \
  --name=heimdall \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Etc/UTC \
  -p 80:80 \
  -p 443:443 \
  -v /path/to/heimdall/config:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/heimdall:latest
```

Remember to change:
- Timezone
- Path data

### Docker-Compose (Recommend)

```yaml
---
services:
  heimdall:
    image: lscr.io/linuxserver/heimdall:latest
    container_name: heimdall
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC # Change me
    volumes:
      - /path/to/heimdall/config:/config # Change me
    ports:
      - 80:80
      - 443:443
    restart: unless-stopped
```

### Update 

> Update Image

```docker
docker-compose pull heimdall
```

> Update container

```docker
docker-compose up -d heimdall
```

> You can remove the old dangling images

```docker
docker image prune
```
#### Read more
[[01 - HomeLab/Dashboard/Heimdall/Custom Css|Custom Css]]
