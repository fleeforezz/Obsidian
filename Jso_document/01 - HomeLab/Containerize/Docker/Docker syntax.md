---
banner: "https://www.docker.com/wp-content/uploads/2022/12/Docker-Temporary-Image-Social-Thumbnail-1200x630-1.png"
---
---
banner: "https://www.docker.com/wp-content/uploads/2022/12/Docker-Temporary-Image-Social-Thumbnail-1200x630-1.png"
---
---
banner: "https://www.docker.com/wp-content/uploads/2022/12/Docker-Temporary-Image-Social-Thumbnail-1200x630-1.png"
banner_y: 0.888
---

# Docker syntax
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

# Create a Dockerfile

For NodeJS we use node base image from docker hub

```Dockerfile
# Specific a base image
FROM alpine

# Install some dependencies
RUN npm install

# Dedault command
CMD ["npm", "install"]
```
