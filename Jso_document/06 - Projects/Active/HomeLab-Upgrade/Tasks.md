---

kanban-plugin: board
tags:
  - project
  - kanban
project: "[[HomeLab Upgrade - hub]]"

---

## No status 😴

- [ ] [[Setup backup job for Proxmox VMs]] #high
- [ ] Setup and test Truenas replication task, backup task #high
- [ ] Setup a login tracer for all servers and show it in grafana #high
- [ ] Setup Pihole backup job #high
- [ ] Set up a load balancer for own projects #medium
- [ ] Setup a temperature tracker for proxmox and truenas and show it in grafana #medium
- [ ] Setup IaC for Traefik #medium
- [ ] Setup disks temperature and health status for all our system #medium
- [ ] Fix mysql-dev and mysql-prod auto start when boot #medium
- [ ] Move uptime-kuma(ex) and uptime-kuma(in) from development server to monitoring server #medium
- [ ] Setup proxmox monitoring and show it in grafana #medium
- [ ] Setup Truenas monitoring and show it in grafana #medium
- [ ] Migrate from using single docker to use Kubernetes #low
- [ ] Setup loadbalancer for databases #low
- [ ] Setup a redis server for my webapps #low
- [ ] ReOrganize Jenkins dashboard in Grafana #low
- [ ] Setup disk status in grafana dashboard #low
- [ ] Migrate all docker containers to use docker volume instead of system path #low


## In Progress 🧑‍💻



## Testing 🧪

- [ ] Setup proxmox auto shutdown #medium
- [ ] [[Setup database server backup job]] #high
- [ ] [[Setup truenas auto shutdown job]] #medium
- [ ] Backup Bitwarden #high
- [ ] Backup Pfsense #high
- [ ] [[Setup jenkins backup job]] #high
- [ ] [[Set up gitlab backup job]] #high


## Done 🌟

**Complete**


## Failed ⭕

**Complete**


## Abort

**Complete**




%% kanban:settings
```
{"kanban-plugin":"board","list-collapse":[false,false,false,false,false,false],"tag-colors":[{"tagKey":"#high","color":"rgba(0, 0, 0, 1)","backgroundColor":"rgba(85, 0, 24, 1)"},{"tagKey":"#medium","color":"#121212","backgroundColor":"rgba(84, 61, 0, 1)"},{"tagKey":"#low","color":"#121212","backgroundColor":"rgba(7, 84, 0, 1)"},{"tagKey":"#homelab","color":"rgba(153, 153, 153, 1)","backgroundColor":"rgba(112, 123, 194, 0.1)"}],"tag-sort":[{"tag":"#high"},{"tag":"#medium"},{"tag":"#low"}],"full-list-lane-width":false,"tag-action":"kanban"}
```
%%