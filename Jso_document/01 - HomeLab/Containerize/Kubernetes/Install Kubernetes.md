# The fast way
## On all nodes
### Getting ready

#### Disable swapoff

```shell
sudo su
swapoff -a; sed -i '/swap/d' /etc/fstab
```
#### Install containerd

```shell
cat <<EOF | sudo tee /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOF
sudo modprobe overlay
sudo modprobe br_netfilter
cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf
net.bridge.bridge-nf-call-iptables  = 1
net.ipv4.ip_forward                 = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF
sudo sysctl --system
sudo apt install containerd -y
mkdir /etc/containerd
containerd config default > /etc/containerd/config.toml
sed -i 's/SystemdCgroup = false/SystemdCgroup = true/g' /etc/containerd/config.toml
systemctl restart containerd
```

### Install kubeadm, kubelet, kubectl

```shell
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl gpg
```

```shell
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
```

```shell
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /" | sudo tee /etc/apt/sources.list.d/kubernetes.list
```

```shell
sudo apt-get update
sudo apt update
```

```shell
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
```

## On Master node

### Init cluster

```shell
sudo kubeadm init --control-plane-endpoint=172.16.250.216 --node-name controller --pod-network-cidr=10.244.0.0/16
```

Things have to change: 
--control-plane-endpoint=yourserverip
--node-name yourserverhostname

> [!warning]
> Run export command with root 
> Save the join commands to somewhere

The join command should look like this

```shell
export KUBECONFIG=/etc/kubernetes/admin.conf

kubeadm join 10.0.1.47:6443 --token jqc69r.djvkfmrmoj201f3e \
        --discovery-token-ca-cert-hash sha256:2bda7403a0e3fb26f6df54f6446517881845596c1ef26ce8420942fd40a2c87c \
        --control-plane
        
kubeadm join 10.0.1.47:6443 --token jqc69r.djvkfmrmoj201f3e \
        --discovery-token-ca-cert-hash sha256:2bda7403a0e3fb26f6df54f6446517881845596c1ef26ce8420942fd40a2c87c

```

```shell
kubectl get pods --all-namespaces
```

Install Helm
```shell
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
```

Install Calio
```shell
helm repo add projectcalico https://docs.tigera.io/calico/charts
kubectl create namespace tigera-operator
helm install calico projectcalico/tigera-operator --version v3.28.0 --namespace tigera-operator
```

If for some reason the join command has expired, the following command will provide you with a new one:

```
kubeadm token create --print-join-command
```
# The comprehensive way
## On all nodes
### Installing containerd

```shell
sudo apt install containerd
```

```shell
sudo mkdir /etc/containerd
```

```shell
containerd config default | sudo tee /etc/containerd/config.toml
```

```shell
sudo nano /etc/containerd/config.toml
```

Within that file, find the following line of text:

```
[plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc.options]
```

Underneath that, find the `SystemdCgroup` option and change it to `true`, which should look like this:

```
SystemdCgroup = true
```

### Disable Swap

```shell
sudo swapoff -a
```

### Enable bridging

```shell
sudo nano /etc/sysctl.conf
```

Within that file, look for the following line:

```
#net.ipv4.ip_forward=1
```

Uncomment that line by removing the `#` symbol in front of it, which should make it look like this:

```
net.ipv4.ip_forward=1
```

### Enable br_netfilter

```shell
sudo nano /etc/modules-load.d/k8s.conf
```

Add the following to that file (the file should actually be empty at first):

```
br_netfilter
```

### Reboot servers

```shell
sudo reboot
```

### Installing Kubernetes

```shell
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl gpg
```

```shell
# If the directory `/etc/apt/keyrings` does not exist, it should be created before the curl command, read the note below.
# sudo mkdir -p -m 755 /etc/apt/keyrings
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
```

```shell
# This overwrites any existing configuration in /etc/apt/sources.list.d/kubernetes.list
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
```

```shell
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
```

```shell
sudo systemctl enable --now kubelet
```

## On master nodes

### Initialize our Kubernetes cluster

```shell
sudo kubeadm init --control-plane-endpoint=172.16.250.216 --node-name controller --pod-network-cidr=10.244.0.0/16
```

Things have to change: 
--control-plane-endpoint=yourserverip
--node-name yourserverhostname

> [!warning]
> Run export command with root 
> Save the join commands to somewhere


```shell
kubectl get pods --all-namespaces
```

```shell
kubectl apply -f https://raw.githubusercontent.com/flannel-io/flannel/master/Documentation/kube-flannel.yml
```

If for some reason the join command has expired, the following command will provide you with a new one:

```
kubeadm token create --print-join-command
```