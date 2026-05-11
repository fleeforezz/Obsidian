> Add or enable contrib repo to `/etc/apt/sources.list`

```shell
sed -r -i 's/^deb(.*)$/deb\\1 contrib/g' /etc/apt/sources.list
```

> Update apt repo database.

```shell
apt update
```

> Install zfs package.

```shell
apt install linux-headers-amd64 zfsutils-linux zfs-dkms zfs-zed
```

> Test if zfs has installed

```shell
zfs version
```
