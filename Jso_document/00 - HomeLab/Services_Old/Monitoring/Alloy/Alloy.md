# 1. Cài Grafana Alloy trên server

## Cách nhanh nhất (Linux - Debian/Ubuntu)

```sh
wget https://github.com/grafana/alloy/releases/latest/download/alloy-linux-amd64.zip  
unzip alloy-linux-amd64.zip  
sudo mv alloy-linux-amd64 /usr/local/bin/alloy  
sudo chmod +x /usr/local/bin/alloy
```

Kiểm tra:

```sh
alloy version
```

---

## (Khuyến nghị) Chạy bằng systemd

Tạo service:

```sh
sudo nano /etc/systemd/system/alloy.service
```

Nội dung:

```sh
[Unit]  
Description=Grafana Alloy Agent  
After=network.target  
  
[Service]  
ExecStart=/usr/local/bin/alloy run /etc/alloy/config.alloy  
Restart=always  
User=root  
  
[Install]  
WantedBy=multi-user.target
```

Enable:

```sh
sudo systemctl daemon-reload  
sudo systemctl enable alloy
```

---

# 2. Cấu hình Alloy gửi log đến Loki

Tạo file config:

```sh
sudo mkdir -p /etc/alloy  
sudo nano /etc/alloy/config.alloy
```

## Ví dụ cấu hình gửi log systemd → Loki

```sh
loki.write "default" {  
  endpoint {  
    url = "http://LOKI_SERVER_IP:3100/loki/api/v1/push"  
  }  
}  
  
local.file_match "system_logs" {  
  path_targets = [  
    { __path__ = "/var/log/*.log" },  
  ]  
}  
  
loki.source.file "logs" {  
  targets    = local.file_match.system_logs.targets  
  forward_to = [loki.write.default.receiver]  
}
```

👉 Thay:

```sh
LOKI_SERVER_IP = IP hoặc domain server Loki
```

Ví dụ:

```sh
http://10.0.1.91:3100/loki/api/v1/push
```

---

# 3. Nếu muốn lấy log systemd (khuyên dùng)

Thêm:

```sh
loki.source.journal "journal" {  
  forward_to = [loki.write.default.receiver]  
  relabel_rules = [  
    { source_labels = ["__journal__systemd_unit"], target_label = "unit" }  
  ]  
}
```

---

# 4. Start Alloy

```sh
sudo systemctl start alloy  
sudo systemctl status alloy
```