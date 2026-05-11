>First log into your server.

>Next, let's change our host files to match with the domain we will be hosting.

```shell
nano /etc/hostname
```

>Change the value *localhost* to *example.com* replacing example with your domain.

```shell
nano /etc/hosts
```

--> Add a `new line` under the local host line and match it with the image below.

> Add User ( if u don't have one ).

```shell
adduser ur-name
```

```shell
adduser ur-name sudo
```

```shell
su ur-name
```

```shell
sudo nano  /etc/ssh/sshd_config
```

--> Change the value of the key `PermitRootLogin` from `yes` to `no`
