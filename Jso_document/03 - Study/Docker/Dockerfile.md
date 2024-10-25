## For NodeJS app
We use nodejs base image from docker hub
[Docker Hub](https://hub.docker.com/explore)

```Dockerfile
# Specify a base image 
FROM node:14-alpine

# Install some dependencies
COPY ./ ./
RUN npm install

# Default command
CMD ["npm", "start"]
```

+ We use node:14-alpine base image from docker hub (alpine version of node image is small and less compact version of the original version this mean u not gonna have a bunch of addition program)

[[Copy local file to container]]

After modified the Dockerfile run these code below to build and run nodeJS app

### Build image with tag

```shell
docker build -t testify/simpleweb:latest .
```

### Run app

```shell
docker run -p 8080:8080 testify/simpleweb:latest
```

[[Docker port mapping]]
