```shell
kubeadm join 10.0.1.53:6443 --token 161cqq.ish6d4qy2kwa96ec \
        --discovery-token-ca-cert-hash sha256:edb1761906eac671f28d286c5bb031850232aa9b8c565e36e32e3538006a12d7 \
        --control-plane
```

```shell
kubeadm join 10.0.1.53:6443 --token 161cqq.ish6d4qy2kwa96ec \
        --discovery-token-ca-cert-hash sha256:edb1761906eac671f28d286c5bb031850232aa9b8c565e36e32e3538006a12d7
```

```shell
mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config
```