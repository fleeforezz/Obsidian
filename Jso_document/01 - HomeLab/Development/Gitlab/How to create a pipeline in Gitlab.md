
> Requirements for this project:
+ [NodeJS](https://nodejs.org/en) installed to create NextJS app
+ [Github desktop](https://desktop.github.com/) installed to push code to [[GitLab]]

## Create NextJS App

> In terminal, type:

```shell
npm create next-app
```

> After complete setup, type: 

```shell
npm install
```

> Run app in development mode:

```shell
npm run dev
```

> We will head over to our browser and type NextJS default URL `http://localhost:3000`

![[Pasted image 20240221082009.png]]

## Create Dockerfile, docker-compose.yml and .gitlab-ci.yml to setup a CI pipeline
### Create Dockerfile file

```dockerfile
FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
# RUN npm run build
EXPOSE 9463
ENV PORT 9463
ENV HOSTNAME "0.0.0.0"
# Start the app
CMD ["npm", "run", "dev"]
```

> What are we doing ?
+ `FROM node:18-alpine` : 
+ `WORKDIR /app` :
+ `COPY package*.json ./` :
+ `RUN npn install` :
+ `COPY . .` :
+ `EXPOSE 9463` :
+ `ENV HOSTNAME "0.0.0.0"` :
+ `CMD ["npm", "run", "dev"]` :

### Create docker-compose.yml file

```yaml
version: '3.5'
services:
  app:
    build:
      context: .
      dockerfile: Dockerfile
    container_name: portfolio_2.0
    ports:
      - '9463:9463'
    volumes:
      - .:/app
      - /app/node_modules
    restart: unless-stopped
```

### Create .gitlab-ci.yml file

```yaml
stages:
  - build
  # - test
  - docker-build
  - deploy
build:
  stage: build
  image: node
  script: 
    - echo "Start building App"
    - npm install
    - npm run build
    - echo "Build successfully!"
# test:
#   stage: test
#   image: node
#   script:
#     - echo "Testing App"
#     - CI=true npm test
#     - echo "Test successfully!"
docker-build:
  stage: docker-build
  image: docker:latest
  services: 
      - name: docker:dind 
        entrypoint: ["env", "-u", "DOCKER_HOST"]
        command: ["dockerd-entrypoint.sh"]
  variables:
    DOCKER_HOST: tcp://docker:2375/
    DOCKER_DRIVER: overlay2
    DOCKER_TLS_CERTDIR: ""
  before_script:
    - echo $CI_REGISTRY
    - docker login -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD"
  script:
    - docker build --pull -t "$CI_REGISTRY_IMAGE" .
    - docker push "$CI_REGISTRY_IMAGE"
    - echo "Registry image:" $CI_REGISTRY_IMAGE
deploy:
  stage: deploy
  image: kroniak/ssh-client
  before_script:
    - echo "deploying app"
    - mkdir -p ~/.ssh
    - echo "$SSH_PRIVATE_KEY" > ~/.ssh/id_ed25519
    - chmod 600 ~/.ssh/id_ed25519
    - eval "$(ssh-agent -s)" 
    - ssh-add ~/.ssh/id_ed25519
    - ssh-keyscan $PROD_SERVER_IP -H  >> ~/.ssh/known_hosts
  script:
    # - ssh nhat@$PROD_SERVER_IP
    - ssh nhat@$PROD_SERVER_IP "sudo docker pull fleeforezz/portfolio"
    - ssh nhat@$PROD_SERVER_IP "sudo docker stop portfolio || true && sudo docker rm portfolio || true"
    - ssh nhat@$PROD_SERVER_IP "sudo docker run -p 9463:9463 -d --name portfolio fleeforezz/portfolio"
```

> These are variables that are stored at `https://gitlab.example.com/admin/application_settings/ci_cd` and choose variable option

![[Pasted image 20240221081832.png]]

> Variables used in `.gitlab-ci.yml` :
+ $CI_REGISTRY_USER
	![[Pasted image 20240221083331.png]]
+ $CI_REGISTRY_PASSWORD
	![[Pasted image 20240221083256.png]]
+ $CI_REGISTRY_IMAGE
	![[Pasted image 20240221083414.png]]
	Replace `fleeforezz/portfolio` with your docker-hub repo
	![[Pasted image 20240221083547.png]]
+ $SSH_PRIVATE_KEY
	You have to generate SSH keypair on your target server, if you don't know how to generate SSH key head over to [[SSH key]]
	Then copy the private key and paste it on gitlab variable.
	![[Pasted image 20240221083942.png]]
+ $PROD_SERVER_IP
	![[Pasted image 20240221084107.png]]
---> these variable were set in order to keep our server secrets save
## Create and push source code to gitlab

> I will use my self host gitlab for demo, you can check how to [[Install Gitlab]]

> On your `https://gitlab.example/dashboard/projects` create new blank project

> Name your project, pick a group or namespace

> Let's clone the project using Github desktop

> After clone completed move the NextJS project inside gitlab repository folder then commit to gitlab.

## Things to keep in mind

1. Forward port 22 in order to make SSH key work
2. You should allow user to use sudo without enter password