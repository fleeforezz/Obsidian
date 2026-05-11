**Alert CPU > 80%**
```sh
100 - (avg by(instance)(
  rate(node_cpu_seconds_total{mode="idle"}[1m])
) * 100)
```

**Alert RAM > 80%**
```sh
100 - (
  (node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes) * 100
)
```

**Alert DISK > 80%**
```sh
100 - (
  node_filesystem_avail_bytes{fstype!~"tmpfs|overlay"}
  /
  node_filesystem_size_bytes{fstype!~"tmpfs|overlay"}
) * 100
```

