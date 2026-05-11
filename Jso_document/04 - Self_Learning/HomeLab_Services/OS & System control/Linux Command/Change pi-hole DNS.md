## 1. Edit config

sudo nano /etc/systemd/resolved.conf

---

## 2. Set DNS của bạn (Pi-hole)

[Resolve]  
DNS=10.0.1.91  
FallbackDNS=8.8.8.8  
Domains=~.

---

## 3. Restart

sudo systemctl restart systemd-resolved

---

## 4. Verify

resolvectl status

👉 phải thấy:

DNS Servers: 10.0.1.91

# Cách fix domain (khuyên mạnh)

Đổi:

database.local ❌

👉 thành:

database.internal  
db.home.lab  
database.lan

---

# 🔥 Nếu bạn bắt buộc phải dùng `.local`

Thêm vào:

sudo nano /etc/systemd/resolved.conf

Domains=~local

---

Restart:

sudo systemctl restart systemd-resolved

---

# 🧪 Test lại

resolvectl query database.local

---

# 🚀 Cách “pro” hơn (không bị đụng systemd)

Nếu bạn dùng Netplan:

sudo nano /etc/netplan/*.yaml

nameservers:  
  addresses: [10.0.1.91]

---

Apply:

sudo netplan apply

---

# 🧠 Tóm lại

|Hiện tượng|Giải thích|
|---|---|
|127.0.0.53|systemd-resolved|
|bị reset|do symlink|
|`.local` lỗi|do mDNS|

---

# ✅ Best practice cho bạn

DNS: Pi-hole (10.0.1.91)  
Domain: .internal / .lan  
Config: systemd-resolved hoặc netplan**