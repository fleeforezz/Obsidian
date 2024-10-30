---
banner: https://miro.medium.com/v2/resize:fit:1200/1*DpdendagBOaOfsvcKG6wcQ.png
content-start: "300"
banner-display: cover
banner-fade: "-100"
---

## Install

> [!note]
> Make sure you have [[Docker]] and [[Docker Compose]]
## Quick start

```docker
docker run -p 8080:80 lissy93/dashy
```

## Docker

```docker
sudo docker run -d \\
  -p 8080:80 \\
  -v /root/my-local-conf.yml:/app/public/conf.yml \\
  --name my-dashboard \\
  --restart=always \\
  lissy93/dashy:latest
```

## Docker Compose (Recommended)

```yaml
---
version: "3.8"
services:
  dashy:
    # To build from source, replace 'image: lissy93/dashy' with 'build: .'
    # build: .
    image: lissy93/dashy
    container_name: Dashy
    # Pass in your config file below, by specifying the path on your host machine
    # volumes:
      # - /root/my-config.yml:/app/public/conf.yml
    ports:
      - 4000:80
    # Set any environmental variables
    environment:
      - NODE_ENV=production
    # Specify your user ID and group ID. You can find this by running `id -u` and `id -g`
    #  - UID=1000
    #  - GID=1000
    # Specify restart policy
    restart: unless-stopped
    # Configure healthchecks
    healthcheck:
      test: ['CMD', 'node', '/app/services/healthcheck']
      interval: 1m30s
      timeout: 10s
      retries: 3
      start_period: 40s
```
