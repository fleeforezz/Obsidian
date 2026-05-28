# Installation

## Docker-compose

```YAML
version: "3"

services:
  sonarqube:
    image: sonarqube:latest
    container_name: sonarqube
    dns:
      - 10.0.1.91
      - 1.1.1.1
    environment:
      SONAR_JDBC_URL: ${SONAR_JDBC_URL}
      SONAR_JDBC_USERNAME: ${SONAR_JDBC_USERNAME}
      SONAR_JDBC_PASSWORD: ${SONAR_JDBC_PASSWORD}
    volumes:
      - sonarqube_data:/opt/sonarqube/data
      - sonarqube_extensions:/opt/sonarqube/extensions
      - sonarqube_logs:/opt/sonarqube/logs
    ports:
      - "9000:9000"
    restart: unless-stopped
    healthcheck:
      test: ["CMD-SHELL", "curl -f http://localhost:9000/api/system/status | grep -q 'UP' || exit 1"]
      interval: 30s
      timeout: 10s
      retries: 5
      start_period: 120s

volumes:
  sonarqube_data:
  sonarqube_extensions:
  sonarqube_logs:
```

## Docker

```shell
docker pull sonarqube
```

```shell
docker run -d --name sonarqube-db -e POSTGRES_USER=sonar -e POSTGRES_PASSWORD=sonar -e POSTGRES_DB=sonarqube postgres:alpine
```

```shell
docker run -d --name sonarqube -p 9000:9000 --link sonarqube-db:db -e SONAR_JDBC_URL=jdbc:postgresql://db:5432/sonarqube -e SONAR_JDBC_USERNAME=sonar -e SONAR_JDBC_PASSWORD=sonar sonarqube
```

