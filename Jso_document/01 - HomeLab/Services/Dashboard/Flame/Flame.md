---
banner: https://medevel.com/content/images/size/w960/2023/12/themes.png
content-start: "300"
banner-display: cover
banner-fade: "-100"
---

## Install

> [!note]
> Make sure you have [[Docker]] and [[Docker Compose]] installed

```YAML
version: '3.6'

services:
  flame:
    image: pawelmalak/flame
    container_name: flame
    volumes:
      - /home/nhat/Flame/data:/app/data
      - /var/run/docker.sock:/var/run/docker.sock # optional but required for Docker integration
    ports:
      - 5005:5005
    secrets:
      - password # optional but required for (1)
    environment:
      - PASSWORD=flame_password
      - PASSWORD_FILE=/run/secrets/password # optional but required for (1)
    restart: unless-stopped

# optional but required for Docker secrets (1)
secrets:
  password:
    file: /home/nhat/Flame/secrets/password
```

> [!note]
> Create `password` file inside /home/user/Flame/secrets

#### Custom CSS
[[01 - HomeLab/Services/Dashboard/Flame/Custom CSS|Custom CSS]]

