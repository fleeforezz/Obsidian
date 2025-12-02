For Ubuntu Server 24.04
```shell
sudo nano /etc/netplan/50-cloud-init.yaml
```

```shell
network:
  version: 2
  ethernets:
    eth0:
      match:
        macaddress: "bc:24:11:85:13:7f"
      set-name: "eth0"
      dhcp4: false
      addresses:
        - 192.168.1.100/24
      gateway4: 192.168.1.1
      nameservers:
        addresses:
          - 8.8.8.8
          - 1.1.1.1
```

For Ubuntu Server 22.04
```shell
sudo nano /etc/netplan/00-installer-config.yaml
```

```shell
network:
    ethernets:
        ens18:
            addresses:
            - 10.0.1.12/24
            nameservers:
                addresses:
                - 10.0.1.37
                - 1.1.1.1
                search: []
            routes:
            -   to: default
                via: 10.0.1.1
    version: 2
```