```shell
kubeadm join 10.0.1.55:6443 --token 3kreq6.yfc4rkbvoedfm47b \
        --discovery-token-ca-cert-hash sha256:f35112480d01b40cafca30e585c99b3472fc9204555f92f792f3b9f231195e78 \
        --control-plane
```

```shell
kubeadm join 10.0.1.55:6443 --token 3kreq6.yfc4rkbvoedfm47b \
        --discovery-token-ca-cert-hash sha256:f35112480d01b40cafca30e585c99b3472fc9204555f92f792f3b9f231195e78
```

```shell
mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config
```