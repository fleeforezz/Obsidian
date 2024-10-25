---
banner: "https://www.librechat.ai/_next/image?url=%2Fimages%2Fblog%2F2024-03-02_ollama.png&w=3840&q=75"
banner_y: 0.808
---
# Install directly on linux server

```shell
curl -fsSL https://ollama.com/install.sh | sh
```

# For CPU Support

```shell
docker run -d -p 3000:8080 -v ollama:/root/.ollama -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:ollama
```

# For GPU Support

```shell
docker run -d -p 3000:8080 --gpus=all -v ollama:/root/.ollama -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:ollama
```

