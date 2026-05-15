## 1. Install NFS 
```sh
sudo apt update
sudo apt install nfs-common
```

## 2. Create a mount point folder
```sh
sudo mkdir -p /mnt/nfs-share
```

## 3. Test manual mount 
```sh
sudo mount -t nfs 192.168.1.10:/data /mnt/nfs-share
```

## 4.  Add to fstab
Open file:
```sh
sudo nano /etc/fstab
```
Add this line of code:
```sh
192.168.1.10:/data  /mnt/nfs-share  nfs  _netdev,noatime,nofail,x-systemd.automount  0  0
```
**Explain:**
- `192.168.1.10:/data` → NFS server
- `/mnt/nfs-share` → thư mục local
- `nfs` → loại filesystem
- `_netdev` → **rất quan trọng**, đảm bảo mount sau khi mạng sẵn sàng