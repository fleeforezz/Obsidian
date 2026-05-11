
```shell
sudo nano /etc/ssh/sshd_config
```

```shell

...

#LoginGraceTime 2m
PermitRootLogin no
#StrictModes yes
#MaxAuthTries 6
#MaxSessions 10

...

```
