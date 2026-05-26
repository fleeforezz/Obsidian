---
tags:
  - homelab
  - monitoring
  - service
status: running
last-updated: 2026-05-26
banner: "[[04 - Self_Learning/attachments/uptime_kuma_banner.png]]"
banner-display: cover
banner-fade: "-100"
content-start: "300"
---
# Uptime Kuma

## Purpose
Uptime Kuma is a self-hosted monitoring tool that helps monitor the availability and response times of network services, websites, databases, and containers, sending alerts when systems go offline.

## Deployment Configuration
Uptime Kuma is run inside a Docker container.

### Docker Compose
```yaml
version: "3"
services:
  uptime-kuma:
    image: louislam/uptime-kuma:1
    container_name: uptime-kuma
    volumes:
      - ./data:/app/data
      - /var/run/docker.sock:/var/run/docker.sock # Optional: for Docker container monitor
    ports:
      - 3001:3001
    restart: unless-stopped
```

## Monitor Types Supported
- **HTTP(s)**: Check if a website returns 200 OK or matches a specific response keyword.
- **TCP Port**: Verify if a specific port on an IP/hostname is open.
- **Ping**: Monitor ping response times.
- **DNS**: Query DNS records to check resolving servers.
- **Docker Container**: Check if a container is running using the local Docker socket.
- **Push**: Set up passive monitoring (Uptime Kuma waits for a GET/POST request from a cronjob or script).

## Common Tasks
- **Check SMTP configuration**: For configuring email notifications, see [[04 - Self_Learning/HomeLab_Services/Monitoring/Uptime Kuma/Config SMTP notification for uptime kuma|Config SMTP notification for uptime kuma]].
- **Restart**: `docker restart uptime-kuma`
- **Backup**: Copy the `kuma.db` SQLite database inside the `./data` directory.

## Gotchas
- **Database Locks**: Uptime Kuma uses SQLite. Do not access or modify the database file (`kuma.db`) from another process while Uptime Kuma is running, as it will cause write locks and database corruption.
- **Disk Usage**: With many monitors and long-running history, the database file can grow quickly. Configure the **Shrink Database** or history retention limits in settings to keep DB size small.
