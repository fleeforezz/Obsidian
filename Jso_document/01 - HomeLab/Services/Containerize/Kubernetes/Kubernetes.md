---
banner: https://media.licdn.com/dms/image/v2/D5612AQEtYZHuG9EAvA/article-cover_image-shrink_720_1280/article-cover_image-shrink_720_1280/0/1690715676764?e=2147483647&v=beta&t=BSZ6IpTKRQKGWDCqPnYSSHhk8V8ecqAXCfGnZT4lU0k
content-start: "300"
banner-display: cover
banner-fade: "-100"
---
## What is Kubernetes


## Install Kubernetes
[[Install Kubernetes]]
## Fix Error
[[Fix error]]
## Cheatsheet
[[Cheatsheet]]
## deployment.yml file

```YAML
apiVersion: apps/v1
kind: Deployment
metadata:
  name: portfolio-deployment
spec:
  selector:
    matchLabels:
      app: portfolio
  replicas: 2
  template:
    metadata:
      labels:
        app: portfolio
    spec:
      containers:
      - name: portfolio
        image: fleeforezz/portfolio
        ports:
        - containerPort: 9463
```

## service.yml

```YAML
apiVersion: v1
kind: Service
metadata:
  name: portfolio-service
spec:
  selector:
    app: portfolio
  type: NodePort
  ports:
    - port: 9463
      targetPort: 9463
      nodePort: 32000
```

## Export file

```shell
export KUBECONFIG=/etc/kubernetes/admin.conf
```

