# Check if you have an existing SSH key pair

> Before you create a key pair, see if a key pair already exists.

+  Go to your home directory.
+ Go to the `/.ssh` subdirectory.
+ See if a file with one of the following formats exists :

|Algorithm|Public key|Private key|
|---|---|---|
|ED25519 (preferred)|`id_ed25519.pub`|`id_ed25519`|
|ED25519_SK|`id_ed25519_sk.pub`|`id_ed25519_sk`|
|ECDSA_SK|`id_ecdsa_sk.pub`|`id_ecdsa_sk`|
|RSA (at least 2048-bit key size)|`id_rsa.pub`|`id_rsa`|
|DSA (deprecated)|`id_dsa.pub`|`id_dsa`|
|ECDSA|`id_ecdsa.pub`|`id_ecdsa`|
# Create Key-pair

> For ED25519

```shell
ssh-keygen -t ed25519 -C "<comment>"
```

> For 2048-bit RSA

```shell
ssh-keygen -t rsa -b 2048 -C "<comment>"
```

---> Press `Enter` . Output similar to the following is displayed :

```shell
Generating public/private ed25519 key pair.
Enter file in which to save the key (/home/user/.ssh/id_ed25519):
```

---> Specify a passphrase (or you can leave it empty) :

```shell
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
```