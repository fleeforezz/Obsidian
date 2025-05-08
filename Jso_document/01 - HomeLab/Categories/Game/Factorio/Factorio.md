# Install

> Download Factorio headless server

```shell
wget -O factorio_headless.tar.gz https://www.factorio.com/get-download/2.0.47/headless/linux64
```

> Unzip .tar.gz file to `/opt`

```shell
cd /opt
```

```shell
sudo tar -xf /factorio_headless.tar.gz
```

> Create a save game directory and a zip file inside factorio file.

```shell
mkdir saves
```

```shell
./bin/x64/factorio --create ./saves/yay.zip
```

> Make the server auto start when system boot.

```shell
sudo nano /etc/systemd/system/factorio.service
```

```shell
[Unit]
Description=Factorio Headless Server
[Service]
Type=simple
User=factorio
ExecStart=/opt/factorio/bin/x64/factorio --start-server /opt/factorio/saves/yay.zip --server-settings /opt/factorio/data/server-settings.json
```

> Create a server-settings.json.

```shell
adduser factorio
```

```shell
chown -R factorio:factorio /opt/factorio
```

```shell
cd /opt/factorio/data
```

```shell
cp server-settings.example.json server-settings.json
```

--> You can config the `server-settings.json` file to fit your needs

```shell
nano server-settings.json
```

# Fire up Factorio server

```shell
systemctl daemon-reload
```

```shell
systemctl start factorio
```

```shell
systemctl status factorio
```

#### Read more
[[Create Custom map-gen and map-settings]]


