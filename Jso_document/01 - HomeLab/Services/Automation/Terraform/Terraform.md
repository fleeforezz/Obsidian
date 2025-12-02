---
banner: https://parallelstaff.com/wp-content/uploads/2023/12/terraform-1.png
content-start: "300"
banner-display: cover
banner-fade: "-100"
---

## Install Terraform

```shell
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```

## Clone telmate repo

```shell
git clone https://github.com/Telmate/terraform-provider-proxmox.git
```

```shell
sudo apt update && sudo apt upgrade -y && sudo apt install golang -y
```

```shell
sudo apt install make
```

```shell
cd terraform-provider-proxmox
make
```

```shell
mkdir -p ~/.terraform.d/plugins/registry.example.com/telmate/proxmox/1.0.0/linux_amd64
```