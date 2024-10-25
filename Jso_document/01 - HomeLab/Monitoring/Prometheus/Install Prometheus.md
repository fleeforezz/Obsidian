
> [!note]
> Make sure you have [[Docker]] and [[Docker Compose]]

# Create a config file

```shell
mkdir /etc/prometheus
```

```yaml
global:
  scrape_interval:     15s # By default, scrape targets every 15 seconds.

  # Attach these labels to any time series or alerts when communicating with
  # external systems (federation, remote storage, Alertmanager).
  # external_labels:
  #  monitor: 'codelab-monitor'

# A scrape configuration containing exactly one endpoint to scrape:
# Here it's Prometheus itself.
scrape_configs:
  # The job name is added as a label `job=<job_name>` to any timeseries scraped from this config.
  - job_name: 'prometheus'
    # Override the global default and scrape targets from this job every 5 seconds.
    scrape_interval: 5s
    static_configs:
      - targets: ['localhost:9098'] # You can replace the localhost or port suit for your need

  # Example job for node_exporter
  - job_name: 'node_exporter'
    static_configs:
      - targets: ['node_exporter:9100']

  # Example job for cadvisor
  - job_name: 'cadvisor'
    static_configs:
      - targets: ['cadvisor:8080']

  # Example job for gitlab
  - job_name: 'gitlab-ci-pipelines-exporter'
    static_configs:
      - targets: ['gitlab-ci-pipelines-exporter:8085']
```

### Create a gitlab-ci-piplines-exporter.yml file

```yaml
---
log:
  level: debug

gitlab:
  url: <https://gitlab.com> # your gitlab url
  token: <your_token> # replace with your gitlab access token

# Pull jobs related metrics on all projects
project_defaults:
  pull:
    pipeline:
      jobs:
        enabled: true

# Example public projects to monitor
projects:
  - name: gitlab-org/gitlab-runner # project name ex: jso/portfolio
    # Pull environments related metrics prefixed with 'stable' for this project
    pull:
      environments:
        enabled: true
        name_regexp: '^stable.*'

  - name: gitlab-org/charts/auto-deploy-app
```

```yaml
sed -i 's/<your_token>/xXF_xxjV_xxyzxzz/' gitlab-ci-pipelines-exporter.yml
```

## Then create a stack in portainer and paste the .yml file below

```yaml
---
# Prometheus
volumes:
  prometheus-data:
    driver: local
services:
  prometheus:
    image: prom/prometheus:latest
    container_name: prometheus
    ports:
      - 9098:9090
    volumes:
      - /etc/prometheus:/etc/prometheus
      - prometheus-data:/prometheus
    command: "--config.file=/etc/prometheus/prometheus.yml"
    restart: unless-stopped

# Node-exporter
  node_exporter:
    image: quay.io/prometheus/node-exporter:v1.5.0
    container_name: node_exporter
    command: "--path.rootfs=/host"
    pid: host
    restart: unless-stopped
    volumes:
      - /:/host:ro,rslave

# cAvdisor
  cadvisor:
    image: gcr.io/cadvisor/cadvisor:v0.47.0 
    container_name: cadvisor
    ports:
      - 8181:8080
    network_mode: host
    volumes:
      - /:/rootfs:ro
      - /var/run:/var/run:ro
      - /sys:/sys:ro
      - /var/lib/docker/:/var/lib/docker:ro
      - /dev/disk/:/dev/disk:ro
    devices:
      - /dev/kmsg
    privileged: true
    restart: unless-stopped

# gitlab
  gitlab-ci-pipelines-exporter:
    image: quay.io/mvisonneau/gitlab-ci-pipelines-exporter:v0.5.5
    # You can comment out the image name and use the following statement
    # to build the image against the current version of the repository
    # build: ../..
    ports:
      - 8085:8080
    environment:
      GCPE_GITLAB_TOKEN: ${GCPE_GITLAB_TOKEN}
      GCPE_CONFIG: /etc/gitlab-ci-pipelines-exporter.yml
      GCPE_INTERNAL_MONITORING_LISTENER_ADDRESS: tcp://127.0.0.1:8082
    volumes:
      - type: bind
        source: ./gitlab-ci-pipelines-exporter.yml # where you put the gitlab-ci-pipelines-exporter.yml file
        target: /etc/gitlab-ci-pipelines-exporter.yml
```