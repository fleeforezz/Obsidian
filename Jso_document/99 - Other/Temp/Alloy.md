```sh
// ======================
// SYSTEM LOGS (varlogs)
// ======================
loki.source.journal "system" {
  forward_to = [loki.process.system.receiver]
}

loki.process "system" {
  stage.static_labels {
    values = {
      job      = "var_logs",
      env      = "production",
      instance = "vm-dev",
    }
  }

  forward_to = [loki.write.getting_started.receiver]
}

// ======================
// AUTH LOG
// ======================
local.file_match "auth_logs" {
  path_targets = [
    {
      __path__ = "/var/log/auth.log",
      job      = "auth_logs",
      env      = "production",
      instance = "vm-dev",
    },
  ]
}

loki.process "auth_logs" {
  stage.static_labels {
    values = {
      job      = "auth_logs",
      env      = "production",
      instance = "vm-dev",
    }
  }

  forward_to = [loki.write.getting_started.receiver]
}

loki.source.file "auth_logs" {
  targets    = local.file_match.auth_logs.targets
  forward_to = [loki.process.auth_logs.receiver]
}


// ======================
// DOCKER DISCOVERY
// ======================

// This component is responsible for disovering new containers within the docker environment
discovery.docker "getting_started" {
    host = "unix:///var/run/docker.sock"
    refresh_interval = "5s"
}

// This component is responsible for relabeling the discovered containers
discovery.relabel "getting_started" {
    targets = []

    rule {
        source_labels = ["__meta_docker_container_name"]
        regex         = "/(.*)"
        target_label  = "container"
    }
}


// ======================
// DOCKER LOGS
// ======================

// This component is responsible for collecting logs from the discovered containers
loki.source.docker "getting_started" {
    host             = "unix:///var/run/docker.sock"
    targets          = discovery.docker.getting_started.targets
    forward_to       = [loki.process.docker.receiver]
    relabel_rules    = discovery.relabel.getting_started.rules
    refresh_interval = "5s"
}

// This component is responsible for processing the logs (In this case adding static labels)
loki.process "docker" {
    stage.static_labels {
    values = {
      env = "production",
      job = "docker",
      instance = "vm-dev",
    }
}
    forward_to = [loki.write.getting_started.receiver]
}


// ======================
// WRITE TO LOKI
// ======================

// This component is responsible for writing the logs to Loki
loki.write "getting_started" {
    endpoint {
        url  = "http://monitoring.local:3100/loki/api/v1/push"
    }
}


// ======================
// DEBUG UI
// ======================

// Enables the ability to view logs in the Alloy UI in realtime
livedebugging {
  enabled = true
}
```