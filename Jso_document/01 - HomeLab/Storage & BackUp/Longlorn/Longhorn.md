## Check all of the node met the requirement

```shell
curl -sSfL https://raw.githubusercontent.com/longhorn/longhorn/v1.7.1/scripts/environment_check.sh | bash
```

1. Install open-iscsi and NFS-Common:
	+ Install open-iscsi: `sudo apt install open-iscsi`
		+ Load the module: `sudo modprobe iscsi_tcp`
		+ Check if loaded: `sudo lsmod | grep iscsi`
	+ Install nfs-common: `sudo apt install nfs-common`

2. Disable Multipath 
	+ Disable: `sudo systemctl disable multipathd multipathd.socket`
	+ Stop: `sudo systemctl disable multipathd multipathd.socket`

## Install LongHorn using kubectl

1. Install longhorn on any k8s cluster using this command:

```shell
kubectl apply -f https://raw.githubusercontent.com/longhorn/longhorn/v1.7.1/deploy/longhorn.yaml
```

+ One way to monitor the progress of the installation is to watch pods being created in the `longhorn-system` namespace:

```shell
kubectl get pods \
--namespace longhorn-system \
--watch
```

2. Check that the deployment was successful:

```shell
$ kubectl -n longhorn-system get pod

NAME                                                READY   STATUS    RESTARTS   AGE
longhorn-ui-b7c844b49-w25g5                         1/1     Running   0          2m41s
longhorn-manager-pzgsp                              1/1     Running   0          2m41s
longhorn-driver-deployer-6bd59c9f76-lqczw           1/1     Running   0          2m41s
longhorn-csi-plugin-mbwqz                           2/2     Running   0          100s
csi-snapshotter-588457fcdf-22bqp                    1/1     Running   0          100s
csi-snapshotter-588457fcdf-2wd6g                    1/1     Running   0          100s
csi-provisioner-869bdc4b79-mzrwf                    1/1     Running   0          101s
csi-provisioner-869bdc4b79-klgfm                    1/1     Running   0          101s
csi-resizer-6d8cf5f99f-fd2ck                        1/1     Running   0          101s
csi-provisioner-869bdc4b79-j46rx                    1/1     Running   0          101s
csi-snapshotter-588457fcdf-bvjdt                    1/1     Running   0          100s
csi-resizer-6d8cf5f99f-68cw7                        1/1     Running   0          101s
csi-attacher-7bf4b7f996-df8v6                       1/1     Running   0          101s
csi-attacher-7bf4b7f996-g9cwc                       1/1     Running   0          101s
csi-attacher-7bf4b7f996-8l9sw                       1/1     Running   0          101s
csi-resizer-6d8cf5f99f-smdjw                        1/1     Running   0          101s
instance-manager-b34d5db1fe1e2d52bcfb308be3166cfc   1/1     Running   0          114s
engine-image-ei-df38d2e5-cv6nc                      1/1     Running   0          114s
```




