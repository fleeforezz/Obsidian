## Configuring Alerts

install dependencies

```shell
apt install -y libsasl2-modules mailutils
```

Configure app passwords on your Google account

[Google Account](https://myaccount.google.com/apppasswords)

Configure postfix

```shell
echo "[smtp.gmail.com](<http://smtp.gmail.com/>) [your-email@gmail.com](<mailto:your-email@gmail.com>):YourAppPassword" > /etc/postfix/sasl_passwd
```

update permissions

```shell
chmod 600 /etc/postfix/sasl_passwd
```

hash the file

```shell
postmap hash:/etc/postfix/sasl_passwd
```

check to to be sure the db file was create

```shell
cat /etc/postfix/sasl_passwd.db
```

edit postfix config

```shell
nano /etc/postfix/main.cf
```

—> create a new line and paste this conf:

```shell
# google mail configuration

relayhost = smtp.gmail.com:587
smtp_use_tls = yes
smtp_sasl_auth_enable = yes
smtp_sasl_security_options =
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
smtp_tls_CAfile = /etc/ssl/certs/Entrust_Root_Certification_Authority.pem
smtp_tls_session_cache_database = btree:/var/lib/postfix/smtp_tls_session_cache
smtp_tls_session_cache_timeout = 3600s
```

—> find `relayhost =` and add a #

```shell
postfix reload
```

```shell
echo "This is a test message sent from postfix on my Proxmox Server" | mail -s "Test Email from Proxmox" [your-email@gmail.com](<mailto:your-email@gmail.com>)
```

## Config email in Proxmox

Head to `Datacenter` → Expand `Permissions` → `Users` → `root` change the email

### ZFS alert

make sure this line is uncomment , if you have another user add the same line as root and change the to the username

```shell
nano /etc/zfs/zed.d/zed.rc
```

## Change the root name in email

install dependency

```shell
apt install postfix-pcre
```

edit config

```shell
nano /etc/postfix/smtp_header_checks
```

—> Paste this command:

```shell
/^From:.*/ REPLACE From: nameyoulike-alert [pve1-alert@something.com](<mailto:pve1-alert@something.com>)
```

hash the file

```shell
postmap hash:/etc/postfix/smtp_header_checks
```

check the contents of the file

```shell
cat /etc/postfix/smtp_header_checks.db
```

add the module to our postfix config

```shell
nano /etc/postfix/main.cf
```

add to the end of the file

```shell
smtp_header_checks = pcre:/etc/postfix/smtp_header_checks
```

reload postfix service

```shell
postfix reload
```
