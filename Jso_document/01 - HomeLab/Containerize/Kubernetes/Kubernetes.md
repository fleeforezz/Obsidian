# What is Kubernetes


# Install Kubernetes
[[Install Kubernetes]]
# Fix Error
[[Fix error]]
# Cheatsheet
[[Cheatsheet]]
# deployment.yml file

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

# service.yml

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

# Export file

```shell
export KUBECONFIG=/etc/kubernetes/admin.conf
```

