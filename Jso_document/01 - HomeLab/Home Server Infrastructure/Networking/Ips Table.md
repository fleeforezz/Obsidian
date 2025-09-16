---

kanban-plugin: board

---

## Self Services Environment

- [x] Game Server
	192.168.1.100
- [x] Media Server
	10.0.1.66


## Dev Services Environment<br><mark style="background: #FF5582A6;">10.0.1.0/24</mark>

- [x] Version Control Server
	10.0.1.51
- [x] Cockpit Management Server
	10.0.1.32
- [x] Network Gate Server
	192.168.1.78
- [x] Reverse Proxy Server
	10.0.1.90
- [x] PiHole
	10.0.1.91
- [x] Monitoring Server
	10.0.1.60
- [x] Security Server
	10.0.1.70
- [x] CI/CD Server
	10.0.1.63
- [ ] Proxmox Backup Server
	10.0.1.71


## Dev Environment<br><mark style="background: #FF5582A6;">10.0.1.0/24</mark>

- [x] Development Server
	10.0.1.80
- [x] K8s Master 1 Server
	10.0.1.52
- [x] K8s Worker 1 Server
	10.0.1.53


## Prod Environment (Current)<br><mark style="background: #FF5582A6;">10.0.1.0/24</mark>

- [ ] Database Server
	10.0.1.55
- [ ] Block Storage Server
	10.0.1.89
- [ ] K8s Master 1 Server
	10.0.1.81
- [ ] K8s Worker 1 Server
	10.0.1.86


## Prod Environment (Future update)<br><mark style="background: #ABF7F7A6;">10.0.3.0/24</mark>

- [x] Reverse Proxy Server
	10.0.3.45
- [x] Block Storage Server
	10.0.3.89
- [x] Database Server
	10.0.3.55
- [x] Monitoring Server
	10.0.3.67
- [x] K8s Master 1 Server
	10.0.3.80
- [x] K8s Worker 1 Server
	10.0.3.86




%% kanban:settings
```
{"kanban-plugin":"board","list-collapse":[false,false,false,false,false],"full-list-lane-width":false,"tag-colors":[{"tagKey":"","color":"","backgroundColor":""}]}
```
%%