> [!note]
> Make sure you have [[Homarr]] setup

```yaml
version: '3.5'

services:
  dash:
    image: mauricenino/dashdot:latest
    restart: unless-stopped
    privileged: true
    ports:
      - '1000:3001'
    volumes:
      - /:/mnt/host:ro
```