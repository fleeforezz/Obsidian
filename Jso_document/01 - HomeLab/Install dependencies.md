```
apt update && apt upgrade -y && apt install curl -y && apt install git -y && apt install docker.io -y && sudo curl -L "https://github.com/docker/compose/releases/download/1.29.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && sudo chmod +x /usr/local/bin/docker-compose && docker-compose -v
```