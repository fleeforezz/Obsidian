# Install

```shell
sudo wget -q <http://www.webmin.com/jcameron-key.asc> -O- | sudo apt-key add -
```

```shell
sudo add-apt-repository "deb [arch=amd64] <http://download.webmin.com/download/repository> sarge contrib"
```

```shell
sudo apt install webmin
```

```shell
sudo systemctl status webmin
```

```shell
dpkg -l | grep webmin	
```
--> Default username: root --> To change Pass: `sudo /usr/share/webmin/changepass.pl /etc/webmin root new password` --> WebUi: http://ipadress:10000 

# Uninstall

```shell
/etc/webmin/uninstall.sh
```