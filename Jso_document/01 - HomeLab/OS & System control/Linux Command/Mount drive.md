View disk :

```shell
lsblk
```

![[Pasted image 20240302094237.png]]

Wipe the drive u want to use :

```shell
sudo wipefs -a /dev/yourdrive
```

![[Pasted image 20240302094255.png]]

Partition Drive:

```shell
gdisk /dev/yourdrive
```

![[Pasted image 20240302094317.png]]

press `n`
then press `1`
then press enter `x3`
then press `w` to write

```shell
sudo gdisk -l /dev/sdb
```

Format the drive :

```shell
sudo mkfs.ext4 /dev/path
```

![[Pasted image 20240302094357.png]]

Mount a drive :

```shell
cd /mnt
```

```shell
sudo mkdir name-whatever-you-like
```

![[Pasted image 20240302094632.png]]

```shell
sudo chattr +i your-drive-name
```

![[Pasted image 20240302094649.png]]

```shell
sudo blkid
```

![[Pasted image 20240302094706.png]]

`copy your disk UUID`

```shell
sudo nano /etc/fstab
```

![[Pasted image 20240302094725.png]]

`paste the ur UUID and write /mnt/ur-drive-name ext4 defaults 0 2`

```shell
mount -a
```

```shell
df -h /mnt/ur-drive-name
```

Permissions :

```shell
cd /mnt/ur-drive-name
```

```shell
ls -l
```

```shell
cd ..
```

```shell
sudo chown -R username ur-drive-name
```

![[Pasted image 20240302094820.png]]

```shell
sudo chmod -R 750 ur-drive-name
```

If you want to change the mount point name :

```shell
sudo su
```

```shell
mkdir -p /mnt/name-what-you-want
```

```shell
nano /etc/fstab
```

—> Replace the old name with the new one

Check time :

```shell
fuser -cu /old-name
```

```shell
unmount old-name
```

```shell
mkdir -p /mnt/new-name
```

Check time :

```shell
df -hP new-name
```
