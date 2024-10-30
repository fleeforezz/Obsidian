```shell
kubeadm join 192.168.1.52:6443 --token uqfcf0.4do6gor51lp6bodj \
        --discovery-token-ca-cert-hash sha256:4215c7a5c9bdb90770a78acdf17304fffe74d0808d4ca9d5b4dfc8d9b038a42e
```

```shell
kubeadm join 192.168.1.52:6443 --token uqfcf0.4do6gor51lp6bodj \
        --discovery-token-ca-cert-hash sha256:4215c7a5c9bdb90770a78acdf17304fffe74d0808d4ca9d5b4dfc8d9b038a42e \
        --control-plane
```

```shell
mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/confi
```