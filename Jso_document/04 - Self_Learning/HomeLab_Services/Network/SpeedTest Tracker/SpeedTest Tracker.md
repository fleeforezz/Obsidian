```YAML
---
services:
  speedtest-tracker:
    image: lscr.io/linuxserver/speedtest-tracker:latest
    container_name: speedtest-tracker
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Asia/Ho_Chi_Minh
      - APP_KEY=base64:KPMIT5ZECnBSbtL5FiUCj0T9koA7tz/hSof5ctBpx6g=
      - DB_CONNECTION=sqlite
      - SPEEDTEST_SCHEDULE=
      - SPEEDTEST_SERVERS=
      - DB_HOST= #optional
      - DB_PORT= #optional
      - DB_DATABASE= #optional
      - DB_USERNAME= #optional
      - DB_PASSWORD= #optional
      - DISPLAY_TIMEZONE=Asia/Ho_Chi_Minh #optional
      - PRUNE_RESULTS_OLDER_THAN=0 #optional
    volumes:
      - /App/Speedtest-tracker/data:/config
    ports:
      - 8080:80
    restart: unless-stopped
```

+ Default `username` and `password`
	+ username: admin@example.com
	+ password: password