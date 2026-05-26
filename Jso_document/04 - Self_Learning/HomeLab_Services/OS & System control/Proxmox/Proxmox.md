---
tags:
  - homelab
  - hypervisor
  - service
status: running
last-updated: 2026-05-26
banner: "[[04 - Self_Learning/attachments/proxmox_banner.png]]"
banner-display: cover
banner-fade: "-100"
content-start: "300"
---
# Proxmox Virtual Environment (PVE)

## Purpose
Proxmox VE is a complete open-source platform for enterprise virtualization. It tightly integrates the KVM hypervisor and Linux Containers (LXC), software-defined storage, and networking functionality on a single platform.

## CLI Command Reference

### Managing Virtual Machines (QEMU - `qm`)
- **Start VM**: `qm start <vmid>`
- **Stop VM (Clean shutdown)**: `qm shutdown <vmid>`
- **Stop VM (Immediate power off)**: `qm stop <vmid>`
- **List VMs**: `qm list`
- **Show VM config**: `qm config <vmid>`

### Managing Containers (LXC - `pct`)
- **Start Container**: `pct start <vmid>`
- **Stop Container (Clean shutdown)**: `pct shutdown <vmid>`
- **Stop Container (Immediate power off)**: `pct stop <vmid>`
- **List Containers**: `pct list`
- **Enter Container Shell**: `pct enter <vmid>`

## Sub-Notes & Setup Guides
- [[04 - Self_Learning/HomeLab_Services/OS & System control/Proxmox/Config Proxmox|Config Proxmox]]: Disk configuration, ZFS setup, Cockpit installation, and Samba setup.
- [[04 - Self_Learning/HomeLab_Services/OS & System control/Proxmox/Increase VM disk size|Increase VM disk size]]: Resizing VM disks via command line.
- [[04 - Self_Learning/HomeLab_Services/OS & System control/Proxmox/Send email alert|Send email alert]]: Configuring Postfix to send emails for system alerts.
- [[04 - Self_Learning/HomeLab_Services/OS & System control/Proxmox/Send email when shutdown|Send email when shutdown]]: Scripting email notifications on PVE host shutdown events.

## Gotchas
- **LXC Mount Points**: Mounting ZFS pools into unprivileged LXC containers requires matching UID/GID mappings on the host and container to avoid permission issues. See [[04 - Self_Learning/HomeLab_Services/OS & System control/Proxmox/Config Proxmox#Config ZFS Mount|Config Proxmox - ZFS Mount]].
- **PVEDiscordDark Theme**: When updating Proxmox, the theme script might be overwritten. You will need to re-run the theme installation script:
  ```bash
  wget https://raw.githubusercontent.com/Weilbyte/PVEDiscordDark/master/PVEDiscordDark.sh
  bash PVEDiscordDark.sh install
  ```
