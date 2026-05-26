---
tags:
  - homelab
  - backup
  - storage
status: running
last-updated: 2026-05-26
banner: "[[04 - Self_Learning/attachments/syncthing_banner.png]]"
banner-display: cover
banner-fade: "-100"
content-start: "300"
---
# Syncthing

## Purpose
Syncthing is a continuous file synchronization program. It synchronizes files between two or more computers in real time, safely protected from prying eyes.

## How it works (P2P Syncing)
Unlike cloud services (like Nextcloud or Google Drive), Syncthing does not require a central server. It synchronizes directly between peer devices:
- **Device ID**: Each device has a unique cryptographic identifier (Device ID). To connect two devices, you must exchange these IDs.
- **Folders**: You select specific folders to share and assign permissions (Send Only, Receive Only, Send & Receive).

## Deployment & Setup Guide
For Docker Compose configuration instructions, see:
- [[04 - Self_Learning/HomeLab_Services/Storage & BackUp/Syncthing/Install Syncthing|Install Syncthing]]

## Core Ports
If running behind a firewall or containerized, make sure the following ports are mapped/allowed:
- **`8384` (TCP)**: Web GUI access (strictly local or proxy only).
- **`22000` (TCP & UDP)**: Data synchronization traffic.
- **`21027` (UDP)**: Local discovery broadcasts.

## Gotchas
- **System File Limits (Linux)**: Syncthing monitors folders for changes in real time. On Linux, this might exhaust the file watcher limit. Increase the `fs.inotify.max_user_watches` system value by running:
  `echo "fs.inotify.max_user_watches=204800" | sudo tee -f /etc/sysctl.d/90-syncthing.conf && sudo sysctl --system`
- **Conflict Files**: If the same file is modified on two devices simultaneously, Syncthing creates a conflict file (e.g. `filename.sync-conflict-...`). You must merge or delete these manually.
