```shell
kubeadm join 192.168.1.52:6443 --token 57e7jt.gugeeof1qkjzqfca \
        --discovery-token-ca-cert-hash sha256:30f90304762528a65b51c2c0c70679d9ffb328355ff532197048661c99fbdac7
```

```shell
kubeadm join 192.168.1.52:6443 --token 57e7jt.gugeeof1qkjzqfca \
        --discovery-token-ca-cert-hash sha256:30f90304762528a65b51c2c0c70679d9ffb328355ff532197048661c99fbdac7 \
        --control-plane
```