
> Make sure you have [[Docker]] and [[Docker Compose]]

```yaml
---
version: "2.1"
services:
  syncthing:
    image: lscr.io/linuxserver/syncthing:latest
    container_name: syncthing
    hostname: syncthing #optional
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Asia/HoChiMinh
    volumes:
      - /path/to/appdata/config:/config
      - /path/to/data1:/data1
      - /path/to/data2:/data2
    ports:
      - 8123:8384
      - 22000:22000/tcp
      - 22000:22000/udp
      - 21027:21027/udp
    restart: unless-stopped
```
