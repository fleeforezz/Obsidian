---
tags:
  - homelab
  - service
status: running
host: proxmox-pve
port: 3000
last-updated: 2026-05-11
banner: https://user-images.githubusercontent.com/82196/194725622-39ce271c-34e5-414d-be53-62d221811f88.png
banner-display: cover
banner-fade: "-100"
content-start: "300"
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
- Runs on: [[Docker]], [[04 - Self_Learning/HomeLab_Services/Containerize/Portainer/Portainer|Portainer]]
- Needs: [[Docker]], [[Docker Compose]], [[Data-Storage]], [[04 - Self_Learning/HomeLab_Services/Dashboard/Home Page/Homepage|Homepage]]

## Common tasks
- Restart: `sudo docker restart homepage`
- Logs: `sudo watch docker logs homepage`

## Gotchas
+ Setup External Storage using NFS
+ Config Trusted Hostname

## Change history
- 2026-05-11 — created