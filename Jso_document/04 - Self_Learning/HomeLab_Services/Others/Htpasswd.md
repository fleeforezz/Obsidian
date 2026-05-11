
`htpasswd` is used to create and update the flat-files used to store usernames and password for basic authentication of HTTP users. If `htpasswd` cannot access a file, such as not being able to write to the output file or not being able to read the file in order to update it, it returns an error status and makes no changes.

# Install for Linux

```shell
sudo apt update
sudo apt install apache2-utils
```

# Install for MacOs

> [!note]
> Should already be installed

# Install for Windows

> [!note]
> `htpasswd.exe` Should already be installed on Windows

# Generate credential pair

```shell
echo $(htpasswd -nB user) | sed -e s/\\$/\\$\\$/g
```

+ Change the "user" to your username