```YAML
version: "2"
services:
    ytdl_material:
        environment: 
            ytdl_mongodb_connection_string: 'mongodb://ytdl-mongo-db:27017'
            ytdl_use_local_db: 'false'
            write_ytdl_config: 'true'

        restart: always
        depends_on:
            - ytdl-mongo-db
        volumes:
            - /NFSStorage/Youtube-DL/data:/app/appdata
            - /NFSStorage//Navidrome/music:/app/audio
            - /NFSStorage/Youtube-DL/video:/app/video
            - /NFSStorage/Youtube-DL/subscription:/app/subscriptions
            - /NFSStorage/Youtube-DL/users:/app/users
        ports:
            - "8998:17442"
        image: tzahi12345/youtubedl-material:latest
    ytdl-mongo-db:
        # If you are using a Raspberry Pi, use mongo:4.4.18
        image: mongo:4
        logging:
            driver: "none"          
        container_name: mongo-db
        restart: always
        volumes:
            - ./db/:/data/db
```
