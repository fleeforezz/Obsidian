---
tags:
  - homelab
  - linux
  - debian
status: learning
last-updated: 2026-05-26
banner: "[[04 - Self_Learning/attachments/debian_command_banner.png]]"
banner-display: cover
banner-fade: "-100"
content-start: "300"
---
# Debian System Administration

## Purpose
This note serves as a quick reference sheet for common Debian (and generic Debian-based like Ubuntu) commands used in system administration.

## Core Commands Quick Reference

### Package Management (`apt`)
- **Update package lists**: `sudo apt update`
- **Upgrade installed packages**: `sudo apt upgrade -y`
- **Install packages**: `sudo apt install <package-name> -y`
- **Remove packages**: `sudo apt remove <package-name>`
- **Remove packages and configuration**: `sudo apt purge <package-name>`
- **Clean unused packages**: `sudo apt autoremove -y`

### Service Management (`systemd` / `systemctl`)
- **Start service**: `sudo systemctl start <service>`
- **Stop service**: `sudo systemctl stop <service>`
- **Restart service**: `sudo systemctl restart <service>`
- **Enable service at boot**: `sudo systemctl enable <service>`
- **Disable service at boot**: `sudo systemctl disable <service>`
- **Check status**: `systemctl status <service>`
- **View service logs**: `journalctl -u <service> -f`

### File Permissions (`chmod`, `chown`)
- **Change owner**: `sudo chown -R user:group /path/to/folder`
- **Set executable permission**: `chmod +x script.sh`
- **Grant full permissions (use with caution)**: `chmod 777 file`

### Network Debugging
- **Check IP addresses**: `ip a` or `ip address`
- **Check listening sockets**: `ss -tulpn` or `netstat -plntu`
- **Ping remote host**: `ping <ip-or-host>`

## Related Local Runbooks & Guides
- [[04 - Self_Learning/HomeLab_Services/OS & System control/Debian Command/Change DHCP to Static Ip|Change DHCP to Static Ip]]
- [[04 - Self_Learning/HomeLab_Services/OS & System control/Debian Command/Install sudo|Install sudo]]
- [[04 - Self_Learning/HomeLab_Services/OS & System control/Debian Command/Install ZFS|Install ZFS]]
- [[04 - Self_Learning/HomeLab_Services/OS & System control/Debian Command/Reboot debian server|Reboot debian server]]
