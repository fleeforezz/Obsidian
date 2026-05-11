> Install needed packages.

```shell
sudo apt install apache2 apache2-doc apache2-utils
```

> Disable the default website.

```shell
sudo a2dissite 000-default.conf
```

```shell
sudo systemctl reload apache2
```

> Firewall configuration.

```shell
sudo ufw app list
```

--> The applications we will be allowing is Apache Full and OpenSSH.

```shell
sudo ufw allow 'Apache Full'
```

```shell
sudo ufw allow OpenSSH
```

--> From here let's enable our firewall and check the status.

> Creating a Website

Creating directories for our website is easy and it will be done in the default `/var/www/html` directory. With the commands below replace `example.com` with the domain you'll be using.

```shell
cd /var/www/html
```

```shell
sudo mkdir [example.com](<http://example.com/>)
```

```shell
cd [example.com](<http://example.com/>)
```

```shell
sudo mkdir public_html
```

```shell
sudo mkdir logs
```

```shell
sudo mkdir backups
```

--> With our directories created we are going to go back to the location of the site configurations and create a new one for our website.

```shell
cd /etc/apache2/sites-available
```

```shell
sudo nano example.com.conf
```

--> Within this configuration you'll want to copy/paste the configuration below. Replacing all the everything to match your setup.

```shell
<VirtualHost *:80>
     ServerAdmin webmaster@example.com
     ServerName example.com
     ServerAlias www.example.com
     DocumentRoot /var/www/html/example.com/public_html/
     ErrorLog /var/www/html/example.com/logs/error.log
     CustomLog /var/www/html/example.com/logs/access.log combined
</VirtualHost>
```


--> Now, we run a few commands to enable our new configuration.

```shell
sudo a2ensite [example.com](<http://example.com/>)
```

```shell
systemctl reload apache2
```

> To add something to change the webpage

```shell
cd /var/www/html/example.com/public_html
```

```shell
nano index.html
```
