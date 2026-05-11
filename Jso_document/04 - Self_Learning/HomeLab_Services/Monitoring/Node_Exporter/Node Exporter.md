# 🚀 1. Tạo user riêng (best practice)

```sh
sudo useradd --no-create-home --shell /bin/false node_exporter
```

👉 Tránh chạy bằng root

---

# 📦 2. Download binary

```sh
cd /tmp  
  
VERSION="1.11.1"  
  
wget https://github.com/prometheus/node_exporter/releases/download/v${VERSION}/node_exporter-${VERSION}.linux-amd64.tar.gz  
tar -xvf node_exporter-${VERSION}.linux-amd64.tar.gz
```

---

# 📁 3. Move binary

```sh
sudo cp node_exporter-1.11.1.linux-amd64/node_exporter /usr/local/bin/
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter
```

---

# ⚙️ 4. Tạo systemd service

```sh
sudo nano /etc/systemd/system/node_exporter.service
```

Nội dung:

```sh
[Unit]  
Description=Node Exporter  
After=network.target  
  
[Service]  
User=node_exporter  
Group=node_exporter  
Type=simple  
ExecStart=/usr/local/bin/node_exporter  
  
Restart=always  
RestartSec=3  
  
[Install]  
WantedBy=multi-user.target
```

---

# ▶️ 5. Enable + start

```sh
sudo systemctl daemon-reexec  
sudo systemctl daemon-reload  
  
sudo systemctl enable node_exporter  
sudo systemctl start node_exporter
```

---

# ✅ 6. Kiểm tra

```sh
sudo systemctl status node_exporter
```

Hoặc:

```sh
curl http://localhost:9100/metrics
```

👉 Nếu thấy metrics → OK

# Xoá node exporter
## Stop service

```sh
sudo systemctl stop node_exporter
```

## Disable (không cho auto start)

```sh
sudo systemctl disable node_exporter
```

## Xoá service file

```sh
sudo rm /etc/systemd/system/node_exporter.service  
sudo systemctl daemon-reload
```

## Xoá binary

```sh
sudo rm /usr/local/bin/node_exporter
```