
The test machine will be:
+ 2 Nodes (1 master and 1 worker)
+ 8 cores cpu, 8Gb rams, 32Gb rom, and an external HDD 500Gb
+ Linux server
# 1. Attach the Hard drive to the Worker node

Since the master node is usually reserved for control-plane activities, it's best to attach the 500Gb hard drive to the worker node.

## Steps to Attach the Disk

1. Physically Attach the Hard Drive:
	+ Connect the hard drive to server using SATA port
2. Verify the Disk is Recognized: 

```shell
lsblk
```

You should see the new disk, eg, `/dev/sdb`

3. Format the disk: Format with a filesystem (ex: ext4):

```shell
sudo mkfs.ext4 /dev/sdb
```

4. Mount The disk: Create a mount point and mount the disk:

```shell
sudo mkdir -p /mnt/longhorn-disk 
sudo mount /dev/sdb /mnt/longhorn-disk
```

Ensure the disk is mounted persistently across reboots by adding an entry to `/etc/fstab`:

```shell
echo '/dev/sdb /mnt/longhorn-disk ext4 defaults 0 2' | sudo tee -a /etc/fstab
```

