
> [!note]
> Make sure you have [[Docker]] and  [[Docker Compose]]

```yaml
version: '3'
services:
  wg-easy:
    container_name: wg-easy
    environment:
      - LANG=en
      - WG_HOST=<your ip or domain name here>
      - PASSWORD=<a-long-str06-pa5sw0rD-Her3>
    volumes:
      - ./wg-easy:/etc/wireguard
    ports:
      - 51820:51820/udp
      - 51821:51821/tcp
    cap_add:
      - NET_ADMIN
      - SYS_MODULE
    sysctls:
      - net.ipv4.conf.all.src_valid_mark=1
      - net.ipv4.ip_forward=1
    restart: unless-stopped
    image: ghcr.io/wg-easy/wg-easy
```

