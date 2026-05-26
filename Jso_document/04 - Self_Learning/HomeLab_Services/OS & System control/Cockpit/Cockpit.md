---
tags:
  - homelab
  - linux
  - dashboard
status: running
last-updated: 2026-05-26
banner: "[[04 - Self_Learning/attachments/cockpit_banner.png]]"
banner-display: cover
banner-fade: "-100"
content-start: "300"
---
# Cockpit Server Manager

## Purpose
Cockpit is an interactive server administration interface that provides a clean Web-based UI to manage Linux hosts. It is lightweight, uses system APIs directly, and does not run a heavy daemon in the background.

## Installation
Cockpit is available in official Debian backports repositories.

```shell
. /etc/os-release
sudo apt install -t ${VERSION_CODENAME}-backports cockpit -y
```

## Modular Plugins
Cockpit can be customized by installing additional plugins/packages:
- **`cockpit-machines`**: Manage KVM virtual machines.
- **`cockpit-podman`**: Manage Podman containers.
- **`cockpit-navigator`**: An interactive, web-based file browser.
- **`cockpit-file-sharing`**: Manage Samba (SMB) and NFS shares.

## Related Cockpit Guides
- [[04 - Self_Learning/HomeLab_Services/OS & System control/Cockpit/Create a Samba Share|Create a Samba Share]]
- [[04 - Self_Learning/HomeLab_Services/OS & System control/Cockpit/Third party repository|Third party repository]]
- [[04 - Self_Learning/HomeLab_Services/OS & System control/Cockpit/Uninstall Cockpit|Uninstall Cockpit]]

## Gotchas
- **Default Port**: Cockpit listens on port **`9090`** by default.
- **Root Disallowed Users**: By default, root logins might be blocked. To enable root login or modify disallowed users list, edit `/etc/cockpit/disallowed-users` and remove/comment out the `root` entry.