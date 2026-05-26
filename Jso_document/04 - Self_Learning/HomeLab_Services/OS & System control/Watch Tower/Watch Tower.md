---
tags:
  - homelab
  - service
  - containerize
status: running
last-updated: 2026-05-26
banner: "[[04 - Self_Learning/attachments/watch_tower_banner.png]]"
banner-display: cover
banner-fade: "-100"
content-start: "300"
---
# Watchtower

## Purpose
Watchtower is an application that monitors running Docker containers and automatically updates them to the latest image version published to the registry.

## Deployment Configuration
Watchtower is best run as a background Docker container.

```yaml
version: "3"
services:
  watchtower:
    image: containrrr/watchtower
    container_name: watchtower
    restart: unless-stopped
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
    environment:
      - TZ=Asia/Ho_Chi_Minh
      - WATCHTOWER_CLEANUP=true
      - WATCHTOWER_POLL_INTERVAL=86400 # Poll every 24 hours
```

## Common Tasks

- **Start/Run (One-time check)**:
  `docker run --rm -v /var/run/docker.sock:/var/run/docker.sock containrrr/watchtower --run-once`
- **Check Logs**:
  `docker logs -f watchtower`
- **Restart watchtower**:
  `docker restart watchtower`

## Gotchas

- **Auto-Update Risks**: Watchtower updates containers automatically, which can break services if a major version contains breaking changes.
- **Excluding Containers**: To prevent Watchtower from updating a specific container, add the label `com.centurylinklabs.watchtower.enable=false` to that container.
- **Docker Socket Security**: Mounting `/var/run/docker.sock` gives Watchtower root-level control over the Docker daemon. Ensure only trusted images are run.
