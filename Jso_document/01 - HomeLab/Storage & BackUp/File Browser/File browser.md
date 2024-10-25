> [!note]
> Make sure you install [[Docker]] and [[Docker Compose]]

```yaml
version: "3"

services:
  filebrowser:
    image: filebrowser/filebrowser
    user: "${UID}:${GID}" #User id
    ports:
      - 8081:80
    volumes:
      - /:/srv #directory
      - /home/proton/filebrowser/filebrowser.db:/database.db #database store
    restart: always
```

