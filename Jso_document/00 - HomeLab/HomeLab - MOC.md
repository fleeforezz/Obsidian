---
tags:
  - homelab
  - moc
last-updated: 2025-05-11
banner: "![[00 - HomeLab/attachments/{D1DA1AAB-0D53-4795-9FD1-C2358DE0F420}.png]]"
banner-display: cover
banner-fade: "-100"
content-start: "300"
banner-y: 0
---
# 🖥 HomeLab — Map of Content

> Your single entry point. Open this first when something breaks,
> when adding a new service, or when you've forgotten where something lives.

---

## 🔴 Something is broken right now?

- [[Runbooks/restore-proxmox-backup]] — VM or container won't start
- [[Runbooks/renew-ssl-cert]] — SSL cert expired
- [[Runbooks/restart-pihole]] — DNS resolution down
- [[Runbooks/fix-network-drop]] — can't reach a device
- [[Network/firewall-rules]] — traffic being blocked unexpectedly
- [[Change Log/]] — check what changed recently

---

## 🏗 Infrastructure at a glance

### Machines
| Device         | IP                       | Role                | Note                        |
| -------------- | ------------------------ | ------------------- | --------------------------- |
| server-main    | 192.168.1.33             | Proxmox host        | [[Hardware/Server-Main]]    |
| data-storage   | 10.0.1.34                | TrueNAS storage     | [[Hardware/Data-Storage]]   |
| switch-01      | 192.168.1.0/24           | TP-Link 5-port      | [[Hardware/Switch-01]]      |
| switch-02      | 10.0.1.0/24              | TP-Link 5-port      | [[Hardware/Switch-02]]      |
| firewall       | 192.168.1.99 \| 10.0.1.1 | Pfsense firewall    | [[Hardware/Firewall]]       |
| router-mesh-03 | 192.168.1.1              | Viettel mesh router | [[Hardware/Router-Mesh-03]] |
### Proxmox VMs
#### Proxmox node naming
For the Proxmox hosts:
+ pve01
+ pve02
+ pve03
Or:
+ pve-mini01
+ pve-tower01
+ pve-r73001

#### VMs & LXC naming
For VMs and LXC:
+ 100-199 -> Infrastructure
+ 200-299 -> Shared Services
+ 300-399 -> Monitoring
+ 400-499 -> Development/CI
+ 500-599 -> Kubernetes
+ 900-999 -> templates

**Names:**
```
<category>-<service>-<type><number>

Example:
mon-grafana-lxc01  
db-postgres-vm01  
svc-pihole-lxc01  
ci-jenkins-vm01
```

| VMID | VM-name         | Tags           | Notes                                       |
| ---- | --------------- | -------------- | ------------------------------------------- |
| 100  | edge-fw01       | infrastructure | Pfsense                                     |
| 101  | dns01           | infrastructure | Pi-hole                                     |
| 102  | dns02           | infrastructure | Pi-hole                                     |
| 200  | svc-core01      | services       | Redis, PostgreSQL, MSSQL                    |
| 201  | svc-apps01      | services       | Bitwarden, Immich, Frigate                  |
| 300  | monitor01       | monitoring     | Grafana, Prometheus, Loki, <br>Alertmanager |
| 310  | ingress01       |                | Traefik                                     |
| 400  | ci01            | Development/CI | Jenkins                                     |
| 401  | git01           | Development/CI | Gitlab                                      |
| 501  | k8s-cp01        | kubernetes     | Control plane 1                             |
| 506  | k8s-w01         | kubernetes     | Worker 1                                    |
| 507  | k8s-w02         | kubernetes     | Worker 2                                    |
| 508  | k8s-w03         | kubernetes     | Worker 3                                    |
| 900  | tmpl-ubuntu2404 | templates      |                                             |

### Services running
| Service     | Host                | Port | Status |
| ----------- | ------------------- | ---- | ------ |
| Proxmox     | #pve                | 8006 | ✅      |
| Pfsense     | #pve #pfsense       | 443  | ✅      |
| Traefik     | #pve #reverse-proxy | 81   | ✅      |
| Pi-hole     | #pve #pi-hole       | 80   | ✅      |
| TrueNAS     | #storage            | 443  | ✅      |
| Portainer   | #pve #development   | 9000 | ✅      |
| Vaultwarden | proxmox-vm-04       | 8080 | ✅      |

*Update status here whenever something changes. Or use a Dataview query — see bottom of this note.*

---

## 📁 Navigate the vault

### Hardware
- [[Hardware/server-main]] — primary Proxmox machine
- [[Hardware/Data-Storage]] — TrueNAS, drives, storage pools
- [[Hardware/switch-main]] — port map, VLANs
- [[Hardware/Firewall]] — OPNsense, WAN config
- [[Hardware/rpi-01]] — Pi-hole host
- [[Hardware/ups]] — UPS, battery status, connected devices

### Services
- [[Services/proxmox]] — VM management, backup schedule
- [[Services/nextcloud]] — config, sync clients, storage path
- [[Services/pihole]] — DNS, blocklists, DHCP leases
- [[Services/nginx-proxy-manager]] — reverse proxy, SSL certs
- [[Services/vaultwarden]] — password manager, backup
- [[Services/portainer]] — Docker management
- [[Services/truenas]] — pools, datasets, shares, snapshots

### Network
- [[Network/ip-map]] — every static IP in the lab
- [[Network/vlans]] — VLAN layout, which device is on which VLAN
- [[Network/dns-records]] — custom DNS entries in Pi-hole
- [[Network/firewall-rules]] — OPNsense rules between VLANs

### Runbooks
- [[Runbooks/add-new-vm]] — step-by-step for spinning up a VM
- [[Runbooks/add-docker-container]] — new container checklist
- [[Runbooks/restore-proxmox-backup]] — restore from backup
- [[Runbooks/renew-ssl-cert]] — cert renewal via NPM
- [[Runbooks/update-all-services]] — safe update sequence
- [[Runbooks/wipe-and-rebuild]] — nuclear option, full rebuild steps

### Change log
- [[Change Log/2025-05-11]] — latest entry
- [[Change Log/]] — browse all entries

---

## 🔧 Things to do

- [ ] Document rpi-02 hardware note
- [ ] Write runbook for Vaultwarden backup restore
- [ ] Set static IP for desktop-pc
- [ ] Test UPS battery runtime
- [ ] Export switch config backup

---

## 💡 Dataview — live service status

If you have the Dataview plugin installed, paste this into the MOC and 
it auto-builds your service table from your actual notes:

```dataview
TABLE host, port, status, last-updated
FROM "00 - HomeLab/Services"
SORT status ASC
```

And this one shows hardware by location:

```dataview
TABLE ip, type, status, location
FROM "00 - HomeLab/Hardware"
SORT type ASC
```

---

## 📐 Conventions used in this vault

- Every service note uses template: [[Templates/tpl-homelab-service]]
- Every hardware note uses template: [[Templates/tpl-homelab-hardware]]
- Runbooks are written as numbered steps — no assumptions, no skipped commands
- Change log: one file per date, linked from the relevant service note
- IP range: 192.168.1.x static, 192.168.1.100–200 DHCP
- Cable colours: grey = LAN, blue = Lab, yellow = uplinks, green = IoT