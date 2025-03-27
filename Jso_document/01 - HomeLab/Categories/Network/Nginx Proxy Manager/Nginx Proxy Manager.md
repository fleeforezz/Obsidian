
> [!note]
> Make sure you have [[Docker]] and [[Docker Compose]]

```yaml
version: '3.8'
services:
  app:
    image: 'jc21/nginx-proxy-manager:latest'
    restart: unless-stopped
    ports:
      # These ports are in format <host-port>:<container-port>
      - '80:80' # Public HTTP Port
      - '443:443' # Public HTTPS Port
      - '81:81' # Admin Web Port
      # Add any other Stream port you want to expose
      # - '21:21' # FTP
    environment:
      PUID: 1000
      PGID: 1000
      # Mysql/Maria connection parameters:
      DB_MYSQL_HOST: "db"
      DB_MYSQL_PORT: 3306
      DB_MYSQL_USER: "npm" # change this
      DB_MYSQL_PASSWORD: "npm" # change this
      DB_MYSQL_NAME: "npm"
      # Uncomment this if IPv6 is not enabled on your host
      # DISABLE_IPV6: 'true'
    volumes:
      - ./data:/data
      - ./letsencrypt:/etc/letsencrypt
    depends_on:
      - db

  db:
    image: 'jc21/mariadb-aria:latest'
    restart: unless-stopped
    environment:
      MYSQL_ROOT_PASSWORD: 'npm' # change this
      MYSQL_DATABASE: 'npm'
      MYSQL_USER: 'npm' # change this
      MYSQL_PASSWORD: 'npm'  # change this
    volumes:
      - ./mysql:/var/lib/mysql
```
--> Default Email : admin@example.com
--> Default Password : changeme