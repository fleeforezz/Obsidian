---
tags:
  - homelab
  - service
status: running
host: proxmox-pve
port: 9333
last-updated: 2026-05-11
---
# Seaweed

## Purpose
A S3 block storage for webapps

## Access
- URL: http://dev.local:9333
- Credentials: see [[passwords]]

## Config location
- Main config: /opt/seaweed-fs
- Data/volumes: 

## Dependencies
- Runs on: [[Docker]]
- Needs: [[Docker]], [[Docker Compose]], [[SeaweedFS]]

## Core Configuration

```yaml
version: '3.9'

services:
  master:
    image: chrislusf/seaweedfs # Sử dụng image chính thức từ Hub
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
      - ./data:/data # Ánh xạ thư mục lưu trữ dữ liệu
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

**Component details:**
+ Master (Port 9333): The coordinator of the SeaweedFS cluster. It handles volume-to-server mapping and leader election.
+ Volume Server (Port 8080): This is where the actual files are stored. You can scale this by adding more volume services with different directories.
+ Filer (Port 8888): Acts as a gateway, providing a standard HTTP file system interface. It typically stores metadata in a database like LevelDB or PostgreSQL.
+ S3 (Port 8333): An optional layer that provides [S3-compatible API](https://seaweedfs.com/docs/deploy/) access to your files.
## Common tasks
- Restart: `systemctl restart untitled`
- Logs: `journalctl -u untitled -f`
- Update: 

## Gotchas


## Change history
- 2026-05-11 — created