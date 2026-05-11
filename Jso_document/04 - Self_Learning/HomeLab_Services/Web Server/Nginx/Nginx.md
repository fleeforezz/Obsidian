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

```shell
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

```shell
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

```shell
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

```shell
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

```shell
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

#### Advanced Load Balacning Features

```shell
upstream backend {
    least_conn;
    
    # max_fails: number of failed attempts before marking server as down
    # fail_timeout: time server is considered down
    # backup: only used when all primary servers are down
    # down: manually mark server as down
    # max_conns: limit concurrent connections to server
    
    server backend1.example.com weight=3 max_failes=3 fail_timeout=30s;
    server backend2.example.com weight=2 max_failes=3 fail_timeout=30s;
    server backend3.example.com weight=1 max_failes=3 fail_timeout=30s;
    server backend4.example.com backup; # Backup server
    
    # Connection and request limits
    keepalive 32; # Keep 32 idle connections to upstream servers
}

server {
    listen 80;
    server_name example.com;

    location / {
        proxy_pass http://backend;
        
        # Headers
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        
        # Timeouts
        proxy_connect_timeout 60s;
        proxy_send_timeout 60s;
        proxy_read_timeout 60s;
        
        # Buffering
        proxy_buffering on;
        proxy_buffer_size 4k;
        proxy_buffers 8 4k;
        proxy_busy_buffers_size 8k;
        
        # Connection settings
        proxy_http_version 1.1;
        proxy_set_header Connection "";
        
        # Error handing
        proxy_next_upstream error timeout invalid_header http_500 http_502 http_503 http_504;
        proxy_next_upstrea_tries 3;
    }
}
```

## Monitoring and Maintenace

+ Create a .sh file called monitoring-script.sh

```shell
#!/bin/bash

# NGINX Monitoring and Maintenance Script

echo "==================================="
echo "NGINX Monitoring and Maintenance"
echo "==================================="

# Function to check NGINX status
check_nginx_status() {
    echo ""
    echo "--- NGINX Status ---"
    sudo systemctl status nginx --no-pager | head -n 10
}

# Function to check configuration
check_config() {
    echo ""
    echo "--- Configuration Test ---"
    sudo nginx -t 2>&1
}

# Function to show active connections
show_connections() {
    echo ""
    echo "--- Active Connections ---"
    sudo netstat -tnpa | grep nginx | grep ESTABLISHED | wc -l
    echo "connections currently established"
}

# Function to show recent errors
show_errors() {
    echo ""
    echo "--- Recent Errors (Last 20 lines) ---"
    sudo tail -n 20 /var/log/nginx/error.log
}

# Function to show access log summary
show_access_summary() {
    echo ""
    echo "--- Access Log Summary (Last 100 requests) ---"
    sudo tail -n 100 /var/log/nginx/access.log | awk '{print $9}' | sort | uniq -c | sort -rn
}

# Function to show top IPs
show_top_ips() {
    echo ""
    echo "--- Top 10 Client IPs (Last 1000 requests) ---"
    sudo tail -n 1000 /var/log/nginx/access.log | awk '{print $1}' | sort | uniq -c | sort -rn | head -n 10
}

# Function to show server performance
show_performance() {
    echo ""
    echo "--- Server Performance ---"
    echo "Memory Usage:"
    ps aux | grep nginx | awk '{sum+=$6} END {print sum/1024 " MB"}'
    echo ""
    echo "CPU Usage:"
    ps aux | grep nginx | awk '{sum+=$3} END {print sum "%"}'
    echo ""
    echo "Worker Processes:"
    ps aux | grep "nginx: worker" | wc -l
}

# Function to reload NGINX
reload_nginx() {
    echo ""
    echo "--- Reloading NGINX ---"
    if sudo nginx -t 2>&1 | grep -q "successful"; then
        sudo systemctl reload nginx
        echo "NGINX reloaded successfully"
    else
        echo "Configuration test failed. Not reloading."
        sudo nginx -t
    fi
}

# Function to check SSL certificates
check_ssl() {
    echo ""
    echo "--- SSL Certificate Status ---"
    sudo certbot certificates 2>/dev/null || echo "Certbot not installed or no certificates found"
}

# Function to test SSL renewal
test_ssl_renewal() {
    echo ""
    echo "--- Testing SSL Certificate Renewal ---"
    sudo certbot renew --dry-run
}

# Function to show log rotation status
check_log_rotation() {
    echo ""
    echo "--- Log Files Size ---"
    du -sh /var/log/nginx/*
}

# Function to analyze slow requests
analyze_slow_requests() {
    echo ""
    echo "--- Requests Taking > 1 Second (Last 100) ---"
    sudo tail -n 100 /var/log/nginx/access.log | awk '$NF > 1.000 {print $0}' | head -n 10
}

# Function to check upstream health
check_upstream_health() {
    echo ""
    echo "--- Upstream Health Check ---"
    # This would need to be customized based on your upstream servers
    echo "This requires custom configuration per environment"
}

# Menu
while true; do
    echo ""
    echo "==================================="
    echo "Select an option:"
    echo "1.  Check NGINX Status"
    echo "2.  Test Configuration"
    echo "3.  Show Active Connections"
    echo "4.  Show Recent Errors"
    echo "5.  Show Access Summary"
    echo "6.  Show Top Client IPs"
    echo "7.  Show Performance Metrics"
    echo "8.  Reload NGINX"
    echo "9.  Check SSL Certificates"
    echo "10. Test SSL Renewal"
    echo "11. Check Log Files Size"
    echo "12. Analyze Slow Requests"
    echo "13. Full Report"
    echo "0.  Exit"
    echo "==================================="
    read -p "Enter choice: " choice
    
    case $choice in
        1) check_nginx_status ;;
        2) check_config ;;
        3) show_connections ;;
        4) show_errors ;;
        5) show_access_summary ;;
        6) show_top_ips ;;
        7) show_performance ;;
        8) reload_nginx ;;
        9) check_ssl ;;
        10) test_ssl_renewal ;;
        11) check_log_rotation ;;
        12) analyze_slow_requests ;;
        13) 
            check_nginx_status
            check_config
            show_connections
            show_performance
            show_access_summary
            show_top_ips
            check_ssl
            ;;
        14) 
            echo "Exiting..."
            exit 0
            ;;
        *) 
            echo "Invalid choice"
            ;;
    esac
done
```