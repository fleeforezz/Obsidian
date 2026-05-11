
```shell
sudo visudo
```

add the following configuration at the `end of the file`

```shell
[username]    ALL=(ALL:ALL) NOPASSWD: ALL
```

Check if the config work

```shell
sudo -l
```

if you see this then it’s work

![[Pasted image 20240302095027.png]]