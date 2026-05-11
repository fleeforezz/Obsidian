# Install

```shell
curl -fsSL <https://pkgs.tailscale.com/stable/ubuntu/jammy.noarmor.gpg> | sudo tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null
```

```shell
curl -fsSL <https://pkgs.tailscale.com/stable/ubuntu/jammy.tailscale-keyring.list> | sudo tee /etc/apt/sources.list.d/tailscale.list
```

```shell
sudo apt-get update
```

```shell
sudo apt-get install tailscale
```

```shell
sudo tailscale up
```

```shell
tailscale ip -4
```

# Uninstall 

```shell
sudo apt-get remove tailscale
```
