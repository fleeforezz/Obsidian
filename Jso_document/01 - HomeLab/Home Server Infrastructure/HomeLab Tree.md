---

mindmap-plugin: basic

---

# HomeLab MindMap

## Proxmox (192.168.1.33/24) [[Proxmox]]
- K8s-Clusters [[K8s Clusters]]
    - 150 - K8s-manager-1 (10.0.1.51/24)
    - 152 - K8s-worker-1 (10.0.1.61/24)
    - 153 - K8s-worker-2 (10.0.1.62/24)
    - 154 - K8s-worker-3 (10.0.1.63/24)
        - Web-facing & Scalable services
        - Traefik [[Traefik]]
        - Grafana [[Grafana]]
        - Homepage [[Homepage]]
        - Portainer [[Portainer]]
        - Uptime Kuma [[Uptime Kuma]]
        - Game Server
        - Jenkins Agents
        - Longhorn [[Longhorn]]
        - ArgoCD [[ArgoCD]]
- Standalone Docker VMs [[Standalone Docker VMs]]
    - 301 - Personal Services (10.0.1.70/24)
        - Immich [[Immich]]
        - Bitwarden [[Bitwarden]]
        - Frigate [[Frigate]]
    - 302 - Databases (10.0.1.71/24)
        - PostgreSQL
        - MicrosoftSQL
        - Redis
    - 304 - Developments (10.0.1.73/24)
        - Portainer [[Portainer]]
        - Testing webapps
        - SonarQube [[Sonarqube]]
        - S3-Storage
            - SeaweedFS [[SeaweedFS]]
    - 305 - Reverse Proxy (10.0.1.74/24)
        - Traefik
        - Nginx Proxy Manager
- Standalone VMs [[Standalone VMs]]
    - 100 - PfSense [[Pf-Sense]] (WAN: 192.168.1.99/24 - LAN: 10.0.1.0/24)
    - 400 - Gitlab [[GitLab]] (10.0.1.77/24)
    - 401 - Jenkins [[Jenkin]] (10.0.1.78/24)
    - 402 - Cockpit [[Cockpit]] (10.0.1.80/24)
    - 403 - HomeAssistant [[HomeAssistant]] (10.0.1.81/24)
    - 404 - K8s-Clusters Load Balancer (10.0.1.76/24)
        - Nginx [[Nginx]]
- Cloud-Init Template
    - ubuntu-cloud (type VM - 10.0.1.0/24) [[CloudInit Template]]

## TrueNas Scale (10.0.1.34/24) [[TrueNas]]

## TP-Link Router (HomeLab - 10.0.1.0/24)