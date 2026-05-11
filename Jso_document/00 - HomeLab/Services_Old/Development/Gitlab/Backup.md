# Backing up all Gitlab configs and files
### 1. Create a backup

```sh
sudo gitlab-backup create
```

Files with be at:

```sh
/var/opt/gitlab/backups
```

**The backup includes**
+ Repositories
+ Database
+ Uploads / artifacts
+ CI data

### 2. Push backup to NFS (Truenas)

**Mount NFS** (Just for backup)

```sh
sudo mount -t nfs truenas.local:/mnt/SlowZ1/Backup /mnt/backup
```

**Copy backup**

```sh
sudo rsync -av /var/opt/gitlab/backups/ /mnt/backup/gitlab/
```

### 3. Auto backup (cron)

```sh
sudo crontab -e
```

Add:

```sh
0 2 * * * gitlab-backup create && rsync -a /var/opt/gitlab/backups/ /mnt/backup/gitlab/
```

-> Every 02:00 AM

### 4. Restore whenever needed

**Copy from backup**

```sh
cp /mnt/backup/gitlab/*.tar /var/opt/gitlab/backups/
```

**Stop service**

```sh
sudo gitlab-ctl stop puma
sudo gitlab-ctl stop sidekiq
```

**Restore**

```sh
sudo gitlab-backup restore BACKUP=timestamp
```

**Start gitlab again**

```sh
sudo gitlab-ctl start
```

# Using 3 layer backup

**Layers**

```sh
Layer 1: Local  (fast, restore immidiately)
Layer 2: NAS    (save under LAN)
Layer 3: Offsite (prevent from fire, ransomware)
```

**Overall architecture**

```sh
GitLab Server
   ├── /var/opt/gitlab/backups        (local)
   ├── rsync → NFS (TrueNAS)          (NAS)
   └── rclone → S3 / cloud storage    (Offsite)
```

## Layer 1 - Local Backup

**Create a run script**

```sh
sudo nano /usr/local/bin/gitlab-backup.sh
```

```sh
#!/bin/bash
set -e

echo "[+] Creating GitLab backup..."
gitlab-backup create

echo "[+] Cleaning old local backups (keep 7 days)..."
find /var/opt/gitlab/backups -type f -mtime +7 -delete
```

**Permission**

```sh
sudo chmod +x /usr/local/bin/gitlab-backup.sh
```

**Cron-Job**

```sh
sudo crontab -e
```

```sh
0 1 * * * /usr/local/bin/gitlab-backup.sh
```

-> backup every day at 01:00 AM

## Layer 2 - NFS (Truenas)

**Mount NFS**

```sh
sudo mkdir -p /mnt/backup
sudo mount -t nfs 10.0.1.34:/mnt/SlowZ1/Backup /mnt/backup
```

**Sync Script**

```sh
sudo nano /usr/local/bin/gitlab-backup-nas.sh
```

```sh
#!/bin/bash
set -e

echo "[+] Sync to NAS..."
rsync -av --delete /var/opt/gitlab/backups/ /mnt/backup/gitlab/

echo "[+] Cleaning NAS backups (keep 14 days)..."
find /mnt/backup/gitlab -type f -mtime +14 -delete
```

**Cron-Job**

```sh
30 1 * * * /usr/local/bin/gitlab-backup-nas.sh
```

## Layer 3 - Offsite (S3 / Cloud / SeadweedFS)

**Install rclone**

```sh
sudo apt install rclone -y
```

**Config**

```sh
rclone config
```

-> Create remote:

```sh
Name: s3-backup
Type: S3
```

**Sync script**

```sh
sudo nano /usr/local/bin/gitlab-backup-offsite.sh
```

```sh
#!/bin/bash
set -e

echo "[+] Upload to offsite..."
rclone sync /mnt/backup/gitlab s3-backup:gitlab-backup

echo "[+] Done"
```

**Cron-Job**

```sh
0 3 * * * /usr/local/bin/gitlab-backup-offsite.sh
```

## Recap

| Layer   | Days to keep |
| ------- | ------------ |
| Local   | 7 days       |
| NAS     | 14-30 days   |
| Offsite | 30-90 days   |
