# SSH key fingerprint error

```YAML
FAILED! => {"msg": "Using a SSH password instead of a key is not possible because Host Key checking is enabled and sshpass does not support this.  Please add this host's fingerprint to your known_hosts file to manage this host."}
```

> Try create an ansible.cfg file

```shell
nano ansible.cfg
```

```shell
[default]
host_key_checking = false
```

> **Note:** Ansible version 2.6.2 and solution with host_key_checking = false doesn't work

> This error can also be solved by simply export ANSIBLE_HOST_KEY_CHECKING variable.

```shell
export ANSIBLE_HOST_KEY_CHECKING=False
```

# If Ansible require sshpass

```shell
sudo apt install sshpass
```