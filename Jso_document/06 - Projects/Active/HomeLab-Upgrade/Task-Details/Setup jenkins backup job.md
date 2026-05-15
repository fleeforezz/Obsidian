---
tags:
  - project
started: 2026-05-14
deadline:
next-action:
---
# Setup backup job for Jenkins

## Goal
Backup Jenkins workspaces pipelines and config

## External backup layer (NAS)
+ Config location: `/usr/local/bin/jenkins-backup-nas.sh`
+ NAS location: `/mnt/nfs-backup`
```sh
#!/bin/bash
set -e

# =========================
# CONFIG
# =========================
BACKUP_DIR="/opt/backups/jenkins"
NAS_DIR="/mnt/nfs-backup"

echo "[+] Sync to NAS..."
sudo rsync -rtv --delete --no-owner --no-group "$BACKUP_DIR" "${NAS_DIR}"

echo "[+] Backup completed"

# Clean nas backups (keep for 14 days)
echo "[+] Cleaning NAS backups (keep 14 days)..."
find "$BACKUP_DIR" -type f -name "*.tar.gz" -mtime +14 -delete

echo "[+] Old backups cleaned"
```

## Local backup layer
+ Config location: `/usr/local/bin/jenkins-backup.sh`
+ Local backup location: `/opt/backups/jenkins`

```sh
#!/bin/bash
set -e

# =========================
# CONFIG
# =========================
BACKUP_DIR="/opt/backups/jenkins"
JENKINS_HOME="/var/lib/jenkins"
DATE=$(date +%Y-%m-%d_%H-%M-%S)

mkdir -p "$BACKUP_DIR"

echo "[+] Starting Jenkins backup..."

# Optional: stop Jenkins for consistent backup
systemctl stop jenkins

# Create compressed archive
tar -czf "$BACKUP_DIR/jenkins_$DATE.tar.gz" \
    --exclude='workspace/*' \
    --exclude='caches/*' \
    "$JENKINS_HOME"

# Start Jenkins again
systemctl start jenkins

echo "[+] Backup completed"

# Remove backups older than 7 days
find "$BACKUP_DIR" -type f -name "*.tar.gz" -mtime +7 -delete

echo "[+] Old backups cleaned"
```

## Cronjob
```sh
sudo crontab -e
```
```sh
#========== LOCAL BACKUP ==========#
0 1 * * * /usr/local/bin/jenkins-backup.sh

#========== NAS BACKUP ==========#
30 1 * * * /usr/local/bin/jenkins-backup-nas.sh
```

## Restore
If disaster happens:

```
systemctl stop jenkins
```

Extract:

```
tar -xzf jenkins_2026-05-12_02-00-00.tar.gz -C /
```

Fix permissions:

```
chown -R jenkins:jenkins /var/lib/jenkins
```

Start Jenkins:

```
systemctl start jenkins
``````

## Progress log
- 2026-05-14 — project started