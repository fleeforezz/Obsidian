# Install

> [!note]
> Make sure you have [[Docker]] and [[Docker Compose]]

# Docker

> Create a folder name HASS

```shell
mkdir HomeAssistant
```

```shell
sudo docker run -d \
  --name=homeassistant \
  --net=host \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Asia/Ho_Chi_Minh \
  -p 8123:8123 `#optional` \
  -v /home/nhat/HomeAssistant:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/homeassistant:latest
```
--> WebUi: `http://localhost:8123` 

# Docker Compose (Reccommend)

```yaml
version: '3'
services:
  homeassistant:
    container_name: homeassistant
    image: "ghcr.io/home-assistant/home-assistant:stable"
    volumes:
      - /App/HomeAssistant/config:/config
      - /slowZ1/DataStore/Navidrome/music:/media
      - /etc/localtime:/etc/localtime:ro
    restart: unless-stopped
    privileged: true
    network_mode: host
```

# 404 problem

> If you using SSL using [[Nginx Proxy Manager]] with HomeAssistant you have to add extra config in the `configuration.yml` file.

```shell
http:
    use_x_forwarded_for: true
    trusted_proxies:
        - 0.0.0.0/0
        - 192.168.1.0/24
```
--> Restart home assistant to take effect
