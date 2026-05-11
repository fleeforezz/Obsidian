# Config the inventory

> Create a folder call “inventory” and create a file name “hosts” then nano to that file

```YAML
[ubuntu] # group
youripaddress or DNS name
youripaddress or DNS name
youripaddress or DNS name
```

> To run the inventory type this command

```YAML
ansible -i ./inventory/hosts ubuntu -m ping --user nhat --ask-pass
```

- `./inventory/hosts` : inventory folder
- `ubuntu` : group name
- `-m ping` : module or type of command we want to use. In this example we use ping module
- `--user nhat` : servers username
- `--ask-pass` : ask for servers password

## Config the Playbooks

> Create a folder name playbooks and create a `yml` file and then again nano to that file

```YAML
---
- hosts: all
	become: yes
	tasks:
		- name: apt-update
			apt:
				update_cache: yes
				upgrade: 'yes'
```

> To run the playbooks type this command

```YAML
ansible-playbook ./playbooks/apt.yml --user nhat --ask-pass --ask-become-pass -i ./inventory/hosts
```

- `./playbooks/apt.yml` : playbooks folder
- `--user nhat` : servers username
- `--ask-pass` : ask for server password
- `--ask-become-pass` : ask for become root
- `./inventory/hosts` : inventory folder