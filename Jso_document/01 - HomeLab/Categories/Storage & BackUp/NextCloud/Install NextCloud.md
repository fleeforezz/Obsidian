# Manual Install

## Add User Account

```shell
adduser <username>
```

```shell
sudo usermod -aG sudo <username>
```

## Update Packages

```shell
sudo apt update
```

```shell
sudo apt dist-upgrade
```

```shell
sudo apt autoremove
```

## Download Nextcloud

```shell
wget <https://download.nextcloud.com/server/releases/latest.zip>
```

## MariaDB Setup

```shell
sudo apt install mariadb-server
```

```shell
systemctl status mariadb
```

## **Running the secure installation script**

```shell
sudo mysql_secure_installation
```

Y, Y, Y, Y, Y

## **Creating the Nextcloud Database**

```shell
sudo mariadb
```

```shell
CREATE DATABASE nextcloud;
```

```shell
SHOW DATABASES;
```

```shell
GRANT ALL PRIVILEGES ON nextcloud.* TO 'nextcloud'@'localhost' IDENTIFIED BY 'mypassword';
```

```shell
FLUSH PRIVILEGES;
```

> Press Ctrl+D to exit

## **Apache Webserver Setup**

```shell
sudo apt install php php-apcu php-bcmath php-cli php-common php-curl php-gd php-gmp php-imagick php-intl php-mbstring php-mysql php-zip php-xml
```

```shell
systemctl status apache2
```

```shell
sudo phpenmod bcmath gmp imagick intl
```

```shell
sudo apt install unzip
```

```shell
unzip latest.zip
```

```shell
sudo chown -R www-data:www-data nextcloud
```

```shell
sudo mv nextcloud /var/www
```

```shell
sudo a2dissite 000-default.conf
```

## **Creating a host configuration file for Nextcloud**

```shell
sudo nano /etc/apache2/sites-available/nextcloud.conf
```

```shell
<VirtualHost *:80>
    DocumentRoot "/var/www/nextcloud"
    ServerName nextcloud.learnlinux.cloud

    <Directory "/var/www/nextcloud/">
        Options MultiViews FollowSymlinks
        AllowOverride All
        Order allow,deny
        Allow from all
   </Directory>

   TransferLog /var/log/apache2/nextcloud_access.log
   ErrorLog /var/log/apache2/nextcloud_error.log

</VirtualHost>
```

```shell
sudo a2ensite apache-config-file-name.conf
```

## **Configuring PHP**

```shell
sudo nano /etc/php/8.1/apache2/php.ini
```

Adjust the following parameters:

```shell
memory_limit = 512M
upload_max_filesize = 200M
max_execution_time = 360
post_max_size = 200M
date.timezone = America/Detroit
opcache.enable=1
opcache.interned_strings_buffer=8
opcache.max_accelerated_files=10000
opcache.memory_consumption=128
opcache.save_comments=1
opcache.revalidate_freq=1
```

```shell
sudo a2enmod dir env headers mime rewrite ssl
```

```shell
sudo systemctl restart apache2
```

## Fix Error

### Access through untrusted domain

1. Go to Nextcloud config

```shell
cd /var/www/nextcloud/config
```

1. Change the IP for Nextcloud

```shell
Ex: 
<?php
  'trusted_domains' => 
  array (
    0 => '192.168.125.32', // this is Nextcloud WebUI ip
  ),

```

# Docker Compose (Recommend)

> Make sure you have [[Docker]] and [[Docker Compose]]

## Someone src

```yaml
version: '2'

volumes:
  nextcloud:
  db:

services:
  db:
    image: mariadb
    restart: always
    command: --transaction-isolation=READ-COMMITTED --binlog-format=ROW --innodb-file-per-table=1 --skip-innodb-read-only-compressed

    volumes:
      - db:/var/lib/mysql
    environment:
      - MYSQL_ROOT_PASSWORD=ncwnewucehiqchwei   #change
      - MYSQL_PASSWORD=uhfuiwehcuifhcqi         #change
      - MYSQL_DATABASE=nextcloud
      - MYSQL_USER=nextcloud

  app:
    image: nextcloud
    restart: always
    ports:
      - 10020:80
    links:
      - db
    volumes:
      - /path/to/data:/var/www/html
    environment:
      - MYSQL_PASSWORD=918234798213740927347982  #change to match the mysql_password above
      - MYSQL_DATABASE=nextcloud
      - MYSQL_USER=nextcloud
      - MYSQL_HOST=db
```

## Linuxserver.io src (Recommend use this)

```yaml
---
version: "2.1"
services:
  nextcloud:
    image: lscr.io/linuxserver/nextcloud:latest
    container_name: nextcloud
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Asia/Ho_Chi_Minh
    volumes:
      - /path/to/appdata:/config
      - /path/to/data:/data
    ports:
      - 443:443
    restart: unless-stopped
```

# Docker

```shell
docker run -d \
  --name=nextcloud \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Etc/UTC \
  -p 443:443 \
  -v /path/to/appdata:/config \
  -v /path/to/data:/data \
  --restart unless-stopped \
  lscr.io/linuxserver/nextcloud:latest
```

# AIO

```yaml
sudo docker run -d \
 --name nextcloud-aio-mastercontainer \
 --restart always \
 -p 8080:8080 \
 -p 8443:8443 \
 -e NEXTCLOUD_DATADIR="/Harbour/NextCloud/data" \
 -e SKIP_DOMAIN_VALIDATION=true \
 -v nextcloud_aio_mastercontainer:/mnt/docker-aio-config \
 -v /var/run/docker.sock:/var/run/docker.sock:ro \
 nextcloud/all-in-one:latest
```