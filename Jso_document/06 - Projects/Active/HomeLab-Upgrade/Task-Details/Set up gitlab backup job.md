---
tags:
  - project
started: 2026-05-14
deadline:
next-action:
---
# Setup backup for Gitlab

## Goal
Backup all gitlab repositories and database

## External backup layer (nas)
+ Config location: `/usr/local/bin/gitlab-backup-nas.sh`
+ Nas location: `/mnt/nas-backup/gitlab/`

```sh
#!/bin/bash
set -e

echo "[+] Sync to NAS..."
sudo rsync -rtv --delete --no-owner --no-group /var/opt/gitlab/backups/ /mnt/nas-backup/gitlab/

echo "[+] Cleaning NAS backups (keep 14 days)..."
find /mnt/nas-backup/gitlab -type f -mtime +14 -delete
```

## Local backup layer
+ Config location: `/usr/local/bin/gitlab-backup.sh`
+ Local backup location: `/var/opt/gitlab/backups/`
```sh
#!/bin/bash
set -e

echo "[+] Creating GitLab backup..."
gitlab-backup create

echo "[+] Cleaning local backups (keep 7 days)..."
find /var/opt/gitlab/backups -type f -mtime +7 -delete
```

## Cronjob
```sh
sudo crontab -e
```
```sh
#========== LOCAL BACKUP ==========#
0 1 * * * /usr/local/bin/gitlab-backup.sh

#========== NAS BACKUP ==========#
30 1 * * * /usr/local/bin/gitlab-backup-nas.sh
```

## Script to extract all gitlab repository
```sh
mkdir -p /home/jso/exported-source

for repo in /home/jso/recovered-repos-full/; do
  for repodir in "$repo"*.git; do
    repo_name=$(basename "$repodir" .git)
    
    # Get short name from remote URL or use hash
    remote_name=$(git -C "$repodir" remote get-url origin 2>/dev/null | sed 's/.*\///' | sed 's/\.git//')
    if [ -z "$remote_name" ]; then
      remote_name="${repo_name:0:8}"  # use first 8 chars of hash as fallback
    fi

    echo "=========================================="
    echo "Exporting repo: $remote_name"

    # Loop through all branches
    git -C "$repodir" branch -a | sed 's/\s*//g' | sed 's/remotes\/origin\///' | sort -u | while read branch; do
      echo "  -> Exporting branch: $branch"
      dest="/home/jso/exported-source/$remote_name/$branch"
      mkdir -p "$dest"
      git -C "$repodir" archive "$branch" | tar -x -C "$dest"
      echo "     Saved to: $dest"
    done
  done
done
```

## Progress log
- 2026-05-14 — project started