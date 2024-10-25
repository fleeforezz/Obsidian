```YAML
version: "3"
services:
  navidrome:
    image: deluan/navidrome:latest
    user: 1000:1001 # should be owner of volumes
    ports:
      - "4533:4533"
    restart: unless-stopped
    environment:
      # Optional: put your config options customization here. Examples:
      ND_LOGLEVEL: info  
      ND_SESSIONTIMEOUT: 24h
      ND_BASEURL: ""
      ND_SCANSCHEDULE: "@every 1m"
      ND_DEFAULTTHEME: Spotify-ish
      ND_ENABLEGRAVATAR: true
      ND_ENABLESHARING: true
      ND_ENABLEUSEREDITING: true
    volumes:
      - "/NFSStorage/Navidrome/data:/data"
      - "/NFSStorage/Navidrome/music:/music:ro"
```
