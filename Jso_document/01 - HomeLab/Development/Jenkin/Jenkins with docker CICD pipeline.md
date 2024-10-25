> [!note]
> Make sure that [[Docker]] has already installed on jenkins server

# Install Docker plugins 

> Go to <mark style="background: #ADCCFFA6;">Manage Jenkins</mark>

![[Pasted image 20240601114754.png]]

> Click Plugins

![[Pasted image 20240601114954.png]]

> Install these plugins

![[Pasted image 20240601115032.png]]

# Install Publish Over SSH

![[Pasted image 20240601171457.png]]

# Install SSH agent plugin

![[Pasted image 20240601171522.png]]
# Config permissions for Docker registry

> You need to add jenkins user to docker group on your jenkins server

> In your server terminal paste this command then reboot the server

```shell
sudo usermod -aG docker jenkins
```