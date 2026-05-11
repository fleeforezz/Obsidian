
> [!note]
> Make sure you have [[Docker]] and [[Install Guacamole with Docker]]

```yaml
---
version: "2.1"
services:
  qbittorrent:
    image: lscr.io/linuxserver/qbittorrent:latest
    container_name: qbittorrent
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Asia/HoChiMinh
      - WEBUI_PORT=10095
    volumes:
      - /path/to/appdata/config:/config
      - /path/to/downloads:/downloads
    ports:
      - 10095:10095
      - 6881:6881
      - 6881:6881/udp
    restart: unless-stopped
```
Username : admin
Password : adminadmin