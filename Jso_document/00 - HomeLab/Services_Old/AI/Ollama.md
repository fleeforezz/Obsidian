---
banner: https://assets.st-note.com/production/uploads/images/150640182/rectangle_large_type_2_1e85397b83c94eff1ce77b64a965359c.png?width=1200
content-start: "300"
banner-display: cover
banner-fade: "-100"
---

## Install directly on linux server

```shell
curl -fsSL https://ollama.com/install.sh | sh
```

## For CPU Support

```shell
docker run -d -p 3000:8080 -v ollama:/root/.ollama -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:ollama
```

## For GPU Support

```shell
docker run -d -p 3000:8080 --gpus=all -v ollama:/root/.ollama -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:ollama
```

