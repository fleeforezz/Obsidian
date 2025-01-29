```shell
kubeadm join 10.0.1.55:6443 --token zjf8ci.52i57uqowc88o7v7 \
        --discovery-token-ca-cert-hash sha256:f7f8da2ceca4f9b64449caf6ad976c2a675c714febc217625c53bbd6311dfa00 \
        --control-plane
```

```shell
kubeadm join 10.0.1.55:6443 --token zjf8ci.52i57uqowc88o7v7 \
        --discovery-token-ca-cert-hash sha256:f7f8da2ceca4f9b64449caf6ad976c2a675c714febc217625c53bbd6311dfa00
```

```shell
mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config
```