# Before install third party

> Make sure to have `curl` on your machine

```shell
sudo apt install curl -y
```

## ZFS Manager
### Requirement
+ Cockpit: 201+
+ NFS (Optional)
+ Samba: 4+ (Optional)
+ ZFS: 0.8+

```shell
git clone https://github.com/45drives/cockpit-zfs-manager.git
```

```shell
sudo cp -r cockpit-zfs-manager/zfs /usr/share/cockpit
```

## File Sharing

```shell
curl -sSL https://repo.45drives.com/setup | sudo bash
```

```shell
sudo apt-get update
sudo apt install cockpit-file-sharing -y
```

## Navigator

```shell
wget https://github.com/45Drives/cockpit-navigator/releases/download/v0.5.10/cockpit-navigator_0.5.10-1focal_all.deb
```

```shell
sudo apt install ./cockpit-navigator_0.5.10-1focal_all.deb -y
```

## Identities

```shell
curl -sSL https://repo.45drives.com/setup | sudo bash
```

```shell
sudo apt update
sudo apt install cockpit-identities -y
```
