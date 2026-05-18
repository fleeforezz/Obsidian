# Send email notification before shutdown

## Send email setup
### Install postfix and additional packages

Ensure these packages are installed:
+ postfix
+ mailutils
+ rsyslog
+ libsasl2-modules

```shell
apt update && apt install postfix mailutils rsyslog libsasl2-modules -y
```

### Verify Postfix Configuration

Check that the following lines are present in **/etc/postfix/main.cf**

```bash
relayhost = [smtp.gmail.com]:587
smtp_use_tls = yes
smtp_tls_security_level = encrypt
smtp_sasl_auth_enable = yes
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
smtp_sasl_mechanism_filter = plain
smtp_sasl_security_options = noanonymous
```

### Create a credentials File 

This file stored smtp server credentials

```bash
[smtp.gmail.com]:587 your_email@gmail.com:your_password
```

If using 2FA, you must use an **App Password** instead of your regular password. 

Ensure permission is correct

```bash
sudo chmod 600 /etc/postfix/sasl_passwd
sudo postmap /etc/postfix/sasl_passwd
```

### Restart postmap

```bash
systemctl restart postfix
```

### Test The Email System

```bash 
echo "Proxmox test email" | mail -s "Proxmox Mail Test" your_email@example.com
```

Monitor the mail logs:

Ensure add this line inside **10-mail.conf** file
```bash 
nano /etc/rsyslog.d/10-mail.conf
```

```bash
mail.*    -/var/log/mail.log
```

Test log

```bash
tail -f /var/log/mail.log
```


## Setup cronjob for execute command

### Cronjob for shutdown
Configure crontab:

```bash
crontab -e
```

Add this line of code

```bash
15 23 * * * /sbin/shutdown -h now
```

explain:
+ The system will be shutdown at 23:15 every day
+ following the timer is the path or command to execute

### Cronjob for sending email

Create a bash file at **/usr/local/bin/shutdown-email.sh** to send email

```bash
#!/bin/bash

echo "Proxmox will be shutdown after 5 minutes" | mail -s "Proxmox Shutdown alert" your_email@gmail.com 
```

Configure crontab:

```bash
crontab -e
```

Add this line of code

```bash
10 23 * * * /usr/local/bin/shutdown-email.sh
```