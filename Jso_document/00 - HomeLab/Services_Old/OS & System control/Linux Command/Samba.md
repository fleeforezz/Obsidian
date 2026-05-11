
Install :

```shell
sudo apt install samba
```

Add a Samba user :

```shell
sudo smbpasswd -a existing-username
```

![[Pasted image 20240302094841.png]]

Create a Samba Share :

```shell
cd /etc/samba
```

```shell
sudo cp smb.conf smb.bk
```

```shell
sudo nano smb.conf
```

`press Ctrl+End and create a new line`

```shell
# Name u wnat to use
[share]
path = /mnt/ur-drive-name
valid users = username
read only = no
```

```shell
sudo systemctl restart smbd.service
```

```shell
testparm
```
