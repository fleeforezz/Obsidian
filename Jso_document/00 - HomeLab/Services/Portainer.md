---
tags:
  - homelab
  - service
status: running
host: proxmox-pve
port: 9443
last-updated: 2026-05-11
---
# Portainer

## Purpose
For centralize all others portainer agents, aslo for testing new images.

## Access
- URL: https://dev.local:9443
- Credentials: see [[passwords]]

## Config location
- Main config: /opt/portainer
- Data/volumes (docker volume): portainer_data 
- Network (docker network): portainer_network
+ Env: no info
## Dependencies
+ Runs on: [[Docker]]
- Needs: [[Docker]], [[Docker Compose]], [[04 - Self_Learning/HomeLab_Services/Containerize/Portainer/Portainer|Portainer]]

## Common tasks
- Restart: `sudo docker restart portainer`
- Logs: `sudo watch docker logs portainer`
- Update: `sudo docker compose down portainer && sudo docker compose up -d`

## Gotchas
+ Cannot add docker secrets like swarm mode
+ Hard to backup docker containers

## Change history
- 2026-05-11 — created