# Install

> [!note]
> Make sure you have [[Docker]] and [[Docker Compose]]\

# Docker 

```shell
docker run -d -p 0.0.0.0:8080:8080 -v ~/trilium-data:/home/node/trilium-data zadam/trilium:[VERSION]
```

# Docker Compose (Recommend)

```yaml
version: '2.1'
services:
  trilium:
    image: zadam/trilium
    restart: always
    environment:
      - TRILIUM_DATA_DIR=/home/node/trilium-data
    ports:
      - "8080:8080"
    volumes:
      - trilium:/home/node/trilium-data

volumes:
  trilium:
```

