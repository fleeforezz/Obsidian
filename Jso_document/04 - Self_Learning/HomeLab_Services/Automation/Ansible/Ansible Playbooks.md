---
tags:
  - homelab
  - automation
  - ansible
status: learning
last-updated: 2026-05-26
banner: "[[04 - Self_Learning/attachments/ansible_banner.png]]"
banner-display: cover
banner-fade: "-100"
content-start: "300"
---
# Ansible Playbooks

## Purpose
Ansible Playbooks are the configuration, deployment, and orchestration language of Ansible. They are written in YAML and describe the policy you want your remote systems to enforce.

## Playbook Structure
Every playbook is a list of one or more "plays" in a list. A play maps a group of hosts to well-defined tasks.

```yaml
---
- name: Description of the play
  hosts: webservers        # Group defined in your inventory
  become: yes              # Run tasks as root (sudo)
  vars:
    http_port: 80
  
  tasks:
    - name: Ensure Apache is installed
      apt:
        name: apache2
        state: present
        update_cache: yes

    - name: Start Apache service
      service:
        name: apache2
        state: started
        enabled: yes
```

## Writing Rules & Common Gotchas

- **No Tabs Allowed**: YAML files must use spaces for indentation. Never use tab characters. If you use tabs, Ansible will fail with parser errors.
- **Indentation Consistency**: Keep your spaces aligned. Typically, use 2 spaces per indentation level.
- **Key-Value Formats**: Prefer standard YAML dictionary format:
  ```yaml
  # Good:
  apt:
    name: git
    state: present

  # Deprecated legacy format (avoid):
  apt: name=git state=present
  ```

## Common Playbook Execution
To execute a playbook:
`ansible-playbook -i inventory/hosts playbooks/site.yml --user myuser --ask-pass --ask-become-pass`

## Useful Built-in Modules
- `apt`: Manage packages on Debian/Ubuntu systems.
- `copy`: Copy files from host to remote machines.
- `template`: Copy files to remote machines and process them using Jinja2 templating.
- `service` / `systemd`: Manage system service states.
- `lineinfile`: Ensure a specific line is in a file (great for quick configs).
