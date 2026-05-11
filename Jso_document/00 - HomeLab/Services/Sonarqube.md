---
tags:
  - homelab
  - service
status: running
host: proxmox-pve
port: 9000
last-updated: 2026-05-11
---
# Sonarqube

## Purpose
For automated testing while running CI/CD pipeline

## Access
- URL: http://dev.local:9000
- Credentials: see [[passwords]]

## Config location
- Main config: /opt/sonarqube
- Data/volumes (docker volume): sonarqube_data, sonarqube_extensions, sonarqube_logs
- Env: /opt/sonarqube/.env

## Dependencies
+ Runs on: [[Docker]]
- Needs: [[Docker]], [[Docker Compose]], [[04 - Self_Learning/HomeLab_Services/Development/Sonarqube/Sonarqube|Sonarqube]]

## Common tasks
- Restart: `sudo docker restart sonarqube`
- Logs: `journalctl -u untitled -f`

## Gotchas


## Change history
- 2026-05-11 — created