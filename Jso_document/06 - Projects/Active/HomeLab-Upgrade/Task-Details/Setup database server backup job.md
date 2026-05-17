---
tags:
  - project
started: 2026-05-15
deadline:
next-action:
---
# Setup backup job for Database Server 

## Goal
Backup all database with 2 layer backup (Local backup, External backup)

## AIO backup layer
+ Config location: `/usr/local/bin/docker-db-backup.sh`
+ Nas location: `/mnt/nfs-backup/databases`
+ Local backup location: `/opt/backups/databases`
```sh
#!/bin/bash
set -Eeuo pipefail

DATE=$(date +"%Y-%m-%d_%H-%M-%S")

# ==========================================
# Backup locations
# ==========================================
NFS_BACKUP="/mnt/nfs-backup/databases"
LOCAL_BACKUP="/opt/backups/databases"

# ==========================================
# Retention
# ==========================================
RETENTION_DAYS=14

# ==========================================
# Containers
# ==========================================
MARIADB_PROD_CONTAINER="mariadb-production-db-1"
MYSQL_DEV_V97_CONTAINER="mysql-dev-v9.7.0"
MYSQL_PROD_V97_CONTAINER="mysql-prod-v9.7.0"
POSTGRES_PROD_V16_CONTAINER="postgres-prod-v16"
POSTGRES_PROD_V18_CONTAINER="postgres-prod-v18"
IMMICH_CONTAINER="postgres-immich"

# ==========================================
# Credentials
# ==========================================
MYSQL_ROOT_PASSWORD="TMNNT012928637160822863716"
MARIADB_ROOT_PASSWORD="TMNNT012928637160822863716"
POSTGRES_USER="jso"

# ==========================================
# Create directories
# ==========================================
mkdir -p "$NFS_BACKUP"/{mariadb-prod,mysql-dev-v97,mysql-prod-v97,postgres-prod-v16,postgres-prod-v18,immich}
mkdir -p "$LOCAL_BACKUP"/{mariadb-prod,mysql-dev-v97,mysql-prod-v97,postgres-prod-v16,postgres-prod-v18,immich}

# ==========================================
# MariaDB Prod
# ==========================================
echo "[+] Backing up MariaDB Prod..."

MARIADB_PROD_FILE="$NFS_BACKUP/mariadb-prod/mariadb_prod_$DATE.sql.gz"

docker exec "$MARIADB_PROD_CONTAINER" \
  sh -c "mariadb-dump -uroot -p'$MARIADB_ROOT_PASSWORD' \
  --all-databases \
  --single-transaction \
  --quick \
  --routines \
  --triggers" \
  | gzip > "$MARIADB_PROD_FILE"

cp "$MARIADB_PROD_FILE" "$LOCAL_BACKUP/mariadb-prod/"

# ==========================================
# MySQL dev v9.7
# ==========================================
echo "[+] Backing up MySQL dev 9.7..."

MYSQL_DEV_V97_FILE="$NFS_BACKUP/mysql-dev-v97/mysql-dev-v97_$DATE.sql.gz"

docker exec "$MYSQL_DEV_V97_CONTAINER" \
  sh -c "mysqldump -uroot -p'$MYSQL_ROOT_PASSWORD' \
  --all-databases \
  --single-transaction \
  --quick \
  --routines \
  --triggers" \
  | gzip > "$MYSQL_DEV_V97_FILE"

cp "$MYSQL_DEV_V97_FILE" "$LOCAL_BACKUP/mysql-dev-v97/"

# ==========================================
# MySQL prod v9.7
# ==========================================
echo "[+] Backing up MySQL prod 9.7..."

MYSQL_PROD_V97_FILE="$NFS_BACKUP/mysql-prod-v97/mysql-prod-v97_$DATE.sql.gz"

docker exec "$MYSQL_PROD_V97_CONTAINER" \
  sh -c "mysqldump -uroot -p'$MYSQL_ROOT_PASSWORD' \
  --all-databases \
  --single-transaction \
  --quick \
  --routines \
  --triggers" \
  | gzip > "$MYSQL_PROD_V97_FILE"

cp "$MYSQL_PROD_V97_FILE" "$LOCAL_BACKUP/mysql-prod-v97/"

# ==========================================
# PostgreSQL prod V16
# ==========================================
echo "[+] Backing up PostgreSQL prod V16..."

PG_PROD_V16_FILE="$NFS_BACKUP/postgres-prod-v16/postgres-prod-v16_$DATE.sql.gz"

docker exec "$POSTGRES_PROD_V16_CONTAINER" \
  pg_dumpall -U "$POSTGRES_USER" \
  | gzip > "$PG_PROD_V16_FILE"

cp "$PG_PROD_V16_FILE" "$LOCAL_BACKUP/postgres-prod-v16/"

# ==========================================
# PostgreSQL prod V18
# ==========================================
echo "[+] Backing up PostgreSQL prod V18..."

PG_PROD_V18_FILE="$NFS_BACKUP/postgres-prod-v18/postgres-prod-v18_$DATE.sql.gz"

docker exec "$POSTGRES_PROD_V18_CONTAINER" \
  pg_dumpall -U "$POSTGRES_USER" \
  | gzip > "$PG_PROD_V18_FILE"

cp "$PG_PROD_V18_FILE" "$LOCAL_BACKUP/postgres-prod-v18/"

# ==========================================
# Immich PostgreSQL 17
# ==========================================
echo "[+] Backing up Immich PostgreSQL..."

IMMICH_FILE="$NFS_BACKUP/immich/immich_$DATE.sql.gz"

docker exec "$IMMICH_CONTAINER" \
  pg_dumpall -U "$POSTGRES_USER" \
  | gzip > "$IMMICH_FILE"

cp "$IMMICH_FILE" "$LOCAL_BACKUP/immich/"

# ==========================================
# Verify backups
# ==========================================
echo "[+] Verifying backup files..."

find "$NFS_BACKUP" -type f -name "*.gz" -exec gzip -t {} \;

# ==========================================
# Cleanup old backups
# ==========================================
echo "[+] Removing old backups..."

find "$NFS_BACKUP" -type f -mtime +$RETENTION_DAYS -delete
find "$LOCAL_BACKUP" -type f -mtime +$RETENTION_DAYS -delete

echo "[✓] All backups completed successfully."
```

## Cron job
```sh
sudo crontab -e
```
```sh
#========== DATABASE BACKUP ==========#
30 1 * * * /usr/local/bin/docker-db-backup.sh
```

## Progress log
- 2026-05-15 — project started