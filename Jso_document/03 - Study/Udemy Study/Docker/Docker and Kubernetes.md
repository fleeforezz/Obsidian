# Basic docker CLI command

```shell
docker images   # To show docker images
docker ps   # To show active container
docker ps --all   # To show all container even if it's running or not
docker run <image name>   # To creating and Running a Container from an Image
docker create <image name>   # To create an docker image and execute an ID
docker start <container ID>   # To start a docker image without print out something
docker start -a <container ID>   # To start a docker image with the docker ID we have create earlier and -a will print out something
docker system prune   # To remove all docker container
docker logs <container ID>   # To see the container log without add the -a when using docker start
docker stop <container ID>   # To stop a container by sending a terminate signal to stop the container but we have to have a couple of sec 
docker kill <contianer ID>   # To kill a container ny sending a kill signal to stop right now and do not do any additional work
docker exec -it <container ID> <command>   # Execute an additional command in a container
docker exec -it <container ID> <bash | powershell | zsh | sh>   # To edit the file inside the docker container without type many docker exec command
	[ Command Processors : bash | powershell | zsh | sh ]
	[ To exit the command just press Ctrl + D  or type exit]
```

Shortcut command: 
+ -t : tag
+ -p : port
+ -it : 

# Secion 4
## Dockerfile

### For NodeJS app
We use nodejs base image from docker hub
[Docker Hub](https://hub.docker.com/explore)

```Dockerfile
# Specify a base image 
FROM node:14-alpine

# Create a Working directory
WORKDIR /usr/app

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



