### Dev Env
```shell
kubeadm join 10.0.1.52:6443 --token wyrmrq.i9286yti3tp4qov0 \
        --discovery-token-ca-cert-hash sha256:a603566ec408bb3f6ac3169855164abb97471408072aac5701fcfe092f921afb \
        --control-plane
```

```shell
kubeadm join 10.0.1.52:6443 --token wyrmrq.i9286yti3tp4qov0 \
        --discovery-token-ca-cert-hash sha256:a603566ec408bb3f6ac3169855164abb97471408072aac5701fcfe092f921afb
```

```shell
mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config
```