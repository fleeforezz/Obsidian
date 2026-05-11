# Syntax

```YAML
usage: ansible [-h] [--version] [-v] [-b] [--become-method BECOME_METHOD]
            [--become-user BECOME_USER]
            [-K | --become-password-file BECOME_PASSWORD_FILE]
            [-i INVENTORY] [--list-hosts] [-l SUBSET] [-P POLL_INTERVAL]
            [-B SECONDS] [-o] [-t TREE] [--private-key PRIVATE_KEY_FILE]
            [-u REMOTE_USER] [-c CONNECTION] [-T TIMEOUT]
            [--ssh-common-args SSH_COMMON_ARGS]
            [--sftp-extra-args SFTP_EXTRA_ARGS]
            [--scp-extra-args SCP_EXTRA_ARGS]
            [--ssh-extra-args SSH_EXTRA_ARGS]
            [-k | --connection-password-file CONNECTION_PASSWORD_FILE] [-C]
            [-D] [-e EXTRA_VARS] [--vault-id VAULT_IDS]
            [--ask-vault-password | --vault-password-file VAULT_PASSWORD_FILES]
            [-f FORKS] [-M MODULE_PATH] [--playbook-dir BASEDIR]
            [--task-timeout TASK_TIMEOUT] [-a MODULE_ARGS] [-m MODULE_NAME]
            pattern
```

# Common options

```YAML
--ask-vault-password, --ask-vault-pass
```

—> ask for vault password

```YAML
--become-method <BECOME_METHOD>
```

—> privilege escalation method to use (default=sudo), use `ansible-doc -t become -l` to list valid choices.

```YAML
--become-password-file <BECOME_PASSWORD_FILE>, --become-pass-file <BECOME_PASSWORD_FILE>
```

—> Become password file

```YAML
--become-user <BECOME_USER>
```

—> Run operations as this user (default=root)

```YAML
--connection-password-file <CONNECTION_PASSWORD_FILE>, --conn-pass-file <CONNECTION_PASSWORD_FILE>
```

—> Connection password file

```YAML
--lists-hosts
```

—> Outputs a list of matching hosts; does not execute anything else

```YAML
--playbook-dir <BASEDIR>
```

—> Since this tool does not use playbooks, use this as a substitute playbook directory. This sets the relative path for many features including roles/ group_vars/ etc.

```YAML
--private-key <PRIVATE_KEY_FILE>, --key-file <PRIVATE_KEY_FILE>
```

—> Use this file to authenticate the connection

```YAML
--scp-extra-args <SCP_EXTRA_ARGS>
```

—> Specify extra arguments to pass to scp only (e.g. -l)

```YAML
--sftp-extra-args <SFTP_EXTRA_ARGS>
```

—> Specify extra arguments to pass to sftp only (e.g. -f, -l)

```YAML
--ssh-common-args <SSH_COMMON_ARGS>
```

—> Specify common arguments to pass to sftp/scp/ssh (e.g. ProxyCommand)

```YAML
--ssh-extra-args <SSH_EXTRA_ARGS>
```

—> Specify extra arguments to pass to ssh only (e.g. -R)

```YAML
--task-timeout <TASK_TIMEOUT>
```

—> Set task timeout limit in seconds, must be positive integer.

```YAML
--vault-id
```

—> The vault identity to use

```YAML
--vault-password-file, --vault-pass-file
```

—> vault password file

```YAML
--version
```

—> show program’s version number, config file location, configured module search path, module location, executable location and exit

```YAML
-B <SECONDS>, --background <SECONDS>
```

—> run asynchronously, failing after X seconds (default=N/A)

```YAML
-C, --check
```

—> don’t make any changes; instead, try to predict some of the changes that may occur

```YAML
-D, --diff
```

—> when changing (small) files and templates, show the differences in those files; works great with –check

```YAML
-K, --ask-become-pass
```

—> ask for privilege escalation password

```YAML
-M, --module-path
```

—> prepend colon-separated path(s) to module library (default={{ ANSIBLE_HOME ~ “/plugins/modules:/usr/share/ansible/plugins/modules” }})

```YAML
-P <POLL_INTERVAL>, --poll <POLL_INTERVAL>
```

—> set the poll interval if using -B (default=15)

```YAML
-T <TIMEOUT>, --timeout <TIMEOUT>
```

—> override the connection timeout in seconds (default=10)

```YAML
-a <MODULE_ARGS>, --args <MODULE_ARGS>
```

—> The action’s options in space separated k=v format: -a ‘opt1=val1 opt2=val2’ or a json string: -a ‘{“opt1”: “val1”, “opt2”: “val2”}’

```YAML
-b, --become
```

—> run operations with become (does not imply password prompting)

```YAML
-c <CONNECTION>, --connection <CONNECTION>
```

—> connection type to use (default=smart)

```YAML
-e, --extra-vars
```

—> set additional variables as key=value or YAML/JSON, if filename prepend with @

```YAML
-f <FORKS>, --forks <FORKS>
```

—> specify number of parallel processes to use (default=5)

```YAML
-h, --help
```

—> show this help message and exit

```YAML
-i, --inventory, --inventory-file
```

—> specify inventory host path or comma separated host list. –inventory-file is deprecated

```YAML
-k, --ask-pass
```

—> ask for connection password

```YAML
-l <SUBSET>, --limit <SUBSET>
```

—> further limit selected hosts to an additional pattern

```YAML
-m <MODULE_NAME>, --module-name <MODULE_NAME>
```

—> Name of the action to execute (default=command)

```YAML
-o, --one-line
```

—> condense output

```YAML
-t <TREE>, --tree <TREE>
```

—> log output to this directory

```YAML
-u <REMOTE_USER>, --user <REMOTE_USER>
```

—> connect as this user (default=None)

```YAML
-v, --verbose
```

—> Causes Ansible to print more debug messages. Adding multiple -v will increase the verbosity, the builtin plugins currently evaluate up to -vvvvvv. A reasonable level to start is -vvv, connection debugging might require -vvvv.

# Environment

`ANSIBLE_INVENTORY` - Override the default the ansible inventory file

[Ansible Configuration Settings — Ansible Documentation](https://docs.ansible.com/ansible/latest/reference_appendices/config.html#envvar-ANSIBLE_INVENTORY)

`ANSIBLE_LIBRARY` - Override the default ansible module library path

[Ansible Configuration Settings — Ansible Documentation](https://docs.ansible.com/ansible/latest/reference_appendices/config.html#envvar-ANSIBLE_LIBRARY)

`ANSIBLE_CONFIG` - Override the default ansible config file

[Ansible Configuration Settings — Ansible Documentation](https://docs.ansible.com/ansible/latest/reference_appendices/config.html#envvar-ANSIBLE_CONFIG)

## Files

`/etc/ansible/hosts` - Default inventory file

`/etc/ansible/ansible.cfg` - Config file, use if present

`~/.ansible.cfg` - User config file, overrides the default config if present