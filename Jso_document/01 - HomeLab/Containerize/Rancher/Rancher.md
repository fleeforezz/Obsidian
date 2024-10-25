# Install

> [!note]
> Make sure you have [[Docker]] installed

```shell
docker run -d --restart=unless-stopped -p 9091:80 -p 9092:443 --privileged -v /opt/rancher:/var/lib/rancher --name=rancher_docker_server rancher/rancher:latest
```
