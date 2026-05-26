---
tags:
  - homelab
  - storage
  - service
status: running
last-updated: 2026-05-26
banner: "[[04 - Self_Learning/attachments/seaweedfs_banner.png]]"
banner-display: cover
banner-fade: "-100"
content-start: "300"
---
# SeaweedFS distributed storage

## Purpose
SeaweedFS is a fast, highly-scalable distributed file system designed to store and serve billions of files quickly. It supports S3-compatible APIs, making it a great backend storage option for self-hosted apps.

## Architecture & Components

SeaweedFS splits storage operations into distinct, specialized roles:
- **Master Server**: Handles volume management and acts as coordinator. It does NOT serve files directly, which prevents metadata bottlenecks.
- **Volume Server**: Manages raw storage pools. It writes and reads files inside huge volume blocks (super-files) to optimize disk I/O.
- **Filer**: Gateway interface providing standard file operations (directories, Unix-like mount points, HTTP APIs).
- **S3 API Layer**: Bridges standard S3 client connections (AWS SDKs, MinIO client) to the Filer backend.

## Recommended Docker Compose Setup

```yaml
version: '3.9'

services:
  master:
    image: chrislusf/seaweedfs
    command: master -ip=master
    ports:
      - "9333:9333"
      - "19333:19333"

  volume:
    image: chrislusf/seaweedfs
    command: volume -mserver="master:9333" -port=8080 -ip=volume
    ports:
      - "8080:8080"
      - "18080:18080"
    volumes:
      - ./data:/data
    depends_on:
      - master

  filer:
    image: chrislusf/seaweedfs
    command: filer -master="master:9333"
    ports:
      - "8888:8888"
      - "18888:18888"
    depends_on:
      - master
      - volume

  s3:
    image: chrislusf/seaweedfs
    command: s3 -filer="filer:8888"
    ports:
      - "8333:8333"
    depends_on:
      - filer
```

## Common Operations

### Checking Cluster Health
You can access the Master WebUI directly at `http://<ip-address>:9333` to view volume layouts and replication states.

### Mounting SeaweedFS locally (Filer Mount)
To mount SeaweedFS directories on local Linux clients as standard file systems:
`weed mount -filer=filer:8888 -dir=/mnt/seaweedfs`

## Gotchas
- **Filer Metadata Database**: By default, Filer stores filesystem directories/metadata using an embedded LevelDB engine. While fast, LevelDB cannot be shared. If running multi-master/replicated filer gateways, you must configure a shared SQL database (e.g. MySQL, PostgreSQL) or NoSQL (Cassandra, Redis) in `filer.toml`.
- **Large Files**: SeaweedFS breaks files larger than 8MB into smaller chunks on volume servers. When requesting large files, Filer aggregates these chunks dynamically.
- **Data Replication**: Replication is defined at the volume creation level (e.g., `000` for no replication, `001` for replication on different racks). Make sure replication settings match your hardware availability.