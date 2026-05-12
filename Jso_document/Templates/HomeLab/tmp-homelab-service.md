---
tags:
  - homelab
  - service
status: running
host: <% tp.system.prompt("Host machine? (e.g. proxmox-vm-01)") %>
port: <% tp.system.prompt("Port number?") %>
last-updated: <% tp.date.now("YYYY-MM-DD") %>
banner: <% tp.system.prompt("Banner?") %>
banner-display: cover
banner-fade: "-100"
content-start: "300"
---
# <% tp.file.title %>

## Purpose
<% tp.system.prompt("What does this service do?") %>

## Access
- URL: http://<% tp.system.prompt("IP address?") %>:<% tp.frontmatter.port %>
- Credentials: see [[passwords]]

## Config location
- Main config: 
- Data/volumes: 

## Dependencies
- Runs on: [[<% tp.frontmatter.host %>]]
- Needs: [[]]

## Common tasks
- Restart: `systemctl restart <% tp.file.title.toLowerCase() %>`
- Logs: `journalctl -u <% tp.file.title.toLowerCase() %> -f`
- Update: 

## Gotchas


## Change history
- <% tp.date.now("YYYY-MM-DD") %> — created