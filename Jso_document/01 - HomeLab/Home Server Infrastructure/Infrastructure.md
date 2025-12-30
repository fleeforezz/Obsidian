## 🖥️ Proxmox VMs and Containers Design (Main Server)

**Proxmox Host**
+ Docker Swarm Cluster (3 managers + 2-3 workers)
	+ 150 (k8s-manager-1)
		+ CPU: 4 cores
		+ RAM: 8Gb
		+ Disk: 32Gb
	+ 151 (k8s-manager-2)
		+ CPU: 4 cores
		+ RAM: 8Gb
		+ Disk: 32Gb
	+ 152 (k8s-manager-3)
		+ CPU: 4 cores
		+ RAM: 8Gb
		+ Disk: 32Gb
	+ 153 (k8s-worker-1)
		+ CPU: 4 cores
		+ RAM: 8Gb
		+ Disk: 32Gb
	+ 154 (k8s-worker-2)
		+ CPU: 4 cores
		+ RAM: 8Gb
		+ Disk: 32Gb
	+ 155 (k8s-worker-3)
		+ CPU: 4 cores
		+ RAM: 8Gb
		+ Disk: 32Gb
+ Standalone Docker VMs (One per major service)
	+ VM 301: Media Stack (docker-compose)
		+ CPU: 4 cores
		+ RAM: 4Gb
		+ Disk: 32Gb
	+ VM 302: Personal Services (docker-compose)
		+ CPU: 8 cores
		+ RAM: 16Gb
		+ Disk: 32Gb
	+ VM 303: Databases (docker-compose)
		+ CPU: 4 cores
		+ RAM: 8Gb
		+ Disk: 32Gb
	+ VM 304: S3-Storage (docker-compose)
		+ CPU: 4 cores
		+ RAM: 8Gb
		+ Disk: 32Gb
	+ VM 305: Developments (docker-compose)
		+ CPU: 4 cores
		+ RAM: 8Gb
		+ Disk: 50Gb
	+ VM 306: Reverse Proxy Server (docker-compose)
		+ CPU: 4 cores
		+ RAM: 4Gb
		+ Disk: 32Gb
=> Total disk usage: 210Gb
+ Standalone VMs (One per major service)
	+ VM 400: PfSense - Firewall 
		+ CPU: 1 cores
		+ RAM: 2Gb
		+ Disk: 16Gb
	+ VM 401: Gitlab
		+ CPU: 8 cores
		+ RAM: 16Gb
		+ Disk: 32Gb
	+ VM 402: Jenkins
		+ CPU: 4 cores
		+ RAM: 8Gb
		+ Disk: 32Gb
	+ VM 403: Pi-Hole
		+ CPU: 2 cores
		+ RAM: 2Gb
		+ Disk: 15Gb
	+ VM 404: Cockpit
		+ CPU: 3 cores
		+ RAM: 4Gb
		+ Disk: 15Gb
	+ VM 405: K8s clusters Load Balancer
		+ CPU: 4 cores
		+ RAM: 4Gb
		+ Disk: 32Gb
+ Cloud-Init Templates
	+ ubuntu-cloud (type VM)

=> Total used space: 480Gb

## 🗃️ Truenas Scale (Storage Server)

### SlowZ1
Storage Name: SlowZ1  
6x500GB HDD drives
Usable Capacity: 1.74TiB
Duty: Store Main Server data

|     | Size   | Tranfer Mode | Serial                 | Model                  | Rotation | Type | HDD Standby |
| --- | ------ | ------------ | ---------------------- | ---------------------- | -------- | ---- | ----------- |
| sda | 500GiB | Auto         | WD-WCC6Z6ZV948N        | WDC_WD5000AZLX-60K2TA0 | 7200 RPM | HDD  | ALWAYS ON   |
| sdb | 500GiB | Auto         | WD-WCC2EEZ70231        | WDC_WD5000AAKX-60U6AA0 | 7200 RPM | HDD  | ALWAYS ON   |
| sdc | 500GiB | Auto         | WD-WCC6Z4DDXC7R        | WDC_WD5000AZLX-60K2TA0 | 7200 RPM | HDD  | ALWAYS ON   |
| sdd | 500GiB | Auto         | WD-WCC6Z1AFFDVL        | WDC_WD5000AZLX-60K2TA0 | 7200 RPM | HDD  | ALWAYS ON   |
| sde | 500GiB | Auto         |                        |                        | 7200 RPM | HDD  | ALWAYS ON   |
| sdf | 500GiB | Auto         | WDC_WD5000AZLX-60K2TA0 | WDC_WD5000AZLX-60K2TA0 | 7200 RPM | HDD  | ALWAYS ON   |

### Slow3T
Storage Name: Slow3T
1x3TB HDD drives
Usable Capacity: 2.73TiB
Duty: Store backup files for SlowZ1 and Proxmox VMs/LXC

|     | Size | Tranfer Mode | Serial          | Model                | Rotation | Type | HDD Standby |
| --- | ---- | ------------ | --------------- | -------------------- | -------- | ---- | ----------- |
| sda | 3TB  | Auto         | WD-WCC4N7VCZXDJ | WDC_WD30PURX-64P6ZY0 | 5400 RPM | HDD  | ALWAYS ON   |

