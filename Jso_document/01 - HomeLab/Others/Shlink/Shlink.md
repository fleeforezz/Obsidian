# Install

> [!note]
> Make sure you have [[Docker]] and [[Docker Compose]]

```yaml
version: "3"

services:
  shlink:
    image: shlinkio/shlink:stable
    restart: always
    container_name: shlink-backend
    environment:
      - TZ="America/Denver"
      - DEFAULT_DOMAIN=192.168.1.66:8987 #no http/https. no trailing slash
      - IS_HTTPS_ENABLED=false
      - GEOLITE_LICENSE_KEY=Ea2FHWtkMx2q5MIN #we'll need to get this key from maxmind.com
      - DB_DRIVER=maria
      - DB_USER=shlink
      - DB_NAME=shlink
      - DB_PASSWORD=password #change this
      - DB_HOST=database
    depends_on:
      - database
    ports:
      - 8987:8080

  database:
    image: mariadb:10.8
    restart: always
    container_name: shlink-database
    environment:
      - MARIADB_ROOT_PASSWORD=password #change this
      - MARIADB_DATABASE=shlink
      - MARIADB_USER=shlink
      - MARIADB_PASSWORD=password #change this
    volumes:
      - /home/docker/shlink:/var/lib/mysql

  shlink-web-client:
    image: shlinkio/shlink-web-client
    restart: always
    container_name: shlink-gui
    volumes:
      - /home/docker/shlink/servers.json:/usr/share/nginx/html/servers.json #this file will be generated automatically
    depends_on:
      - shlink
    ports:
      - 8081:80
```