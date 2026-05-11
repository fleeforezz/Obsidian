---
tags:
  - homelab
  - service
status: running
host: proxmox-pve
port: 3002
last-updated: 2026-05-11
---
# External Uptime Kuma

## Purpose
To monitoring if external services which have domain and public to outside networks are online or not

## Access
- URL: http://dev.local:3002
- Credentials: see [[passwords]]

## Config location
- Main config: /opt/external-uptime-kuma
- Data/volumes: /mnt/homepage-data/External-Uptime-Kuma/data

## Dependencies
- Runs on: [[Docker]], [[04 - Self_Learning/HomeLab_Services/Containerize/Portainer/Portainer|Portainer]]
- Needs: [[Docker]], [[Docker Compose]], [[Data-Storage]], [[Uptime Kuma]]

## Common tasks
- Restart: `sudo docker restart internal-uptime-kuma`
- Logs: `sudo watch docker logs internal-uptime-kuma`
- Update: `sudo docker compose down external-uptime-kuma && sudo docker compose up -d`

## Gotchas


## Change history
- 2026-05-11 — created