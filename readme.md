# How to run this script?

Note: Make sure you have aws cli setup on device properly

## If eksctl is not installed

```sh
./install.sh
```

## Next step?

### To deploy cluster run

```sh
region=ap-northeast-2 cluster_name=dev nodes_number=3 ./deploy_cluster.sh
```

## Attach label and deploy in specific node

```sh
node_name=ip-192.142.78.43 node_label=sp-1 ./attach_label_to_node
```

Note: Make sure to add nodeselector to spec in deployments see the below example

```yaml
apiVersion: v1
kind: Service
metadata:
  name: mongo
spec:
  selector:
    app: mongo
  ports:
    - port: 27017
      targetPort: 27017
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mongo
spec:
  selector:
    matchLabels:
      app: mongo
  template:
    metadata:
      labels:
        app: mongo
    spec:
      containers:
        - name: mongo
          image: mongo:6.0.2-focal
          ports:
            - containerPort: 27017
      nodeSelector:
        special-node: "true"
```

Then deploy

```sh
kubectl apply -f mongo.yaml
```

## How to deploy prometheus?

```
cd prometheus
./run.sh
```
