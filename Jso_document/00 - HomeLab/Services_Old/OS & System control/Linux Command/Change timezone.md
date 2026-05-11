
Check your current time zone in your system

```shell
timedatectl
```

List all time zone available

```shell
timedatectl list-timezones
```

Once you identify your time zone, run this command

```shell
sudo timedatectl set-timezone <your_time_zone>
```
