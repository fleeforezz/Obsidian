```shell
kubeadm join 192.168.1.53:6443 --token 8ip23s.kja06z50m5y1adv4 \
        --discovery-token-ca-cert-hash sha256:6d782fbcb1fec3a5e11d1b7922cefda2c75f12d79e42c702f4633c6c231512b6 \
        --control-plane
```

```shell
kubeadm join 192.168.1.53:6443 --token 8ip23s.kja06z50m5y1adv4 \
        --discovery-token-ca-cert-hash sha256:6d782fbcb1fec3a5e11d1b7922cefda2c75f12d79e42c702f4633c6c231512b6
```

```shell
mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config
```