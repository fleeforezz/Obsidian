---

---


> [!note]
> Make sure you have [[Docker]] and [[Docker Compose]]

# Docker Compose (Recommend)

```yaml
version: "3.0"
services:
  littlelink-server:
    image: ghcr.io/techno-tim/littlelink-server:latest
    # dockerhub is also supported timothystewart6/littlelink-server
    # image: timothystewart6/littlelink-server:latest
    container_name: littlelink-server
    environment:
      - META_TITLE=Fleeforezz
      - META_DESCRIPTION=Software Engineer | Gamer | Twitch Streamer | Content Creator on YouTube | Homelab | 🇺🇸 🇯🇵  | Full Nerd
      - META_AUTHOR=Fleeforezz
      - META_KEYWORDS=HomeLab, HTML, CSS, Engineering
      - LANG=en
      - META_INDEX_STATUS=all
      - OG_SITE_NAME=Fleeforezz
      - OG_TITLE=Fleeforezz
      - OG_DESCRIPTION=The home of Fleeforezz
      - OG_URL=https://192.168.1.31
      - OG_IMAGE=https://static-cdn.jtvnw.net/jtv_user_pictures/b0c7fcdc-83fd-4dab-afb2-07489334ea24-profile_image-300x300.png
      - OG_IMAGE_WIDTH=400
      - OG_IMAGE_HEIGHT=400
      - GA_TRACKING_ID=G-XXXXXXXXXX
      - THEME=Dark
      - FAVICON_URL=https://static-cdn.jtvnw.net/jtv_user_pictures/b0c7fcdc-83fd-4dab-afb2-07489334ea24-profile_image-300x300.png
      - AVATAR_URL=https://static-cdn.jtvnw.net/jtv_user_pictures/b0c7fcdc-83fd-4dab-afb2-07489334ea24-profile_image-300x300.png
      - AVATAR_2X_URL=https://static-cdn.jtvnw.net/jtv_user_pictures/b0c7fcdc-83fd-4dab-afb2-07489334ea24-profile_image-300x300.png
      - AVATAR_ALT=Fleeforezz Profile Pic
      - NAME=Fleeforezz
      - BIO=Software Engineer | Gamer | Twitch Streamer | Content Creator on YouTube | Homelab | 🇺🇸 🇯🇵 | Full Nerd
      # use ENV variable names for order, listed buttons will be boosted to the top
      - BUTTON_ORDER=YOUTUBE,TWITCH,TWITTER,GITHUB,INSTAGRAM,LINKED_IN,DISCORD,FACEBOOK,TIKTOK,PATREON,GEAR,DOCUMENTATION
      # you can render an unlimited amount of custom buttons by adding 
      # the CUSTOM_BUTTON_* variables and by using a comma as a separator.
      #- CUSTOM_BUTTON_TEXT=Documentation,Recommended Gear
      #- CUSTOM_BUTTON_URL=https://l.technotim.live/docs,https://l.technotim.live/gear
      #- CUSTOM_BUTTON_COLOR=#000000,#000000
      #- CUSTOM_BUTTON_TEXT_COLOR=#ffffff,#ffffff
      #- CUSTOM_BUTTON_ALT_TEXT=Tech documentation site for my videos and more,Recommended Gear
      #- CUSTOM_BUTTON_NAME=DOCUMENTATION,GEAR
      #- CUSTOM_BUTTON_ICON=fas file-alt,fas fa-cog
      - GITHUB=https://l.technotim.live/github
      - TWITTER=https://l.technotim.live/twitter
      - INSTAGRAM=https://l.technotim.live/instagram
      - LINKED_IN=https://l.technotim.live/linkedin
      - YOUTUBE=https://l.technotim.live/subscribe
      - TWITCH=https://l.technotim.live/twitch
      - DISCORD=https://l.technotim.live/discord
      - TIKTOK=https://l.technotim.live/tiktok
      - FACEBOOK=https://l.technotim.live/facebook
      - PATREON=https://l.technotim.live/patreon
      - FOOTER=Hi
    ports:
      - 8080:3000
    restart: unless-stopped
    security_opt:
      - no-new-privileges:true
```

> Recreate docker image

```shell
docker-compose up -d —force-recreate
```
