---
tags:
  - homelab
  - hardware
  - storage
type: storage
status: active
location: rack-u3
last-updated: 2026-05-11
---

# Truenas

## Identity
- Manufacturer: facebook-market user
- Model: no-info
- Serial number: no-info 
- Purchase date: 20 Jun 2025
- Warranty expires: no-info
- Purchased from: no-info

## Specs
- CPU: 2 cores / 4 threads
- RAM:  16GB
- Storage: 
	- OS: 
		- Device: /dev/sdd
		- Type: SSD
		- Size: 120Gb
		- Model: KINGSTON_SA400S37_120G
		- Serial: cc000000000000002575
	+ ZFSs:
		+ SlowZ1: 
			+ Raid mode: RAIDZ2 
			+ Number of disks: 6 wide | 465.76GiB
			+ Duty: Store [[Server-Main]] data
		+ Slow3T:
			+ Raid mode: STRIPE
			+ Number of disks: 1 wide | 2.63 TiB
- NIC: 
	- 6 ports Sata Expansion Card
- Power draw (idle / load):  W /  W

## Network
- Hostname: truenas
- IP (static): 10.0.1.34
- MAC address: no-info
- Connected to: [[Switch-02]] port 

## What runs on it
- [[]]
- [[]]

## Physical
- Location: Server room
- Rack unit: 600x500mm rack
- Cables: no-info

## Access
- SSH: no ssh service enable
- Web UI: https://truenas.hikarimoon
- IPMI / iDRAC / iLO: no-info

## Maintenance log
| Date | Action |
|------|--------|
| 2026-05-11 | Added to HomeLab |

## Notes

**SlowZ1 disk details**

|     | Size   | Tranfer Mode | Serial                 | Model                  | Rotation | Type | HDD Standby |
| --- | ------ | ------------ | ---------------------- | ---------------------- | -------- | ---- | ----------- |
| sda | 500GiB | Auto         | WD-WCC6Z6ZV948N        | WDC_WD5000AZLX-60K2TA0 | 7200 RPM | HDD  | ALWAYS ON   |
| sdb | 500GiB | Auto         | WD-WCC2EEZ70231        | WDC_WD5000AAKX-60U6AA0 | 7200 RPM | HDD  | ALWAYS ON   |
| sdc | 500GiB | Auto         | WD-WCC6Z4DDXC7R        | WDC_WD5000AZLX-60K2TA0 | 7200 RPM | HDD  | ALWAYS ON   |
| sdd | 500GiB | Auto         | WD-WCC6Z1AFFDVL        | WDC_WD5000AZLX-60K2TA0 | 7200 RPM | HDD  | ALWAYS ON   |
| sde | 500GiB | Auto         |                        |                        | 7200 RPM | HDD  | ALWAYS ON   |
| sdf | 500GiB | Auto         | WDC_WD5000AZLX-60K2TA0 | WDC_WD5000AZLX-60K2TA0 | 7200 RPM | HDD  | ALWAYS ON   |

**Slow3T disk details**

|     | Size | Tranfer Mode | Serial          | Model                | Rotation | Type | HDD Standby |
| --- | ---- | ------------ | --------------- | -------------------- | -------- | ---- | ----------- |
| sda | 3TB  | Auto         | WD-WCC4N7VCZXDJ | WDC_WD30PURX-64P6ZY0 | 5400 RPM | HDD  | ALWAYS ON   |
