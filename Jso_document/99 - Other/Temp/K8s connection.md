
> [!note]
> Run this commands as a regular user
> ```shell
mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config


Join manager command
```shell
kubeadm join 10.0.1.51:6443 --token dmtrzc.horu63awggrawi8x \
        --discovery-token-ca-cert-hash sha256:0e8af88b3925ddf4b0eef13b4eed2ade34af83fe1b59aca1588fe1eecf23cd18 \
        --control-plane
```

Join worker command
+ Should run as root user
```shell
kubeadm join 10.0.1.51:6443 --token dmtrzc.horu63awggrawi8x \
        --discovery-token-ca-cert-hash sha256:0e8af88b3925ddf4b0eef13b4eed2ade34af83fe1b59aca1588fe1eecf23cd18
```
