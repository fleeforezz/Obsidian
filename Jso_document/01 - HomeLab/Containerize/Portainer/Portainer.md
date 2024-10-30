---
banner: https://domopi.eu/content/images/2021/02/image-2.jpg
content-start: "300"
banner-display: cover
banner-fade: "-100"
---

## Install

> [!note]
> Make sure you have [[Docker]] and [[Docker Compose]] installed

```shell
sudo docker run -d \
              --name="portainer" \
              --restart on-failure \
              -p 9000:9000 \
              -p 8000:8000 \
              -v /var/run/docker.sock:/var/run/docker.sock \
              -v portainer_data:/data \
                portainer/portainer-ce:latest
```

## Update

> **Remember to backup first**

```bash
docker stop portainer
```

```bash
docker rm portainer
```

```bash
docker pull portainer/portainer-ce:latest
```

```bash
docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
```

## Uninstall

```shell
sudo su
```

```shell
docker rm --force portainer
```

```shell
docker rmi portainer/portainer-ce
```

```shell
docker volume rm portainer_data
```

