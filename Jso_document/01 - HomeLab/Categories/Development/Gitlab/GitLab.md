# What is Gitlab

> GitLab is an Open Source code `repository` and `collaborative` software development platform for large [[DevOps]] and [DevSecOps](https://www.techtarget.com/searchitoperations/definition/SecOps) projects. GitLab is free for individuals.

> GitLab provides end-to-end DevOps capabilities and for each stage of the software development lifecycle. GitLab’s continuous integration (CI) capabilities enable development teams to automate building and testing their code.

# Install Gitlab

## Install dependencies

```shell
sudo apt-get update
sudo apt-get install -y curl openssh-server ca-certificates tzdata perl
```
## Download Gitlab repository

```shell
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash
```

## Install Gitlab

```shell
sudo EXTERNAL_URL="https://gitlab.example.com" apt-get install gitlab-ee
```

> At this point, Gitlab is installed, but it’s not actually set up yet and it’s not going to be accessible until we configure it.

```shell
sudo nano /etc/gitlab/gitlab.rb
```

> Find external URL and change it to your domain.

```shell
external_url 'http://localhost'
# change to your domain
external_url 'https://gitlab.fleeforezz.me'
```

> Find letsencrypt and uncomment these line.

```shell
...
letsencrypt['enable'] = nil
letsencrypt['contact_emails'] = ['fleeforezz@gmail.com'] # This should be an array of email addresses to add as contacts# letsencrypt['group'] = 'root'
...
letsencrypt['auto_renew'] = true
...
```
---> When using nano to edit files, press `CTRL + W` to find what you want faster

Change path where repositories store
```ruby
gitaly['configuration'] = {
  storage: [
    {
      name: 'default',
      path: '/mnt/nas/git-data/repositories',
    },
  ],
}
```

>Reconfigure gitlab to make changes

```shell
sudo gitlab-ctl reconfigure
```

> When you visit your gitlab on web browser they will ask you `username` and `password`  so the default username is :

+ username : `root`

> And for the password, you have to cat it out in terminal

```shell
sudo cat /etc/gitlab/initial_root_password
```

# Gitlab Runner

## Install 

> For CPU x86/amd64.

```shell
sudo curl -L --output /usr/local/bin/gitlab-runner "https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64"
```

> Provide permission for installer.

```shell
sudo chmod +x /usr/local/bin/gitlab-runner
```

```shell
sudo useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash
```

> Install Gitlab runner.

```shell
sudo gitlab-runner install --user=gitlab-runner --working-directory=/home/gitlab-runner
```

```shell
sudo gitlab-runner start
```

> Register runner with repository (Optional)

```shell
sudo gitlab-runner register --url <URL của Gitlab> \
--registration-token <token> \
--description "<description>" \
--tag-list "<tag>" \
--executor "<executor>" \
--run-untagged="<boolean>" \
--docker-image <docker-image:tag>
```
Ex: 
```shell
sudo gitlab-runner register \
  --non-interactive \
  --url "GITLAB_SERVER_URL" \
  --registration-token "REGISTRATION_TOKEN" \
  --description "docker-runner" \
  --executor "docker" \
  --docker-image ubuntu:latest
```

## Config gitlab runner

> Edit gitlab-runner.toml file

```shell
sudo nano /etc/gitlab-runner/config.toml
```

> Remember to set privileged value to true, so that the runner will work without issue

```shell
privileged = true
```

```shell
[[runners]]
  name = "docker-runner"
  url = "https://gitlab.example.com"
  id = 1
  token = "some-token"
  token_obtained_at = 2020-02-14T09:46:28Z
  token_expires_at = 0001-01-01T00:00:00Z
  executor = "docker"
  [runners.docker]
    tls_verify = false
    image = "node:18-alpine"
    privileged = true # Change me
    disable_entrypoint_overwrite = false
    oom_kill_disable = false
    disable_cache = false
    volumes = ["/cache"]
    shm_size = 0
    network_mtu = 0
```

# Install Gitlab with Docker

> [!note] 
> Make sure you have [[Docker]] and [[Docker Compose]] installed

## Docker
### Gitlab
#### Create environment variable 

> The `GITLAB_HOME` environment variable should be appended to your shell’s profile so it is applied on all future terminal sessions:

- Bash: `~/.bash_profile`
- ZSH: `~/.zshrc`

```shell
sudo nano ~/.bash_profile
```

```shell
export GITLAB_HOME=/srv/gitlab # <---- Path to your gitlab file store
```

#### Install 

```shell
sudo docker run --detach \
  --hostname gitlab.example.com \
  --publish 9443:443 --publish 9080:80 --publish 9022:22 \
  --name gitlab \
  --restart always \
  --volume $GITLAB_HOME/config:/etc/gitlab \
  --volume $GITLAB_HOME/logs:/var/log/gitlab \
  --volume $GITLAB_HOME/data:/var/opt/gitlab \
  --shm-size 256m \
  gitlab/gitlab-ee:latest
```

> Default username is :
+ username : root

> Use `docker exec` to get inside gitlab docker container

```shell
sudo docker exec -it gitlab grep 'Password:' /etc/gitlab/initial_root_password
```

### Gitlab_runner

```shell
sudo docker run -d --name gitlab-runner --restart always \
  -v /srv/gitlab-runner/config:/etc/gitlab-runner \
  -v /var/run/docker.sock:/var/run/docker.sock \
  gitlab/gitlab-runner:latest
```

> Register runner

```shell
sudo docker run --rm -it -v /srv/gitlab-runner/config:/etc/gitlab-runner gitlab/gitlab-runner register
```
## Docker Compose (Recommend)

### Gitlab

```yaml
version: '3.7'
services:
  web:
    image: 'gitlab/gitlab-ce:latest'
    restart: always
    hostname: 'localhost'
    container_name: gitlab-ce
    environment:
      GITLAB_OMNIBUS_CONFIG: |
        external_url 'http://localhost'
    ports:
      - '8080:80'
      - '8443:443'
    volumes:
      - /home/nhat/GitLab/config:/etc/gitlab
      - /home/nhat/GitLab/logs:/var/log/gitlab
      - /home/nhat/GitLab/data:/var/opt/gitlab
```

### Gitlab runner

```shell
sudo docker run -d --name gitlab-runner --restart always \
  -v /srv/gitlab-runner/config:/etc/gitlab-runner \
  -v /var/run/docker.sock:/var/run/docker.sock \
  gitlab/gitlab-runner:latest
```

> Register runner

```shell
sudo docker run --rm -it -v /srv/gitlab-runner/config:/etc/gitlab-runner gitlab/gitlab-runner register


#### Read more
[[How to create a pipeline in Gitlab]]

