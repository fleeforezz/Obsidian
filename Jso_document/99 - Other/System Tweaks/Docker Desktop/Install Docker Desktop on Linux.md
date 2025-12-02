# Set up Docker’s package repository

## Set up the repository

> Update the `apt` package index and install packages to allow `apt` to use a repository over HTTPS:

```shell
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
```

> Add Docker’s official GPG key:

```shell
sudo install -m 0755 -d /etc/apt/keyrings
```

```shell
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

```shell
sudo chmod a+r /etc/apt/keyrings/docker.gpg
```

> Use the following command to set up the repository:

```shell
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

## Install Docker Engine

> Update the `apt` package index:

```shell
sudo apt-get update
```

> Install Docker Engine, containerd, and Docker Compose.

```shell
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

# Download latest DEB package

[Docker](https://desktop.docker.com/linux/main/amd64/docker-desktop-4.19.0-amd64.deb?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-linux-amd64)

# Install the package with apt

```shell
sudo apt-get update
```

```shell
sudo apt-get install ./docker-desktop-<version>-<arch>.deb
```