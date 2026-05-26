---
tags:
  - homelab
  - dashboard
  - learning
status: learning
last-updated: 2026-05-26
banner: "[[04 - Self_Learning/attachments/homer_banner.png]]"
banner-display: cover
banner-fade: "-100"
content-start: "300"
---
# Homer Dashboard

## Purpose
Homer is a very simple, static, self-hosted homepage/dashboard for your home server services. It is configured entirely via a single YAML file and generates a lightweight HTML page.

## Deployment Configuration
Homer runs easily inside a Docker container.

### Docker Compose
```yaml
version: "3"
services:
  homer:
    image: b4ux1t3/homer:latest
    container_name: homer
    volumes:
      - ./assets:/www/assets
    ports:
      - 8090:8080
    user: 1000:1000 # Set user to prevent permission issues on assets folder
    restart: unless-stopped
```

## Basic `config.yml` Example
Place this in your mapped `./assets/config.yml` path:

```yaml
title: "HomeLab Dashboard"
subtitle: "Overview of local services"
logo: "assets/logo.png"

header: true
footer: '<p>Created with ❤️ in my HomeLab</p>'

# Optional messaging
message:
  title: "Welcome!"
  content: "All systems operational."

services:
  - name: "Infrastructure"
    icon: "fas fa-cloud"
    items:
      - name: "Proxmox"
        logo: "assets/tools/proxmox.png"
        subtitle: "Virtualization"
        url: "https://192.168.1.33:8006"
        target: "_blank"
      - name: "Pi-hole"
        logo: "assets/tools/pihole.png"
        subtitle: "DNS & Adblocker"
        url: "http://192.168.1.5"
        target: "_blank"
```

## Common Tasks
- **Restart Container**: `docker restart homer`
- **View Container Logs**: `docker logs -f homer`
- **Validation**: Whenever you modify `config.yml`, make sure to validate the YAML syntax using an online tool or CLI linter to avoid loading errors.

## Gotchas
- **Browser Cache**: Homer is a static site. Sometimes when you update `config.yml`, the browser will keep the cached old config. Do a hard reload (`Ctrl + F5` or `Cmd + Shift + R`) to force an update.
- **Permission Denied**: Ensure the user ownership of the `./assets` directory matches the user running the container, otherwise Homer won't be able to read `config.yml`.
