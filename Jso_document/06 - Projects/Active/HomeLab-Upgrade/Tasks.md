---

kanban-plugin: board
tags:
  - project
  - kanban
project: "[[HomeLab Upgrade - hub]]"

---

## No status 😴

- [ ] (Setup) and test Truenas replication task, backup tasks #high
- [ ] (Setup) Truenas monitoring and show it in grafana #medium
- [ ] (Migrate) Pfsense to a physical server #low
- [ ] [[Setup backup job for Proxmox VMs]] #high
- [ ] (Setup) a load balancer for own projects #medium
- [ ] (Migrate) from using Jenkins CI for IaC to GitlabCI #medium
- [ ] (Migrate) all docker containers to use docker volume instead of system path #low
- [ ] (Migrate) from using single docker to use Kubernetes #low
- [ ] (Setup) a redis server for my webapps #low
- [ ] (Setup) loadbalancer for databases #low


## In Progress 🧑‍💻

- [ ] (Setup) disks temperature and health status for all servers #medium
- [ ] (Setup) disk status in grafana dashboard #low


## Testing 🧪

- [ ] (Setup) a sytstem logs for all servers #high
- [ ] (Setup) a temperature status for proxmox and truenas #medium
- [ ] (Setup) proxmox monitoring #medium
- [ ] [[Setup HA Pi-hole]] #medium
- [ ] [[(Setup) pi-hole backup job]] #high
- [ ] (Fix) mysql-dev and mysql-prod auto start when boot #medium
- [ ] [[Setup database server backup job]] #high
- [ ] [[Setup jenkins backup job]] #high
- [ ] [[Set up gitlab backup job]] #high


## Done 🌟

**Complete**
- [x] (Update) Migrate from using .local to .homelab #medium
- [x] (Setup) Gitops for Traefik #medium
- [x] (Setup) Gitops for system #low
- [x] (Setup) Make Gitlab only used local #low
- [x] (Setup) Version control backup job #low
- [x] ReOrganize Jenkins dashboard in Grafana #low
- [x] (Fix) SeaweedFS not start at bootup #medium
- [x] (Fix) Sonarqube not start at bootup #medium
- [x] (Setup) proxmox auto shutdown #medium
- [x] [[Setup truenas auto shutdown job]] #medium
- [x] (Backup) Bitwarden #high
- [x] (Backup) Pfsense #high


## Failed ⭕

**Complete**


## Abort

**Complete**
- [x] Move uptime-kuma(ex) and uptime-kuma(in) from development server to monitoring server #medium




%% kanban:settings
```
{"kanban-plugin":"board","list-collapse":[false,false,false,false,false,false],"tag-colors":[{"tagKey":"#high","color":"rgba(0, 0, 0, 1)","backgroundColor":"rgba(85, 0, 24, 1)"},{"tagKey":"#medium","color":"#121212","backgroundColor":"rgba(84, 61, 0, 1)"},{"tagKey":"#low","color":"#121212","backgroundColor":"rgba(7, 84, 0, 1)"},{"tagKey":"#homelab","color":"rgba(153, 153, 153, 1)","backgroundColor":"rgba(112, 123, 194, 0.1)"}],"tag-sort":[{"tag":"#high"},{"tag":"#medium"},{"tag":"#low"}],"full-list-lane-width":false,"tag-action":"kanban"}
```
%%