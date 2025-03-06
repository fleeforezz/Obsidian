---
banner: https://www.home-assistant.io/images/blog/2023-09-ha10/logo-cover.png
content-start: "300"
banner-display: cover
banner-fade: "-100"
---

## Install

> [!note]
> Make sure you have [[Docker]] and [[Docker Compose]]

## Docker

> Create a folder name HASS

```shell
mkdir HomeAssistant
```

```shell
sudo docker run -d \
  --name=homeassistant \
  --net=host \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Asia/Ho_Chi_Minh \
  -p 8123:8123 `#optional` \
  -v /home/nhat/HomeAssistant:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/homeassistant:latest
```
--> WebUi: `http://localhost:8123` 

## Docker Compose (Reccommend)

```yaml
version: '3'
services:
  homeassistant:
    container_name: homeassistant
    image: "ghcr.io/home-assistant/home-assistant:stable"
    volumes:
      - /App/HomeAssistant/config:/config
      - /slowZ1/DataStore/Navidrome/music:/media
      - /etc/localtime:/etc/localtime:ro
    restart: unless-stopped
    privileged: true
    network_mode: host
```

## 404 problem

> If you using SSL using [[Nginx Proxy Manager]] with HomeAssistant you have to add extra config in the `configuration.yml` file.

```shell
http:
    use_x_forwarded_for: true
    trusted_proxies:
        - 0.0.0.0/0
        - 192.168.1.0/24
```
--> Restart home assistant to take effect

## Home Assistant OS

### Obtain the VM image
  
- Navigate to the installation page on the HA website: [https://www.home-assistant.io/installation/alternative](https://www.home-assistant.io/installation/alternative)  
  
- Simply right-click the KVM/Proxmox link and copy the address  
  
- In your Proxmox console, use wget to download the file  
  

```bash
wget <ADDRESS>
```

- Expand the compressed image  

```bash
unxz </path/to/file.qcow2.xz>
```

---

### Create the VM  
  
General:  
- Select your VM name and ID  
- Select 'start at boot'  
  
OS:  
- Select 'Do not use any media'  
  
System:  
- Change 'machine' to 'q35'  
- Change BIOS to OVMF (UEFI)  
- Select the EFI storage (typically local-lvm)  
- Uncheck 'Pre-Enroll keys'  
  
Disks:  
- Delete the SCSI drive and any other disks  
  
CPU:  
- Set minimum 2 cores  
  
Memory:  
- Set minimum 4096 MB  
  
Network:  
- Leave default unless you have special requirements (static, VLAN, etc)  
  
  
Confirm and finish. Do not start the VM yet.  
  

---

### Add the image to the VM  
  
- In your node's console, use the following command to import the image from the host to the VM  
  

Bash:

```bash
qm importdisk <VM ID> </path/to/file.qcow2> <EFI location>
```

  
For example,  
  

Bash:

```bash
qm importdisk 205 /home/user/haos_ova-12.0.qcow2 local-lvm
```

  
  
- Close the node's console and select your HA VM  
  
- Go to the 'Hardware' tab  
  
- Select the 'Unused Disk' and click the 'Edit' button  
  
- Check the 'Discard' box if you're using an SSD then click 'Add'  
  
- Select the 'Options' tab  
  
- Select 'Boot Order' and hit 'Edit'  
  
- Check the newly created drive (likely scsi0) and uncheck everything else  
  

---

  
### Finish Up  
  
- Start the VM  
  
- Check the shell of the VM. If it booted up correctly, you should be greeted with the link to access the Web UI.  
  
- Navigate to <VM IP>:8123  
  
Done. Everything should be up and running now.