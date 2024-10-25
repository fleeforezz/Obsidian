
> Make sure you have [[Docker]] and [[Docker Compose]]

```yaml
---
version: "3.9"
services:
  homer:
      image: b4bz/homer:22.02.1 # Have to use this version in oder to work fine
      container_name: homer
      volumes:
        - /home/nhat/docker/homer:/www/assets
      ports:
        - 8092:8080
      #environment:
      #  - UID=1000
      #  - GID=1000
      restart: unless-stopped
```

