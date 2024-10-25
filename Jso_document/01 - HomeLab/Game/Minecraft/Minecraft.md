
> [!note] 
> Make sure you have [[Docker]] and [[Docker Compose]] installed

# Docker Compose (Recommend)

> Create docker volume for minecraft

```shell
docker volume create minecraftdata
```

> docker-compose.yml file

```yaml
version: "3"

services:
  minecraft:
    image: itzg/minecraft-server
    volumes:
      - minecraftdata:/data # change this
      - /home/nhat/Minecraft/plugins:/plugins # change this
    ports:
      - 25565:25565
    environment:
      EULA: "TRUE"
      TYPE: "BUKKIT"
      OPS: "ButterNPants"
    tty: true
    stdin_open: true
    restart: unless-stopped
```

## For Forge install version

```yaml
version: "3"

services:
  minecraft:
    image: itzg/minecraft-server:2024.6.1-java17
    volumes:
      - /home/nhat/Minecraft/data:/data # change this
      - /home/nhat/Minecraft/mods:/mods # change this
    ports:
      - 25565:25565
    environment:
      INIT_MEMORY: 14G # Initialize heap memory
      MAX_MEMORY: 15G # Max heap memory
      EULA: "TRUE"
      TYPE: "FORGE" # Server type
      VERSION: "1.20.1" # Minecraft version
      OPS: "ButterNPants" # Server Admins
    tty: true
    stdin_open: true
    restart: unless-stopped
```

## For Modpack + Forge install

```yaml
version: '3.8'

services:
  mc:
    image: itzg/minecraft-server:${IMAGE_TAG:-java8}
    volumes:
    - /home/nhat/Minecraft/modpacks:/modpacks:ro
    - data:/data
    environment:
	  INIT_MEMORY: 14G # Initialize heap memory
      MAX_MEMORY: 15G # Max heap memory
      EULA: "true"
      TYPE: CURSEFORGE
      CF_SERVER_MOD: /modpacks/SIMPLE-SERVER-FILES-0.3.20.zip
#      CF_SERVER_MOD: /modpacks/createlive3serverfiles+1.4.2.zip
#      CF_SERVER_MOD: /modpacks/Valhelsia+3-3.5.1-SERVER.zip
#      CF_SERVER_MOD: https://media.forgecdn.net/files/3012/800/SkyFactory-4_Server_4.2.2.zip
#      CF_SERVER_MOD: /modpacks/${MODPACK:-SkyFactory_4_Server_4.1.0.zip}
    ports:
      - "25565:25565"

volumes:
  data: {}
```

```yaml
services:
  mc:
    image: itzg/minecraft-server:2024.6.1-java17
    volumes:
    - /home/nhat/Minecraft/modpacks:/modpacks:ro
    - /home/nhat/Minecraft/data:/data
    environment:
      EULA: "true"
      TYPE: CURSEFORGE
      INIT_MEMORY: 27G # Initialize heap memory
      MAX_MEMORY: 29G # Max heap memory
      VERSION: "1.18.2" # Minecraft version
      FORGE_VERSION: 40.2.4
      CF_SERVER_MOD: https://mediafilez.forgecdn.net/files/5391/639/DeceasedCraft_Server_v5.5.4.zip
      tty: true
    stdin_open: true
    ports:
      - "25565:25565"
```

#### Read more
[[Custom config]]