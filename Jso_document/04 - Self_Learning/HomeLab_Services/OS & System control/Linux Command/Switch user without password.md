
```shell
sudo visudo
```

add the following configuration below the line **`“%sudo ALL=(ALL:ALL) ALL”`**

```shell
aaronk ALL=NOPASSWD: /bin/su – [username]
```

![[Pasted image 20240302095012.png]]

Now try to **`su`** to the account [username]

```shell
sudo su - [username]
```
