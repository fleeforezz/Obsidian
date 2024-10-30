---
banner: https://quoc9x.com/wp-content/uploads/2022/05/rancher-logo-1.png
content-start: "300"
banner-display: cover
banner-fade: "-100"
---

## Install

> [!note]
> Make sure you have [[Docker]] installed

```shell
docker run -d --restart=unless-stopped -p 9091:80 -p 9092:443 --privileged -v /opt/rancher:/var/lib/rancher --name=rancher_docker_server rancher/rancher:latest
```
