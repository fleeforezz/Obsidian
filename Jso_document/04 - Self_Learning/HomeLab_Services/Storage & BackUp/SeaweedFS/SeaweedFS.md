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
    image: chrislusf/seaweedfs # use a remote image
    ports:
      - 9333:9333
      - 19333:19333
      - 9324:9324
    command: 'master -ip=master -ip.bind=0.0.0.0 -metricsPort=9324'
    healthcheck:
      test: ["CMD", "wget", "--spider", "-q", "http://monitoring.local:3000/api/health"]
      interval: 30s
      timeout: 5s
      retries: 3
      start_period: 30s

  volume:
    image: chrislusf/seaweedfs # use a remote image
    ports:
      - 8081:8080
      - 18080:18080
      - 9325:9325
    command: 'volume -ip=volume -master="master:9333" -ip.bind=0.0.0.0 -port=8081 -metricsPort=9325'
    depends_on:
      - master
    healthcheck:
      test: ["CMD", "wget", "--spider", "-q", "http://monitoring.local:3000/api/health"]
      interval: 30s
      timeout: 5s
      retries: 3
      start_period: 30s

  filer:
    image: chrislusf/seaweedfs # use a remote image
    ports:
      - 8888:8888
      - 18888:18888
      - 9326:9326
    command: 'filer -ip=filer -master="master:9333" -ip.bind=0.0.0.0 -metricsPort=9326'
    tty: true
    stdin_open: true
    depends_on:
      - master
      - volume
    healthcheck:
      test: ["CMD", "wget", "--spider", "-q", "http://monitoring.local:3000/api/health"]
      interval: 30s
      timeout: 5s
      retries: 3
      start_period: 30s

  s3:
    image: chrislusf/seaweedfs # use a remote image
    ports:
      - 8333:8333
      - 9327:9327
    command: 's3 -filer="filer:8888" -ip.bind=0.0.0.0 -metricsPort=9327'
    depends_on:
      - master
      - volume
      - filer
    healthcheck:
      test: ["CMD", "wget", "--spider", "-q", "http://monitoring.local:3000/api/health"]
      interval: 30s
      timeout: 5s
      retries: 3
      start_period: 30s

  webdav:
    image: chrislusf/seaweedfs # use a remote image
    ports:
      - 7333:7333
    command: 'webdav -filer="filer:8888"'
    depends_on:
      - master
      - volume
      - filer
    healthcheck:
      test: ["CMD", "wget", "--spider", "-q", "http://monitoring.local:3000/api/health"]
      interval: 30s
      timeout: 5s
      retries: 3
      start_period: 30s

#  prometheus:
#    image: prom/prometheus:v2.21.0
#    ports:
#      - 9001:9090
#    volumes:
#      - ./prometheus:/etc/prometheus
#    command: '--web.enable-lifecycle --config.file=/etc/prometheus/prometheus.yml'
#    depends_on:
#      - s3
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