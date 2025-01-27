```shell
kubeadm join 10.0.1.55:6443 --token 9djrjb.3dj3rrn5988zjq2j \
        --discovery-token-ca-cert-hash sha256:cc74678cba477179b447a2d2b3f578c6b378457ab0f7278a272836ff4517ffaf \
        --control-plane
```

```shell
kubeadm join 10.0.1.55:6443 --token 9djrjb.3dj3rrn5988zjq2j \
        --discovery-token-ca-cert-hash sha256:cc74678cba477179b447a2d2b3f578c6b378457ab0f7278a272836ff4517ffaf
```

```shell
mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config
```