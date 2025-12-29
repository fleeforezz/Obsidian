Here is a documentation of how K8s works
[Architecture (Big Picture)](#architecture)
[Traefik Ingress](#traefik-ingress)

## 🧱 Architecture

```shell
                    Internet
                        |
                ┌────────────────┐
                │     NGINX      │   ← Global L7/L4 LB (VM)
                └───────┬────────┘
                        |
         ┌──────────────┼──────────────┐
         │              │              │
   ┌───────────┐   ┌───────────┐   ┌───────────┐
   │ Cluster A │   │ Cluster B │   │ Cluster C │
   │  Traefik  │   │  Traefik  │   │  Traefik  │
   └─────┬─────┘   └─────┬─────┘   └─────┬─────┘
         │               │               │
    Services          Services         Services
         │               │               │
        Pods            Pods            Pods

```

## 🖥️Nginx (Global load balancer)

Run on:
+ Proxmox VM
+ Standalone Docker Vm
+ Not inside K8s

## 🔐 TLS Strategy

Nginx only does:
+ TCP LB
+ Health checks
+ Fail over

Traefik does:
+ HTTPS
+ Certs
+ Routing

## Nginx Config (TCP passthrough + health)

```nginx
stream {
    upstream k8s_clusters {
        least_conn;
        server 10.0.0.10:443 max_fails=3 fail_timeout=10s;
        server 10.0.0.11:443 max_fails=3 fail_timeout=10s;
    }

    server {
        listen 443;
        proxy_connect_timeout 5s;
        proxy_timeout 30s;
        proxy_pass k8s_clusters;
    }
}
```

What this give you
+ Detect dead clusters
+ Remove them automatically
+ No DNS changes
+ Fast failover

### Health-check endpoints (CRITICAL)
#### A. Pod-level health (K8s)

**Deployment readiness probe**
```yaml
readinessProbe:
  httpGet:
    path: /health
    port: 3000
  initialDelaySeconds: 5
  periodSeconds: 10
```

Pod removed from Service if unhealthy

#### B. Cluster-level health (Traefik)

Create a simple health endpoint

**Traefik static config**
```yaml
ping:
  entryPoint: web
```

Expose it:
```bash
http://cluster-ip:80/ping
```

#### C. Nginx checks Traefik, not pods

Nginx only cares:
> "Is Traefik alive ?"

Pods are Kubernetes problem
## Traefik Ingress

