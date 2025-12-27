
> [!note]
Make sure you have [[Docker]] and [[Docker Compose]]

# File Structure

```shell
./traefik
├── config
│   ├── acme.json
│   ├── config.yml
│   └── traefik.yml
└── cf_api_token.txt
└── docker-compose.yml
```
# Prepare our server

```shell
mkdir traefik
cd traefik
```

```shell
touch docker-compose.yaml
nano docker-compose.yaml
```

# Tasks from Our Compose File

`docker-compose.yaml`

```YAML
secrets:
  cf-token:
    file: ./cf-token
services:
  traefik:
    image: traefik:latest # or traefik:v3.3 to pin a version
    container_name: traefik
    restart: unless-stopped
    security_opt:
      - no-new-privileges:true # helps to increase security
    secrets:
      - cf-token # the secret at the top of this file
    env_file:
      - .env # store other secrets e.g., dashboard password
    networks:
       - proxy
    ports:
      - 80:80
      - 443:443
     # - 10000:10000 # optional
     # - 33073:33073 # optional
    environment:
      - TRAEFIK_DASHBOARD_CREDENTIALS=${TRAEFIK_DASHBOARD_CREDENTIALS}
      - CF_API_EMAIL=fleeforezz@gmail.com # Cloudflare email
      # - CF_DNS_API_TOKEN=YOUR-TOKEN # Cloudflare API Token
      - CF_DNS_API_TOKEN_FILE=/run/secrets/cf-token # see https://doc.traefik.io/traefik/https/acme/#providers
      # token file is the proper way to do it
    volumes:
      - /etc/localtime:/etc/localtime:ro
      - /var/run/docker.sock:/var/run/docker.sock:ro
      - /home/jso/Traefikv3/config/traefik.yaml:/traefik.yaml:ro
      - /home/jso/Traefikv3/config/acme.json:/acme.json
      - /home/jso/Traefikv3/config/config.yaml:/config.yaml:ro
      - /home/jso/Traefikv3/config/logs:/var/log/traefik
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.traefik.entrypoints=http"
      - "traefik.http.routers.traefik.rule=Host(`traefik.hikarimoon.pro`)"
      - "traefik.http.middlewares.traefik-auth.basicauth.users=${TRAEFIK_DASHBOARD_CREDENTIALS}"
      - "traefik.http.middlewares.traefik-https-redirect.redirectscheme.scheme=https"
      - "traefik.http.middlewares.sslheader.headers.customrequestheaders.X-Forwarded-Proto=https"
      - "traefik.http.routers.traefik.middlewares=traefik-https-redirect"
      - "traefik.http.routers.traefik-secure.entrypoints=https"
      - "traefik.http.routers.traefik-secure.rule=Host(`traefik.hikarimoon.pro`)"
      - "traefik.http.routers.traefik-secure.middlewares=traefik-auth"
      - "traefik.http.routers.traefik-secure.tls=true"
      - "traefik.http.routers.traefik-secure.tls.certresolver=cloudflare"
      - "traefik.http.routers.traefik-secure.tls.domains[0].main=hikarimoon.pro"
      - "traefik.http.routers.traefik-secure.tls.domains[0].sans=*.hikarimoon.pro"
      - "traefik.http.routers.traefik-secure.service=api@internal"

networks:
  proxy:
    external: true # or comment this line to auto create the network

```

### Config folder

```shell
mkdir data
cd data
touch acme.json
chmod 600 acme.json
```

#### traefik.yaml

```shell
touch traefik.yml
nano traefik.yml
```

```yaml
api:
  dashboard: true
  debug: true
entryPoints:
  http:
    address: ":80"
    http:
      redirections:
        entryPoint:
          to: https
          scheme: https
  https:
    address: ":443"
serversTransport:
  insecureSkipVerify: true
providers:
  docker:
    endpoint: "unix:///var/run/docker.sock"
    exposedByDefault: false
  # file:
  #   filename: /config.yml
certificatesResolvers:
  cloudflare:
    acme:
      email: youremail@email.com
      storage: acme.json
      # caServer: https://acme-v02.api.letsencrypt.org/directory # prod (default)
      caServer: https://acme-staging-v02.api.letsencrypt.org/directory # staging
      dnsChallenge:
        provider: cloudflare
        #disablePropagationCheck: true # uncomment this if you have issues pulling certificates through cloudflare, By setting this flag to true disables the need to wait for the propagation of the TXT record to all authoritative name servers.
        #delayBeforeCheck: 60s # uncomment along with disablePropagationCheck if needed to ensure the TXT record is ready before verification is attempted 
        resolvers:
          - "1.1.1.1:53"
          - "1.0.0.1:53"
```

#### config.yaml

```shell
touch config.yaml
nano config.yaml
```

```YAML
http:
  ###############
  # MIDDLEWARES #
  ###############
  middlewares:
  # Default Security Header  
    default-security-headers:
      headers:
        browserXssFilter: true                            # X-XSS-Protection=1; mode=block
        contentTypeNosniff: true                          # X-Content-Type-Options=nosniff
        forceSTSHeader: true                              # Add the Strict-Transport-Security header
        referrerPolicy: "strict-origin-when-cross-origin"
        stsIncludeSubdomains: true                        # Add includeSubdomains to the Strict-Transport-Security header
        stsPreload: true                                  # Add preload flag
        stsSeconds: 31536000                              # Set max-age (1 year)
        customRequestHeaders:
          X-Forwarded-Proto: https

  # Https Redirectscheme  
    https-redirectscheme:
      redirectScheme:
        scheme: https
        permanent: true
    
  # Proxmox header
    proxmox-headers:
        headers:
          customRequestHeaders:
            X-Forwarded-Proto: https
          customResponseHeaders:
            X-Frame-Options: SAMEORIGIN

  # Homepage Security Header  
    # homepage-security-headers:
    #   headers:
    #     browserXssFilter: true
    #     contentTypeNosniff: true
    #     forceSTSHeader: true
    #     referrerPolicy: "strict-origin-when-cross-origin"
    #     stsIncludeSubdomains: true
    #     stsPreload: true
    #     stsSeconds: 31536000
    #     # More permissive CSP for homepage
    #     contentSecurityPolicy: "default-src 'self'; script-src 'self' 'unsafe-inline' 'unsafe-eval'; style-src 'self' 'unsafe-inline'; img-src 'self' data: https:; font-src 'self' data:; connect-src 'self' wss: https:;"
    #     customRequestHeaders:
    #       X-Forwarded-Proto: https
    

  ###########
  # ROUTERS #
  ###########
  routers:
  #---- Homepage Router ----#
    # HTTP to HTTPS redirect (Hompage)
    homepage-http:
      entryPoints:
        - "http"
      rule: "Host(`homepage.hikarimoon.pro`)"
      middlewares:
        - https-redirectscheme
      service: homepage
    # HTTPS router (Homepage)
    homepage:
      entryPoints:
        - "https"
      rule: "Host(`homepage.hikarimoon.pro`)"
      middlewares:
        - default-security-headers
      tls:
        certResolver: cloudflare  # Add this!
      service: homepage

  #---- Portainer Router ----#
    # HTTP to HTTPS redirect (Portainer)
    portainer-http:
      entryPoints: 
        - "http"
      rule: "Host(`dev-portainer.hikarimoon.pro`)"
      middlewares:
        - https-redirectscheme
      service: portainer
    # HTTPS router (Portainer)
    portainer:
      entryPoints:
        - "https"
      rule: "Host(`dev-portainer.hikarimoon.pro`)"
      middlewares:
        - default-security-headers
      tls:
        certResolver: cloudflare
      service: portainer
    
  #---- Gitlab Router ----#
    # HTTP to HTTPS redirect
    gitlab-http:
      entryPoints: 
        - "http"
      rule: "Host(`gitlab.hikarimoon.pro`)"
      middlewares:
        - https-redirectscheme
      service: portainer
    # HTTPS router
    gitlab:
      entryPoints:
        - "https"
      rule: "Host(`gitlab.hikarimoon.pro`)"
      middlewares:
        - default-security-headers
      tls:
        certResolver: cloudflare
      service: gitlab

  ############
  # SERVICES #
  ############
  services:
  #---- Homepage Service ----#
    homepage:
      loadBalancer:
        servers:
          - url: "http://10.0.1.60:3000"
        passHostHeader: true
        serversTransport: insecureTransport

  #---- Portainer Service ----#
    portainer:
      loadBalancer:
        servers:
          - url: "https://10.0.1.80:9443"
        passHostHeader: true
        serversTransport: insecureTransport

  #---- Gitlab Service ----#
    gitlab:
      loadBalancer:
        servers:
          - url: "https://10.0.1.51:443"
        passHostHeader: true
        serversTransport: insecureTransport

  ######################
  # SERVERS TRANSPORTS #
  ######################
  serversTransports:
    insecureTransport:
      insecureSkipVerify: true  # Since homepage uses self-signed cert internally
```
### Cloudflare API Token Secret

```shell
cd ..
touch cftoken.txt
nano cftoken.txt
```

### Create Docker Network

```shell
docker network create proxy
```

Paste your token into file from Cloudflare

### Traefik Dashboard Password and .env

> [!note]
> Make sure you have [[Htpasswd]] installed

```shell
touch .env
nano .env
```

Paste your credential pair

E.g.

```shell
TRAEFIK_DASHBOARD_CREDENTIALS=user:$$2y$$05$$lSaEi.G.aIygyXRdiFpt7OqmUMW9QUG5I1N.j0bXoXxIjxQmoGOWu
```

## Start the stack

```shell
docker-compose up -d --force-recreate
```

# Troubleshooting

Common ways to troubleshoot

```shell
docker ps
docker logs traefik
docker exec -it traefik /bin/sh
```

Inside the container

```shell
top
ls
cat acme.json
cat traefik.yml
ls /run/secrets
cat /run/secrets/cf_api_token
echo ${CF_DNS_API_TOKEN_FILE}
echo ${TRAEFIK_DASHBOARD_CREDENTIALS}
```

## DNS

```shell
nslookup traefik-dashboard.local.example.com
```

## Switch to Production Acme Endpoings

```YAML
...
      caServer: https://acme-v02.api.letsencrypt.org/directory # prod (default)
      #caServer: https://acme-staging-v02.api.letsencrypt.org/directory # staging
...
```

Clear out the existing staging certificates

```shell
cd data
nano acme.json
```

Clear and save
Restart the stack

```shell
docker-compose up -d --force-recreate
```



