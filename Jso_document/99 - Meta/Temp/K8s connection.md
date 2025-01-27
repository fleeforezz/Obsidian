```shell
kubeadm join 10.0.1.55:6443 --token d8g1qd.4ts36o8ur3kgl97i \
        --discovery-token-ca-cert-hash sha256:59992b09094d56d69be865c4f86f1f2960ace5e7a35736c51b5a1e0eec568aca \
        --control-plane
```

```shell
kubeadm join 10.0.1.55:6443 --token d8g1qd.4ts36o8ur3kgl97i \
        --discovery-token-ca-cert-hash sha256:59992b09094d56d69be865c4f86f1f2960ace5e7a35736c51b5a1e0eec568aca
```

```shell
mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config
```