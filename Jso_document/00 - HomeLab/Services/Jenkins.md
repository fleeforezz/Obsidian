---
tags:
  - homelab
  - service
status: running
host: proxmox-pve
port: 8080
last-updated: 2026-05-12
banner: https://www.mitrais.com/wp-content/uploads/2018/02/News-Blog-Thumbnail-Jenkins.jpg
banner-display: cover
banner-fade: "-100"
content-start: "300"
---
# Jenkins

## Purpose
A CI/CD server

## Access
- URL: http://jenkins.local:8080
- Credentials: see [[passwords]]

## Config location
- Main config: /var/lib/jenkins
- Backup scripts: /usr/local/bin/jenkins-backup.sh  
- Backup dir: /opt/backups/jenkins/

## Dependencies
- Runs on: [[Linux]]
- Needs: [[Docker]], [[Docker Compose]], [[Jenkin]]

## Common tasks
+ Start: `systemctl start jenkins`
- Restart: `systemctl restart jenkins`
- Stop: `systemctl stop jenkins`
- Status: `systemctl status jenkins`
- Logs: `journalctl -u untitled -f`
- Update: 
	- `sudo apt update`
	- `sudo apt install jenkins`
	- `sudo systemctl restart jenkins`

## Gotchas


## Change history
- 2026-05-12 — created