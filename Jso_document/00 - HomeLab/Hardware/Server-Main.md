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
- Connected to: [[Switch-01]] port 

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
- Location: metal rack, on the rack
- Mounted: rack-ears
- Power: plugged into [[PDU]] socket 4
- Cable used: 
	- Black - round = onboard Lan
	- Blue-1 = Lan in from [[Firewall]]
	- Blue-2 = Lan out to [[Switch-02]]
	- Black - flat = Lan in for pfsense from [[Router-Mesh-03]] 

## Port map

| ID           | Device                                            | Port | Speed | Notes                 |
| ------------ | ------------------------------------------------- | ---- | ----- | --------------------- |
| 0000:00:19.0 | 82579LM Gigabit Network Connection                | 1    | 1Gbps | Uplink to [[Proxmox]] |
| 0000:02:00.0 | 82571EB/82571GB Gigabit Ethernet Controller D0/D1 | 1    | 1Gbps | Pfsense Lan out       |
| 0000:02:00.1 | 82571EB/82571GB Gigabit Ethernet Controller D0/D1 | 2    | 1Gbps | Pfsense Wan in        |
| 0000:03:00.0 | 82571EB/82571GB Gigabit Ethernet Controller D0/D1 | 1    | 1Gbps | Pfsense network in    |
| 0000:03:00.1 | 82571EB/82571GB Gigabit Ethernet Controller D0/D1 | --   | --    | --                    |
## Access
- SSH: `ssh jso@192.168.1.33`
- Web UI: https://proxmox.hikarimoon.pro
- IPMI / iDRAC / iLO: no-info

## Maintenance log
| Date | Action |
|------|--------|
| 2026-05-11 | Added to HomeLab |

## Notes
Quirks, known issues, things to watch.