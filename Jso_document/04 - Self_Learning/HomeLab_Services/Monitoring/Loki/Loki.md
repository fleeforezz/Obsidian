**Docker compose**
```sh
  # ========================
  # LOKI
  # ========================
  loki:
    image: grafana/loki:3.4.2
    container_name: loki
    networks:
      - monitoring
    dns:
      - 10.0.1.91
      - 1.1.1.1
    ports:
      - "3100:3100"
    volumes:
      - ./config/loki-config.yaml:/etc/loki/loki-config.yaml
      - loki_data:/loki
    command: -config.file=/etc/loki/loki-config.yaml
    restart: unless-stopped
```

**Loki Config**
```sh
auth_enabled: false

server:
  http_listen_port: 3100
  grpc_listen_port: 9096
  log_level: info
  grpc_server_max_concurrent_streams: 1000

common:
  instance_addr: 127.0.0.1
  path_prefix: /loki
  storage:
    filesystem:
      chunks_directory: /loki/chunks
      rules_directory: /loki/rules
  replication_factor: 1
  ring:
    kvstore:
      store: inmemory

#storage_config:
#  tsdb_shipper:
#    active_index_directory: /loki/index
#    cache_location: /loki/cache
#  filesystem:
#    directory: /loki/chunks

query_range:
  results_cache:
    cache:
      embedded_cache:
        enabled: true
        max_size_mb: 100

limits_config:
  metric_aggregation_enabled: true
  allow_structured_metadata: true
  volume_enabled: true
  retention_period: 24h   # 24h

schema_config:
  configs:
    - from: 2024-01-01
      store: tsdb
      object_store: filesystem
      schema: v13
      index:
        prefix: index_
        period: 24h

pattern_ingester:
  enabled: true
  metric_aggregation:
    loki_address: localhost:3100

ruler:
  enable_alertmanager_discovery: true
  enable_api: true

frontend:
  encoding: protobuf


compactor:
  working_directory: /loki/retention
  delete_request_store: filesystem
  retention_enabled: true
  
```