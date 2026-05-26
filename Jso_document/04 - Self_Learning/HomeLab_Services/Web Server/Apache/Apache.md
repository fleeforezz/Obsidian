---
tags:
  - homelab
  - webserver
  - service
status: running
last-updated: 2026-05-26
banner: "[[04 - Self_Learning/attachments/apache_banner.png]]"
banner-display: cover
banner-fade: "-100"
content-start: "300"
---
# Apache HTTP Server

## Purpose
The Apache HTTP Server is a powerful, flexible, and widely-used web server. It uses a module-based structure that allows administrators to easily enable or disable additional functionality.

## Core Concepts

### Virtual Hosts
Virtual Hosts allow Apache to host multiple independent websites/domains on a single server machine. Each site has its own configuration block.

```apache
<VirtualHost *:80>
    ServerName yourdomain.com
    ServerAlias www.yourdomain.com
    DocumentRoot /var/www/yourdomain/public_html
    ErrorLog /var/www/yourdomain/logs/error.log
    CustomLog /var/www/yourdomain/logs/access.log combined
</VirtualHost>
```

### Modules
- **`mod_rewrite`**: Allows URL rewriting on the fly (very common for CMS applications). Enabled using `sudo a2enmod rewrite`.
- **`mod_ssl`**: Enables HTTPS connections. Enabled using `sudo a2enmod ssl`.
- **`mod_headers`**: Allows control and editing of HTTP response headers.

## Configuration Guides
- [[04 - Self_Learning/HomeLab_Services/Web Server/Apache/Getting ready for install Apache|Getting ready for install Apache]]: Prerequisite server configuration steps (hostname, hosts, SSH keys).
- [[04 - Self_Learning/HomeLab_Services/Web Server/Apache/Install Apache|Install Apache]]: Detailed package installation, firewall rules, and virtual host deployment commands.

## Common Operations
- **Reload Configuration (preferred)**: `sudo systemctl reload apache2`
- **Restart Web Server**: `sudo systemctl restart apache2`
- **Test Config File Syntax**: `sudo apachectl configtest`
