---
tags:
  - project
status: active
started: 2026-05-24
deadline:
next-action:
---
# Setup backup job for Pi-hole

## Goal
Backup all pihole config, DNS records, Domain

## What's need to be backup

| Data                                | Location                           |
| ----------------------------------- | ---------------------------------- |
| Pi-hole config                      | `/etc/pi-hole/`                    |
| DNSMasq config                      | `/etc/dnsmasq.d/`                  |
| Gravity DB (block lists)            | `/etc/pihole/gravity.db`           |
| Custom DNS entries                  | `/etc/hosts` or Local DNS settings |
| DHCP leases (if using Pi-hole DHCP) | `/etc/pihole/dhcp.leases`          |

## Manual backup
Pi-hole has built-in backup/export.

Open:
- Admin UI
- Settings
- Teleporter

Export:
- Adlists
- Clients
- Local DNS
- DHCP
- Groups

Restore on another Pi-hole anytime.

## Local backup layer
+ Config location: `/usr/local/bin/pihole-backup.sh`
+ Local backup location: `/var/opt/backups/pihole`
```sh
#!/bin/bash
set -e

BACKUP_DIR="/opt/backups/pihole"
DATE=$(date +%Y-%m-%d_%H-%M)

echo "[+] Creating backup dir at $BACKUP_DIR"
mkdir -p $BACKUP_DIR

echo "[+] Backing up pi-hole"
tar czf $BACKUP_DIR/pihole-$DATE.tar.gz \
    /etc/pihole \
    /etc/dnsmasq.d

echo "[+] Cleaning old backups (keep 7 days)..."
find $BACKUP_DIR -type f -mtime +7 -delete

echo "[+] Done"
```

## External backup layer (nas)
+ Config location: `/usr/local/bin/pihole-backup-nas.sh`
+ Nas location: `/mnt/nas-backup/pihole/`
```sh
#!/bin/bash
set -e

LOCAL_BACKUP_DIR="/opt/backups/pihole"
NAS_BACKUP_DIR="/mnt/nfs-backup/"

echo "[+] Creating backup dir at $NAS_BACKUP_DIR"
mkdir -p $NAS_BACKUP_DIR

echo "[+] Syncing to NAS..."
sudo rsync -rtv --delete --no-owner --no-group ${LOCAL_BACKUP_DIR} ${NAS_BACKUP_DIR}

echo "[+] Cleaning NAS backups (keep 14 days)..."
find ${NAS_BACKUP_DIR} -type f -mtime +14 -delete

echo "[+] Done"
```

## Cronjob
```sh
sudo crontab -e
```
```sh
#========== LOCAL BACKUP ==========#
0 1 * * * /usr/local/bin/pihole-backup.sh >> /var/log/pihole-backup.log 2>&1

#========== NAS BACKUP ==========#
30 1 * * * /usr/local/bin/pihole-backup-nas.sh >> /var/log/pihole-backup-nas.log 2>&1
```
## Progress log
- 2026-05-24 — project started