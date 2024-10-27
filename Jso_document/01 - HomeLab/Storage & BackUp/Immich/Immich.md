### Step 1 - Download the required files[​](https://immich.app/docs/install/docker-compose#step-1---download-the-required-files "Direct link to Step 1 - Download the required files")

Create a directory of your choice (e.g. `./immich-app`) to hold the `docker-compose.yml` and `.env` files.

Move to the directory you created

```
mkdir ./immich-appcd ./immich-app
```

Download [`docker-compose.yml`](https://github.com/immich-app/immich/releases/latest/download/docker-compose.yml) and [`example.env`](https://github.com/immich-app/immich/releases/latest/download/example.env), either by running the following commands:

Get docker-compose.yml file

```
wget -O docker-compose.yml https://github.com/immich-app/immich/releases/latest/download/docker-compose.yml
```

Get .env file

```
wget -O .env https://github.com/immich-app/immich/releases/latest/download/example.env
```

(Optional) Get hwaccel.transcoding.yml file

```
wget -O hwaccel.transcoding.yml https://github.com/immich-app/immich/releases/latest/download/hwaccel.transcoding.yml
```

(Optional) Get hwaccel.ml.yml file

```
wget -O hwaccel.ml.yml https://github.com/immich-app/immich/releases/latest/download/hwaccel.ml.yml
```

### Step 2 - Populate the .env file with custom values[​](https://immich.app/docs/install/docker-compose#step-2---populate-the-env-file-with-custom-values "Direct link to Step 2 - Populate the .env file with custom values")

Example `.env` content

```
# You can find documentation for all the supported env variables at https://immich.app/docs/install/environment-variables

# The location where your uploaded files are stored
UPLOAD_LOCATION=./library
# The location where your database files are stored
DB_DATA_LOCATION=./postgres

# To set a timezone, uncomment the next line and change Etc/UTC to a TZ identifier from this list: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List
# TZ=Etc/UTC

# The Immich version to use. You can pin this to a specific version like "v1.71.0"
IMMICH_VERSION=release

# Connection secret for postgres. You should change it to a random password
# Please use only the characters `A-Za-z0-9`, without special characters or spaces
DB_PASSWORD=postgres

# The values below this line do not need to be changed
###################################################################################
DB_USERNAME=postgres
DB_DATABASE_NAME=immich
```

- Populate custom database information if necessary.
- Populate `UPLOAD_LOCATION` with your preferred location for storing backup assets.
- Consider changing `DB_PASSWORD` to a custom value. Postgres is not publically exposed, so this password is only used for local authentication. To avoid issues with Docker parsing this value, it is best to use only the characters `A-Za-z0-9`.
- Set your timezone by uncommenting the `TZ=` line.
### Step 3 - Start the containers[​](https://immich.app/docs/install/docker-compose#step-3---start-the-containers "Direct link to Step 3 - Start the containers")

From the directory you created in Step 1, (which should now contain your customized `docker-compose.yml` and `.env` files) run `docker compose up -d`.

Start the containers using docker compose command

```
docker compose up -d
```

Docker version

If you get an error `unknown shorthand flag: 'd' in -d`, you are probably running the wrong Docker version. (This happens, for example, with the docker.io package in Ubuntu 22.04.3 LTS.) You can correct the problem by `apt remove`ing Ubuntu's docker.io package and installing docker and docker-compose via [Docker's official repository](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository).

Note that the correct command really is `docker compose`, not `docker-compose`. If you try the latter on vanilla Ubuntu 22.04 it will fail in a different way:

```
The Compose file './docker-compose.yml' is invalid because:'name' does not match any of the regexes: '^x-'
```

See the previous paragraph about installing from the official docker repository.