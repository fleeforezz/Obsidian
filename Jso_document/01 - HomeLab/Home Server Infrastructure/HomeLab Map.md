---

mindmap-plugin: basic

---

# HomeLab MindMap

## Proxmox (192.168.1.33/24)
- K8s Clusters
    - 150 - K8s-manager-1 (10.0.1.51/24)
    - 151 - K8s-manager-2 (10.0.1.52/24)
    - 152 - K8s-manager-3 (10.0.1.53/24)
    - 153 - K8s-worker-1 (10.0.1.61/24)
    - 154 - K8s-worker-2 (10.0.1.62/24)
    - 155 - K8s-worker-3 (10.0.1.63/24)
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
- Standalone Docker VMs
    - 301 - Media Stack (10.0.1.70)
        - Navidrome [[Navidrome]]
        - YoutubeDL [[YoutubeDL]]
    - 302 - Personal Services (10.0.1.71/24)
        - Immich [[Immich]]
        - Bitwarden [[Bitwarden]]
        - Frigate [[Frigate]]
    - 303 - Databases (10.0.1.72/24)
        - PostgreSQL
        - MicrosoftSQL
        - Redis
    - 304 - S3-Storage (10.0.1.73/24)
        - SeaweedFS
    - 305 - Developments (10.0.1.74/24)
        - Portainer [[Portainer]]
        - Testing webapps
        - SonarQube [[Sonarqube]]
    - 306 - Reverse Proxy (10.0.1.75/24)
        - Traefik
- Standalone VMs
    - 400 - PfSense (WAN: 192.168.1.99/24 - LAN: 10.0.1.0/24)
    - 401 - Gitlab [[GitLab]] (10.0.1.77/24)
    - 402 - Jenkins [[Jenkin]] (10.0.1.78/24)
    - 403 - Pi-Hole [[Pi-Hole]] (10.0.1.79/24)
    - 404 - Cockpit [[Cockpit]] (10.0.1.80/24)
    - 405 - HomeAssistant [[HomeAssistant]] (10.0.1.81/24)
    - 406 - K8s-Clusters Load Balancer (10.0.1.76/24)
- Cloud-Init Template
    - ubuntu-cloud (type VM - 10.0.1.0/24)

## TrueNas Scale (10.0.1.34/24)

## TP-Link Router (HomeLab - 10.0.1.0/24)