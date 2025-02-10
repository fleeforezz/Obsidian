```shell
kubeadm join 192.168.1.55:6443 --token nqtzoo.c3qcr9e3gh2b0e8g \
        --discovery-token-ca-cert-hash sha256:895dfd78720c183a59e322e00996ae7981f1c3b1afd13704b1a95b5babde5d52 \
        --control-plane
```

```shell
kubeadm join 192.168.1.55:6443 --token nqtzoo.c3qcr9e3gh2b0e8g \
        --discovery-token-ca-cert-hash sha256:895dfd78720c183a59e322e00996ae7981f1c3b1afd13704b1a95b5babde5d52
```

```shell
mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config
```