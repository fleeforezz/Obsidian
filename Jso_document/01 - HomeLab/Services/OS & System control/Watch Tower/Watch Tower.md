# Install

> [!note]
> Make sure you have [[Docker]] and [[Docker Compose]]

```yaml
version: "3"
services:
watchtower:
image: containrrr/watchtower
volumes:
- /var/run/docker.sock:/var/run/docker.sock
```
