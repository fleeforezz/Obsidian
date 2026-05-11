
# Bookmarks

```yaml
- More about HomePage:
    - HomePage:
        - icon: homepage.png
          href: https://gethomepage.dev/en/installation/

- Service Icon:
    - walkxcode:
        - icon: https://camo.githubusercontent.com/a56a63dd9bc5d295092cb3c853296a96e95031660de216c4961af62eb80802ac/687>
          href: https://cdn.jsdelivr.net/gh/walkxcode/dashboard-icons/png/

- Weather API:
    - Weather API:
        - icon: https://cdn.weatherapi.com/v4/images/weatherapi_logo.png
          href: https://www.weatherapi.com/my/
```

# Services

```yaml
- Networking:
    - Pi-Hole:
        icon: pi-hole.png
        href: http://epsilon.local.home.live/admin/
        ping: http://192.168.1.29/admin/
        description: pi-hole-prod
    - Pi-Hole:
        icon: pi-hole.png
        href: http://192.168.1.37/admin/
        ping: http://192.168.1.37/
        description: pi-hole-backup
    - Nginx Proxy Manager:
        icon: nginx-proxy-manager
        href: https://nginxproxymanager.fleeforezz.me/
        ping: https://nginxproxymanager.fleeforezz.me/
        description: proxymanager-prod-1
    - Speedtest Tracker:
        icon: speedtest-tracker-old.png
        href: https://speedtest.fleeforezz.me/
        ping: https://speedtest.fleeforezz.me/
        description: speedtest-prod-1

- Infrastructure and Data:
    - Proxmox:
        icon: proxmox.png
        href: https://proxmox.fleeforezz.me/
        ping: https://proxmox.fleeforezz.me/
        description: prx-prod-1
    - TrueNas Scale:
        icon: truenas-scale.png
        href: https://truenas.fleeforezz.me/
        ping: https://truenas.fleeforezz.me/
        description: nas-prod-1
    - TrueNas Scale:
        icon: truenas-scale.png
        href: https://beta.fleeforezz.me/
        ping: https://beta.fleeforezz.me/
        description: nas-prod-backup
    - Cockpit:
        icon: cockpit.png
        href: https://gamma.fleeforezz.me/
        ping: https://gamma.fleeforezz.me/
        description: cockpit-prod-1 on gamma-prod-srv
    - NextCloud:
        icon: nextcloud.png
        href: https://nextcloud.fleeforezz.me/
        ping: https://nextcloud.fleeforezz.me/
        description: nextcloud-prod-1

- Management:
    - Portainer:
        icon: portainer.png
        href: https://portainer.fleeforezz.me/
        ping: https://portainer.fleeforezz.me/
        description: portainer-prod-1 on prx-prod-1
    - Gitlab:
        icon: gitlab.png
        href: https://gitlab.fleeforezz.me/
        ping: https://gitlab.fleeforezz.me/
        description: gitlab-prod-1

- Monitoring:
    - UptimeKuma:
        icon: uptime-kuma.png
        href: https://uptimekuma.fleeforezz.me/
        ping: https://uptimekuma.fleeforezz.me/
        description: uptimekuma-prod-1
    - Grafana:
        icon: grafana.png
        href: https://grafana.fleeforezz.me/
        ping: https://grafana.fleeforezz.me/
        description: grafana-prod-1
    - Prometheus:
        icon: prometheus.png
        href: https://prometheus.fleeforezz.me/
        ping: https://prometheus.fleeforezz.me/
        description: prometheus-prod-1
    - InfluxDB:
        icon: influxdb.png
        href: https://influxdb.fleeforezz.me/
        ping: https://influxdb.fleeforezz.me/
        description: influxDB-prod-1

- Media:
    - Jellyfin:
        icon: jellyfin.png
        href: https://jellyfin.fleeforezz.me/
        ping: https://jellyfin.fleeforezz.me/
        description: jellyfin-prod-1
    - Navidrome:
        icon: navidrome.png
        href: https://navidrome.fleeforezz.me/
        ping: https://navidrome.fleeforezz.me/
        description: navidrome-prod-1
    - Feishin:
        icon: navidrome.png
        href: https://feishin.fleeforezz.me/
        ping: https://feishin.fleeforezz.me/
        description: feishin-prod-1
    - Youtube-DL:
        icon: youtubedl.png
        href: https://youtubedl.fleeforezz.me/
        ping: https://youtubedl.fleeforezz.me/
        description: youtube-prod-1

- IoT and Smarthome:
    - Home Assistant:
        icon: home-assistant.png
        href: https://homeassistant.fleeforezz.me/
        ping: https://homeassistant.fleeforezz.me/
        description: homeassistant-prod-1

- Security and Identity:
    - Bitwarden:
        icon: bitwarden.png
        href: https://bitwarden.fleeforezz.me/
        ping: https://bitwarden.fleeforezz.me/
        description: bitwarden-prod-1
    - Frigate:
        icon: frigate.png
        href: https://frigate.fleeforezz.me/
        ping: https://frigate.fleeforezz.me/
        description: frigate-prod-1

- Self Project:
    - Nhat Truong Protfolio:
        icon: nginx.png
        href: https://fleeforezz.me/
        ping: https://fleeforezz.me/
        description: portfolio-prod-1
    - Nhat Truong Blog:
        icon: nginx.png
        href: https://jso.fleeforezz.me/
        ping: https://jso.fleeforezz.me/
        description: blog-prod-1
    - Kiddicute:
        icon: nginx.png
        href: https://kiddicute.fleeforezz.me/
        ping: https://kiddicute.fleeforezz.me/
        description: kiddicute-prod-1
```
# Settings

```yaml
providers:
  openweathermap: openweathermapapikey
  weatherapi: weatherapiapikey

background:
  image: https://r4.wallpaperflare.com/wallpaper/85/732/46/background-blur-blurred-colors-wallpaper-72e1e2b0bdd62e4b7a286255600869a2.jpg 
  blur: md

cardBlur: sm

backgroundOpacity: 1

favicon: https://cdn-icons-png.flaticon.com/512/1808/1808512.png # milky way icon
#favicon: https://cdn-icons-png.flaticon.com/512/8357/8357877.png # cute milky way icon

title: HomeLab

headerStyle: boxed

layout:
  Servers:
    style: columm
    columns: 2
```
# Widgets

```yaml
- logo:
    #icon: https://cdn-icons-png.flaticon.com/512/5702/5702000.png # server icon
    icon: https://cdn-icons-png.flaticon.com/512/1808/1808512.png # milky way icon

- greeting:
    text_size: 4xl
    text: HomeLab

- resources:
    cpu: true
    memory: true
    disk: /

#- search:
    #provider: google # google, duckduckgo, bing, baidu or custom
    #focus: false # Optional, will set focus to the search bar on page load
    #target: _blank # One of _self, _blank, _parent or _top

- datetime:
    text_size: 3xl
    format:
      timeStyle: short
      hour12: false

- weatherapi:
    label: HoChiMinh # optional
    latitude: 10.762622
    longitude: 106.660172
    units: metric # or imperial
    apiKey: 02c91d0050d747b780c65416230101
    cache: 5 # Time in minutes to cache API responses, to stay within limits
```
# Wallpapers

![wallpaper1](https://c4.wallpaperflare.com/wallpaper/248/693/81/gradient-colorful-abstract-simple-wallpaper-preview.jpg)

![wallpaper2](https://c4.wallpaperflare.com/wallpaper/313/548/35/digital-art-abstract-minimalism-simple-wallpaper-preview.jpg)

![wallpaper3](https://images.unsplash.com/photo-1483728642387-6c3bdd6c93e5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=c%3E)

![wallpaper4](https://c4.wallpaperflare.com/wallpaper/256/642/389/simple-minimalism-gradient-wallpaper-preview.jpg)

![wallpaper5](https://wallpaperaccess.com/full/8089778.png)

![wallpaper6](https://wallpaperaccess.com/full/5648030.jpg)

![wallpaper7](https://wallpaperaccess.com/full/3492868.gif)

![wallpaper8](https://images.unsplash.com/photo-1509023464722-18d996393ca8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80)

