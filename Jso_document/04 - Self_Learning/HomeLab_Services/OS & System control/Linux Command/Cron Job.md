Auto reboot/shutdown :

```shell
sudo crontab -e
```

Ex :

```shell
30 11 * * 1-5 /sbin/shutdown -h now
30 10 * * 0,6 /sbin/shutdown -h now
```

This would shutdown the PC at 11:30 from Monday to Friday and on 10:30 on Saturday and Sunday. The structure is very simple :

`minute (0-59), hour (0-23, 0 = midnight), day (1-31), month (1-12), weekday (0-6, 0 = Sunday), command`

```shell
# Example of job definition:
# .---------------- minute (0 - 59)
# |  .------------- hour (0 - 23)
# |  |  .---------- day of month (1 - 31)
# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  * user-name command to be executed
```

## Create a Cron job that can execute from bash file

### For Update system

Create a bash file

```shell
touch index.sh
```

Use nano or vim to edit the .sh file

```shell
nano/vim index.sh
```

```shell
#!/bin/bash

sudo apt update

sudo apt upgrade -y
```

Change permission

```shell
chmod +x index.sh
```

Run bash file

```shell
/path/to/index.sh
```

Create a cron job

```shell
sudo crontab -e
```

```shell
30 11 * * 1-5 /path/to/index.sh
```
