# Install Terraform

```shell
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```

# Clone telmate repo

```shell
git clone https://github.com/Telmate/terraform-provider-proxmox.git
```

```shell
sudo apt update && sudo apt upgrade -y && sudo apt install golang -y
```

```shell
sudo apt install make
```