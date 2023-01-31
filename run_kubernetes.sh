#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# This is your Docker ID/path
dockerpath="mansouri96/sklearn:1.0"

# Run the Docker Hub container with kubernetes
kubectl create deployment sklearn-demo\
    --image=$dockerpath\
    --replicas=1\
    --port=80 

# to add lables to deployment now you need to use 
podname=$(kubectl get pods -o jsonpath='{.items[0].metadata.name}')
kubectl label pods $podname app=sklearn-demo

# List kubernetes pods
kubectl get pods

# Forward the container port to a host
kubectl port-forward $podname 8000:80

