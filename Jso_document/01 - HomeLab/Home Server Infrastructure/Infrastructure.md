## 🖥️ Proxmox VMs and Containers Design (Main Server)

**Proxmox Host**
+ Docker Swarm Cluster (3 managers + 2-3 workers)
	+ 150 (k8s-manager-1) - 4vCPU, 8Gb RAM
	+ 151 (k8s-manager-2) - 4vCPU, 8Gb RAM
	+ 152 (k8s-manager-3) - 4vCPU, 8Gb RAM
	+ 153 (k8s-worker-1) - 4vCPU, 8Gb RAM
	+ 154 (k8s-worker-2) - 4vCPU, 8Gb RAM
	+ 155 (k8s-worker-3) - 4vCPU, 8Gb RAM
		+ Web-facing & scalable services, Treafik, Grafana, HomePage, Portainer, Uptime Kuma, Games Server, Jenkins Agents
+ Standalone Docker VMs (One per major service)
	+ VM 301: Media Stack (docker-compose) - 4vCPU, 4GB RAM
		+ Navidrome, YoutubeDL
	+ VM 302: Personal Services (docker-compose) - 8vCPU, 16GB RAM
		+ Immich, Bitwarden, Frigate
	+ VM 303: Databases (docker-compose) - 4vCPU, 8GB RAM
		+ PostgreSQL, MSSQL, Redis
	+ VM 304: S3-Storage (docker-compose) - 4vCPU, 8GB RAM
		+ MinIO
	+ VM 305: Developments (docker-compose) - 4vCPU, 8GB RAM
		+ Portainer, testing webapps, SonarQube
+ Standalone VMs (One per major service)
	+ VM 400: PfSense - Firewall - 1vCPU, 2GB RAM
	+ VM 401: Gitlab - 4vCPU, 8GB RAM
	+ VM 402: Jenkins - 4vCPU, 8GB RAM
	+ VM 403: Pi-Hole - 2vCPU, 2GB RAM
	+ VM 404: Cockpit - 3vCPU, 4GB RAM
+ Cloud-Init Templates
	+ ubuntu-cloud (type VM)

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
