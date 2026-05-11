```shell
sudo mkdir -p /src/gitlab
```

```shell
export GITLAB_HOME=/srv/gitlab
```

```YAML
version: '3.6'
services:
  gitlab:
    image: gitlab/gitlab-ce:nightly
    container_name: gitlab
    restart: always
    hostname: 'gitlab.fleeforezz.me'
    environment:
      GITLAB_OMNIBUS_CONFIG: |
        # Add any other gitlab.rb configuration here, each on its own line
        external_url 'https://gitlab.fleeforezz.me'
    ports:
      - '80:80'
      - '443:443'
      - '22:22'
    volumes:
      - '$GITLAB_HOME/config:/etc/gitlab'
      - '$GITLAB_HOME/logs:/var/log/gitlab'
      - '$GITLAB_HOME/data:/var/opt/gitlab'
    shm_size: '256m'

```

```YAML
version: '3.6'
services:
  gitlab:
    image: gitlab/gitlab-ce:nightly
    container_name: gitlab
    restart: always
    hostname: 'gitlab.fleeforezz.me'
    environment:
      GITLAB_OMNIBUS_CONFIG: |
        # Add any other gitlab.rb configuration here, each on its own line
        external_url 'https://gitlab.fleeforezz.me'
    ports:
      - '80:80'
      - '443:443'
      - '22:22'
    volumes:
      - '/NFSStorage/Gitlab/config:/etc/gitlab'
      - '/NFSStorage/Gitlab/logs:/var/log/gitlab'
      - '/NFSStorage/Gitlab/data:/var/opt/gitlab'
    shm_size: '256m'

```

```YAML
version: '3.6'
services:
  gitlab:
    image: gitlab/gitlab-ce:nightly
    container_name: gitlab
    restart: always
    hostname: 'gitlab.fleeforezz.me'
    environment:
      GITLAB_OMNIBUS_CONFIG: |
        # Add any other gitlab.rb configuration here, each on its own line
        external_url 'https://gitlab.fleeforezz.me'
    ports:
      - '6680:80'
      - '6443:443'
      - '22:22'
    volumes:
      - gitlab-config:/etc/gitlab
      - gitlab-logs:/var/log/gitlab
      - gitlab-data:/var/opt/gitlab
    shm_size: '256m'

volumes:
  gitlab-config:
    driver: local
    driver_opts:
      type: nfs
      o: addr=10.0.1.34,rw
      device: ":/mnt/SlowZ1/DataStore/Gitlab/config"
      
  gitlab-logs:
    driver: local
    driver_opts:
      type: nfs
      o: addr=10.0.1.34,rw
      device: ":/mnt/SlowZ1/DataStore/Gitlab/logs"

  gitlab-data:
    driver: local
    driver_opts:
      type: nfs
      o: addr=10.0.1.34,rw
      device: ":/mnt/SlowZ1/DataStore/Gitlab/data"

```