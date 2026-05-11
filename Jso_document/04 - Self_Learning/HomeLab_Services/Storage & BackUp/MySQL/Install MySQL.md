# Install

> Check update

```shell
sudo apt update && sudo apt upgrade -y
```

> Install MySQL

```shell
sudo apt install mysql-server
```

>If you only want to connect to a remote MySQL server instead of hosting a database on your machine, install only the MySQL Client by running

```bash
sudo apt install mysql-client
```

> Check if MySQL installed successfully

```bash
mysql --version
```

```bash
sudo service mysql status
```

> To check MySQL hosts and ports

```bash
sudo ss -tap | grep mysql
```

# Securing MySQL

```bash
sudo mysql_secure_installation
```

![[Pasted image 20240302101545.png]]

- **`0` - Low**. A password containing at least 8 characters.
- **`1` - Medium**. A password containing at least 8 characters, including numeric, mixed case characters, and special characters.
- **`2` - Strong**. A password containing at least 8 characters, including numeric, mixed case characters, and special characters, and compares the password to a dictionary file. ( But in this setup i will choose 0 for ez 😀 )

> The script then prompts for the following security features:

- Remove anonymous users?
- Disallow root login remotely?
- Remove test database and access to it?
- Reload privilege tables now?

> The recommended answer to all these questions is **`Y`**. However, if you want a different setting for any reason, enter any other key.

# Log in to MySQL Server

```bash
sudo mysql -u root
```

## To change current user password

```bash
ALTER USER 'root'@'localhost' IDENTIFIED BY 'new_password';
```

## If you’re facing “Access Denied for User ‘root’@’localhost’ (using password: YES) - No Privileges”

```sql
SELECT user,authentication_string,plugin,host FROM mysql.user;
```

> You will see somethin like this

```sql
+------------------+-------------------------------------------+-----------------------+-----------+
| user             | authentication_string                     | plugin                | host      |
+------------------+-------------------------------------------+-----------------------+-----------+
| root             |                                           | auth_socket           | localhost |
| mysql.session    | *THISISNOTAVALIDPASSWORDTHATCANBEUSEDHERE | mysql_native_password | localhost |
| mysql.sys        | *THISISNOTAVALIDPASSWORDTHATCANBEUSEDHERE | mysql_native_password | localhost |
| debian-sys-maint | *497C3D7B50479A812B89CD12EC3EDA6C0CB686F0 | mysql_native_password | localhost |
+------------------+-------------------------------------------+-----------------------+-----------+
4 rows in set (0.00 sec)
```

> To allow connection with root and password, then update the values in the table with command:

```sql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Current-Root-Password';
```

```SQL
FLUSH PRIVILEGES;
```

> Then run the select command again and you'll see it has changed :

```sql
+------------------+-------------------------------------------+-----------------------+-----------+
| user             | authentication_string                     | plugin                | host      |
+------------------+-------------------------------------------+-----------------------+-----------+
| root             | *2F2377C1BC54BE827DC8A4EE051CBD57490FB8C6 | mysql_native_password | localhost |
| mysql.session    | *THISISNOTAVALIDPASSWORDTHATCANBEUSEDHERE | mysql_native_password | localhost |
| mysql.sys        | *THISISNOTAVALIDPASSWORDTHATCANBEUSEDHERE | mysql_native_password | localhost |
| debian-sys-maint | *497C3D7B50479A812B89CD12EC3EDA6C0CB686F0 | mysql_native_password | localhost |
+------------------+-------------------------------------------+-----------------------+-----------+
4 rows in set (0.00 sec)
```

## Remote Access

```shell
sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf
```

> Change from 127.0.0.1 to 0.0.0.0

```shell
. . .
lc-messages-dir = /usr/share/mysql
skip-external-locking
#
# Instead of skip-networking the default is now to listen only on
# localhost which is more compatible and is not less secure.
bind-address            = 0.0.0.0
. . .
```

```shell
sudo systemctl restart mysql
```

```shell
mysql -u root -p
```

```sql
CREATE USER 'sammy'@'remote_server_ip' IDENTIFIED BY 'password';
```
or
```sql
CREATE USER 'sammy'@'%' IDENTIFIED BY 'password';
```

> The `%` means allow all host

> **Note**: This command will create a user that authenticates with MySQL’s default authentication plugin, `caching_sha2_password`. However, there is a known issue with some versions of PHP that can cause problems with this plugin.

> If you plan to use this database with a PHP application — phpMyAdmin, for example — you may want to create a remote user that will authenticate with the older, though still secure, `mysql_native_password` plugin instead:

```sql
CREATE USER 'sammy'@'remote_server_ip' IDENTIFIED WITH mysql_native_password BY 'password';
```

> If you aren’t sure, you can always create a user that authenticates with caching_sha2_plugin and the ALTER it later on with this command :

```sql
ALTER USER 'sammy'@'remote_server_ip' IDENTIFIED WITH mysql_native_password BY 'password';
```

> Grant access for user

```sql
GRANT CREATE, ALTER, DROP, INSERT, UPDATE, DELETE, SELECT, REFERENCES, RELOAD on *.* TO 'sammy'@'remote_server_ip' WITH GRANT OPTION;
```

> To grant all

```sql
GRANT ALL PRIVILEGES on *.* TO 'sammy'@'remote_server_ip' WITH GRANT OPTION;
```

```sql
FLUSH PRIVILEGES;
```

```sql
exit
```

> Make sure to replace `remote_IP_address` with the actual IP address of the machine you plan to connect with:

```shell
sudo ufw allow from remote_IP_address to any port 3306
```

> **Warning:** This command will enable anyone to access your MySQL database. **Do not** run it if your database holds any sensitive data.

```shell
sudo ufw allow 3306
```

> **Note**: If you added a firewall rule to only allow connections from a specific IP address, you must try to access the database with the machine associated with that address.

```shell
mysql -u user -h database_server_ip -p
```

# Remove MySQL

```bash
sudo apt-get remove --purge mysql-server mysql-client mysql-common
```

```bash
sudo apt-get autoremove
```

```bash
sudo apt-get autoclean
```

```bash
sudo rm -rf /var/lib/mysql
```

```bash
sudo rm -rf /etc/mysql
```