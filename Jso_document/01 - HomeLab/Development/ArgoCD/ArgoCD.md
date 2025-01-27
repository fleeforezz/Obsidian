a# Install

```shell
kubectl create namespace argocd 
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

Change service setting in order to access Argo from Web UI

```shell
kubectl edit svc argocd-server -n argocd
```

type ClusterIP >> NodePort

```shell
kubectl get svc -n argocd
```

Disable network-policies 

```shell
kubectl delete networkpolicies -n argocd argocd-redis-network-policy
```
# Install ArgoCD CLI

```shell
curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
rm argocd-linux-amd64
```
# Login

User: admin
To get argo password:

```shell
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
```

Login web URL: http://public_ip_control:nordport

# Uninstall

```shell
kubectl delete -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

