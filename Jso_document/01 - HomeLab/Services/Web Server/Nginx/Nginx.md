## What is NGINX ?

NGINX is a high-performance web server, reverse proxy, and load balancer. It's known for:

- **High concurrency** - handles thousands of connections with low memory footprint
- **Event-driven architecture** - uses asynchronous processing
- **Versatility** - works as web server, reverse proxy, load balancer, HTTP cache, and mail proxy

## How NGINX is used in Production ?

#### 1. Web Server
Serves static content (HTML, CSS, JS, images) directly to users.

#### 2. Reverse Proxy
Sits in front of application servers (Node.js, Python, Java) and forwards requests to them.

#### 3. Load Balancer
Distributes traffic across multiple backend servers for high availability and scalability.

#### 4. SSL/TLS Termination
Handles HTTPS encryption/decryption, reducing load on backend servers.

#### 5. API Gateway
Routes API requests to different microservices.

#### 6. Caching Layer
Caches responses to reduce backend load and improve response times.

## Install NGINX

```shell
sudo apt update
```

```shell
sudo apt install nginx -y
```

+ Disable nginx default welcome page 

```shell
sudo unlink /etc/nginx/sites-enabled/default

sudo nginx -t
sudo systemctl reload nginx
```


## Load Balancing Methods in NGINX

NGINX support serverals load balancing algorithms:

#### 1. Round Robin (Default)

Distributes requests evenly across servers in sequential order.

```conf
upstream backend {
    server backend1.example.com;
    server backend2.example.com;
    server backend3.example.com;
}

server {
    listen 80;
    server_name example.com;

    location / {
        proxy_pass http://backend;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

#### 2. Least Connections

Routes to the server with the fewest active connections.

```conf
upstream backend {
    least_conn;  # Use least connections algorithm
    server backend1.example.com;
    server backend2.example.com;
    server backend3.example.com;
}

server {
    listen 80;
    server_name example.com;

    location / {
        proxy_pass http://backend;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

#### 3. Ip Hash

Routes requests from the same client IP to the same server (session persistence).

```conf
upstream backend {
    ip_hash;  # Use least connections algorithm
    server backend1.example.com;
    server backend2.example.com;
    server backend3.example.com;
}

server {
    listen 80;
    server_name example.com;

    location / {
        proxy_pass http://backend;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

#### 4. Weighted Load Balancing

Assigns different weights to servers based on their capacity.

```conf
upstream backend {
    # Server with weight=3 receive 3x more requests than weight=1
    server backend1.example.com weight=3;
    server backend2.example.com weight=2;
    server backend3.example.com weight=1;
}

server {
    listen 80;
    server_name example.com;

    location / {
        proxy_pass http://backend;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```


#### 5. Generic Hash

Routes based on a custome key (like URL, cookie, or header).

```conf
upstream backend {
    # Hash based on request URI for cache optimization
    hash $request_uri consistent;
    server backend1.example.com;
    server backend2.example.com;
    server backend3.example.com;
}

# Alternative: Hash based on custom header
upstream api_backend {
    hash $http_x_user_id consistent;
    server api1.example.com;
    server api2.example.com;
}

server {
    listen 80;
    server_name example.com;

    location / {
        proxy_pass http://backend;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
    
    location /api/ {
        proxy_pass http://api_backend;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
```

### Simple round robin load balancer

+ Create a loadbalancer.yml file in /etc/nginx/conf.d

```yaml

```