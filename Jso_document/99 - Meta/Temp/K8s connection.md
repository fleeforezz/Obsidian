```shell
kubeadm join 10.0.1.55:6443 --token ysdv26.p8sv2wh1c2b2e7r8 \
        --discovery-token-ca-cert-hash sha256:9d52067f4a143196894b425d5b184049421228d137e896fce67a2f8d48ad6418 \
        --control-plane
```

```shell
kubeadm join 10.0.1.55:6443 --token ysdv26.p8sv2wh1c2b2e7r8 \
        --discovery-token-ca-cert-hash sha256:9d52067f4a143196894b425d5b184049421228d137e896fce67a2f8d48ad6418
```

```shell
mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config
```