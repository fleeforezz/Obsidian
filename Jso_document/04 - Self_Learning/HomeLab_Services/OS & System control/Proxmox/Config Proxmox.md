# Proxmox as a file server
## Disk Config

```shell
cfdisk /dev/(Name of disk to be formated)
```

```shell
ls /dev/disk/by-id
```

```shell
qm set "vm number" -"disk type""volume number" /dev/disk/by-id/"drive identifier”
```

```shell
qm set 100 -sata1 /dev/disk/by-id/ata-WDC_WD5000AAKX-60U6AA0_WD-WCC2EEZ19559
```

```shell
qm set 100 -sata2 /dev/disk/by-id/ata-WDC_WD5000AAKX-60U6AA0_WD-WCC2EEZ70231
```

```shell
qm set 100 -sata3 /dev/disk/by-id/ata-WDC_WD5000AZLX-60K2TA0_WD-WCC6Z1AFFDVL
```

```shell
qm set 100 -sata4 /dev/disk/by-id/ata-WDC_WD5000AZLX-60K2TA0_WD-WCC6Z2AJ92A4
```

```shell
qm set 100 -scsi6 /dev/disk/by-id/ata-ST500DM002-1BD142_Z3TPXA82
```

```shell
qm set 100 -scsi7 /dev/disk/by-id/ata-ST500LM030-2E717D_ZDE03JL4
```

```shell
qm set 100 -scsi8 /dev/disk/by-id/ata-KINGSTON_SA400S37_120G_cc000000000000002575
```

```shell
qm set 100 -scsi8 /dev/disk/by-id/ata-kimtigo_SSD_240GB_KC221220H8B1437
```

```shell
qm set 100 -scsi8 /dev/disk/by-id/ata-VSP-128G_QVE_128GQV02051052201840
```

Dark theme:

```shell
wget <https://raw.githubusercontent.com/Weilbyte/PVEDiscordDark/master/PVEDiscordDark.sh>
```

```shell
bash PVEDiscordDark.sh install
```

—> Then refresh the page

ZFS config:

$ Mount a zfs:

```shell
zfs create -o mountpoint=/mnt/<mount name> <zfs poolname>/<mount name>
```

```shell
zpool status
```

$ Delete a Zfs pool:

```shell
unmount -f /dev/sdX
```

```shell
zpool destroy <zfs name>
```

$ Smart check:

```shell
smartctl -a /dev/sdX
```

## Install File-Server

## Config

```shell
nano /etc/apt/sources.list
```

add to line

```shell
deb <http://deb.debian.org/debian> bullseye-backports main contrib
```

```shell
apt update && apt upgrade
```

## Install Cockpit

```shell
apt install -t bullseye-backports cockpit --no-install-recommends
```

```shell
nano /etc/cockpit/disallowed-users
```

—> delete root

## Install plugins for Cockpit

```shell
wget <https://github.com/45Drives/cockpit-file-sharing/releases/download/v3.3.2/cockpit-file-sharing_3.3.2-1focal_all.deb>
```

```shell
wget <https://github.com/45Drives/cockpit-navigator/releases/download/v0.5.10/cockpit-navigator_0.5.10-1focal_all.deb>
```

```shell
wget <https://github.com/45Drives/cockpit-identities/releases/download/v0.1.10/cockpit-identities_0.1.10-1focal_all.deb>
```

```shell
apt install ./*.deb
```

```shell
rm *.deb
```

## Config ZFS Mount

Config the ZFS pool in proxmox

```shell
zfs list
```

```shell
zfs create zfs-name/media
```

```shell
zfs set quota=size zfs-name/media
```

```shell
pct set <CTid> --mpX /zfs-name/media,mp=/mnt/media
```

```shell
chmod -R 777 /zfs-name/media
```

## Config SMB share

1. Create new group by click the `Identities` option
2. Create a `user` and add to the `group` that you just create

![[Pasted image 20240302122621.png]]

1. Change the Samba `password` by going to `Identities` and click on users and find the Set Samba Password option
2. Go to `File Sharing` and create a new Samba share

![[Pasted image 20240302122643.png]]

## Delete LXC using command

```bash
rm /etc/pve/lxc/id.conf
```

