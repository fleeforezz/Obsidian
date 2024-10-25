# Install

> [!note]
> Make sure you have [[Docker]] and [[Docker Compose]]
## Config User

> Create a user name `bitwarden`.

```shell
sudo adduser bitwarden
```

> Set password for bitwarden user (strong password).

```shell
sudo passwd bitwarden
```

> Create a docker group (if it doesn’t already exist).

```shell
sudo groupadd docker
```

> Add the bitwarden user to the docker group.

```shell
sudo usermod -aG docker bitwarden
```

> Create a bitwarden directory.

```shell
sudo mkdir /opt/bitwarden
```

> Set permissions for the `/opt/bitwarden` directory

```shell
sudo chmod -R 700 /opt/bitwarden
```

> Set bitwarden user as owner of the `/opt/bitwarden` directory.

```shell
sudo chown -R bitwarden:bitwarden /opt/bitwarden
```

## Install Bitwarden

> Download the Bitwarden installation script (bitwarden.sh) to your machine.

```shell
curl -Lso [bitwarden.sh](<http://bitwarden.sh/>) "<https://func.bitwarden.com/api/dl/?app=self-host&platform=linux>" && chmod 700 [bitwarden.sh](<http://bitwarden.sh/>)
```

> Run the installer script. A `./bwdata` directory will be created relative to the location of bitwarden.sh.

```shell
sudo ./bitwarden.sh install
```
+ If you have domain name, go ahead and use it. If you don’t have a domain name use your IP address.
+ Press n for ignore Cert
+ Enter your vault name

```shell
sudo nano bwdata/env/global.override.env
```

```shell
sudo ./bitwarden.sh restart
```

# Uninstall

```shell
sudo ./bitwarden.sh uninstall
```