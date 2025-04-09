```shell
kubeadm join 10.0.1.53:6443 --token s3fz7c.m9vz6r8hru04dkou \
        --discovery-token-ca-cert-hash sha256:9213306d263cb66d54c6359c523974aa0a14ad350a2a4e0b9479f41b3e2d0621 \
        --control-plane
```

```shell
kubeadm join 10.0.1.53:6443 --token s3fz7c.m9vz6r8hru04dkou \
        --discovery-token-ca-cert-hash sha256:9213306d263cb66d54c6359c523974aa0a14ad350a2a4e0b9479f41b3e2d0621
```

```shell
mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config
```