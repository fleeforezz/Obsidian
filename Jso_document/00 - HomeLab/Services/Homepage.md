---
tags:
  - homelab
  - service
status: running
host: proxmox-pve
port: 3000
last-updated: 2026-05-11
---
# Homepage

## Purpose
A visual dashboard for all services

## Access
- URL: http://dev.local:3000
- Credentials: see [[passwords]]

## Config location
- Main config: /opt/homepage
- Data/volumes: /mnt/homepage-data/Homepage
- Env: /mnt/homepage-data/Homepage/.env

## Dependencies
- Runs on: [[]]
- Needs: [[Docker]]

## Common tasks
- Restart: `systemctl restart untitled`
- Logs: `journalctl -u untitled -f`
- Update: 

## Gotchas


## Change history
- 2026-05-11 — created