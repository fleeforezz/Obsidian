---
tags:
  - homelab
  - storage
  - service
status: running
last-updated: 2026-05-26
banner: "[[04 - Self_Learning/attachments/nextcloud_banner.png]]"
banner-display: cover
banner-fade: "-100"
content-start: "300"
---
# Nextcloud

## Purpose
Nextcloud is a suite of client-server software for creating and using file hosting services. It provides file sync and share, calendar, contacts, mail, and other collaboration tools.

## Architecture
Nextcloud runs on a standard LAMP/LEMP stack:
- **Webserver**: Apache or Nginx
- **Database**: MariaDB or PostgreSQL
- **PHP**: Runs PHP code with extensions for database connection, image rendering, and caching.
- **Cache**: Redis or APCu (recommended for performance)

## Recommended Setup (Docker Compose)
Using the official `lscr.io/linuxserver/nextcloud` image simplifies dependency management and updates.

```yaml
version: "2.1"
services:
  nextcloud:
    image: lscr.io/linuxserver/nextcloud:latest
    container_name: nextcloud
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Asia/Ho_Chi_Minh
    volumes:
      - /opt/nextcloud/config:/config
      - /mnt/storage/nextcloud/data:/data
    ports:
      - 10020:443
    restart: unless-stopped
```

## Detailed Installation & Configuration
For manual setup and Docker AIO (All-in-One) instructions, see:
- [[04 - Self_Learning/HomeLab_Services/Storage & BackUp/NextCloud/Install NextCloud|Install NextCloud]]

## Performance & Security Optimizations (Gotchas)

- **Trusted Domains**: If you access Nextcloud via a reverse proxy (e.g. `nextcloud.yourdomain.com`), you must configure the proxy IP and hostname in Nextcloud's configuration file `/var/www/nextcloud/config/config.php` or `/config/www/nextcloud/config/config.php`:
  ```php
  'trusted_domains' => 
  array (
    0 => 'localhost',
    1 => '192.168.1.100', // Server IP
    2 => 'nextcloud.yourdomain.com', // Proxy URL
  ),
  ```
- **Memory Limit**: Nextcloud needs at least 512MB memory limit in `php.ini` (`memory_limit = 512M`).
- **Memory Caching**: To fix warning "No memory cache has been configured", enable APCu in config.php:
  `'memcache.local' => '\OC\Memcache\APCu',`
