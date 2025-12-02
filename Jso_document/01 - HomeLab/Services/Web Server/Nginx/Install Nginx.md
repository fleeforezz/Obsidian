# Install

```shell
sudo apt update
```

```shell
sudo apt install nginx
```

# Adjusting the Firewall

```shell
sudo ufw app list
```

As demonstrated by the output, there are three profiles available for Nginx:

- **Nginx Full**: This profile opens both port 80 (normal, unencrypted web traffic) and port 443 (TLS/SSL encrypted traffic)
- **Nginx HTTP**: This profile opens only port 80 (normal, unencrypted web traffic)
- **Nginx HTTPS**: This profile opens only port 443 (TLS/SSL encrypted traffic)

It is recommended that you enable the most restrictive profile that will still allow the traffic you’ve configured. Right now, we will only need to allow traffic on port 80.

You can enable this by typing :

```shell
sudo ufw allow 'Nginx HTTP’
```

```shell
sudo ufw enable
```

```shell
sudo ufw status
```

# Checking your Web Server

```shell
systemctl status nginx
```

Disable the Nginx default web page :

```shell
sudo rm /etc/nginx/sites-enabled/default
```

```shell
sudo service nginx reload
```

# Managing the Nginx Process

To stop your web server, type :

```shell
sudo systemctl stop nginx
```

To start the web server when it is stopped, type:

```shell
sudo systemctl start nginx
```

To stop and then start the service again, type:

```shell
sudo systemctl restart nginx
```

If you are only making configuration changes, Nginx can often reload without dropping connections. To do this, type:

```shell
sudo systemctl reload nginx
```

By default, Nginx is configured to start automatically when the server boots. If this is not what you want, you can disable this behavior by typing:

```shell
sudo systemctl disable nginx
```

To re-enable the service to start up at boot, you can type:

```shell
sudo systemctl enable nginx
```

# Setting Up Server Blocks (Recommended)

Create ur domain name :

```shell
sudo mkdir -p /var/www/html/ur_domain/public_html
```

Next, assign ownership of the directory with the `$USER` environment variable :

```shell
sudo chown -R $USER:$USER /var/www/html/ur_domain/public_html
```

To ensure that your permissions are correct and allow the owner to read, write, and execute the files while granting only read and execute permissions to groups and others, you can input the following command :

```shell
sudo chmod -R 755 /var/www/html/your_domain
```

Next, create a sample `index.html` page using `nano` or your favorite editor :

```shell
sudo nano /var/www/html/ur_domain/public_html/index.html
```

Inside, add the following sample HTML :

```HTML
<html>
    <head>
        <title>Welcome to your_first website</title>
    </head>
    <body>
        <h1>Success!  The your_domain server block is working!</h1>
    </body>
</html>
```

In order for Nginx to serve this content, it’s necessary to create a server block with the correct directives. Instead of modifying the default configuration file directly, let’s make a new one at `/etc/nginx/sites-available/your_domain` :

```shell
sudo nano /etc/nginx/sites-available/ur_domain
```

```shell
server {
        listen 80;
        listen [::]:80;

        root /var/www/html/ur_domain/public_html;
        index index.html index.htm index.nginx-debian.html;

        server_name ur_domain www.ur_domain;

        location / {
                try_files $uri $uri/ =404;
        }
}
```

Next, let’s enable the file by creating a link from it to the `sites-enabled` directory, which Nginx reads from during startup :

```shell
sudo ln -s /etc/nginx/sites-available/your_domain /etc/nginx/sites-enabled/
```

Two server blocks are now enabled and configured to respond to requests based on their `listen` and `server_name` directives (you can read more about how Nginx processes these directives [here](https://www.digitalocean.com/community/tutorials/understanding-nginx-server-and-location-block-selection-algorithms)):

- `your_domain`: Will respond to requests for `your_domain` and `www.your_domain`.
- `default`: Will respond to any requests on port 80 that do not match the other two blocks.

To avoid a possible hash bucket memory problem that can arise from adding additional server names, it is necessary to adjust a single value in the `/etc/nginx/nginx.conf` file. Open the file:

```shell
sudo nano /etc/nginx/nginx.conf
```

Find the `server_names_hash_bucket_size` directive and remove the `#` symbol to uncomment the line. If you are using nano, you can quickly search for words in the file by pressing `CTRL` and `w`.

Next, test to make sure that there are no syntax errors in any of your Nginx files :

```shell
sudo nginx -t
```

If there aren’t any problems, restart Nginx to enable your changes :

```shell
sudo systemctl restart nginx
```