
```shell
ip link show
```

> note the network interface (Ussually ens18)

```shell
sudo nano /etc/network/interfaces
```

> It will look like this

![[Network interface.png]]

```shell
auto ens18
iface ens18 inet static
  address 192.168.0.2
  netmask 255.255.255.0
  gateway 192.168.0.1
  dns-nameservers 89.207.128.252 89.207.130.252
```

> Make sure not to change the loopback adapter config

```shell
sudo systemctl restart networking
```