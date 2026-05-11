---
tags:
  - homelab
  - hardware
type: server
status: active
location: rack-u3
last-updated: 2026-05-11
---

# Proxmox - pve

## Identity
- Manufacturer: Gipco
- Model: no-info
- Serial number: no-info
- Purchase date: 6 Mar 2024
- Warranty expires: no-info
- Purchased from: no-info

## Specs
- CPU: 10 cores / 20 theards
- RAM:  94GB
- Storage: 
	- OS:
		- Device: /dev/sdd
		- Type: SSD
		- Size: 120Gb
		- Model: KINGSTON_SA400S37_120G
		- Serial: cc000000000000002575
	- VMs store:
		- Device: /dev/sdc
		- Type: SSD
		- Size: 500.11Gb
		- Model: Samsung_SSD_850_EVO_500GB
		- Serial: S2RANX0J205188K
- NIC: 
	- onboard Nic: 1Gbi
	- x2 Intel dual Lan NIC: 1Gbi each
- Power draw (idle / load):  W /  W

## Network
- Hostname: pve
- IP (static): 192.168.1.33
- MAC address: no-info
- Connected to: [[switch]] port 

## What runs on it
- [[pfsense]]
- [[K8s-manager-1]]
- [[K8s-worker-1]]
- [[K8s-worker-2]]
- [[K8s-worker-3]]
- [[Monitoring]]
- [[Personal-services]]
- [[Databases]]
- [[Development]]
- [[Reverse-proxy]]
- [[GitLab]]
- [[Jenkins]]
- [[Pi-Hole]]

## Physical
- Location: Server room
- Rack unit: 600x500mm rack
- Cables: no-info

## Access
- SSH: `ssh user@192.168.1.33`
- Web UI: https://proxmox.hikarimoon.pro
- IPMI / iDRAC / iLO: no-info

## Maintenance log
| Date | Action |
|------|--------|
| 2026-05-11 | Added to HomeLab |

## Notes
Quirks, known issues, things to watch.