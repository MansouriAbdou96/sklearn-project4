#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath="mansouri96/sklearn:1.0"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run sklearn-demo\
    --image=$dockerpath\
    --replicas=1\
    --port=80 

# to add lables to deployment now you need to use 
podname=$(kubectl get pods -o jsonpath='{.items[0].metadata.name}')
kubectl label pods $podname app=sklearn-demo

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward -l app=sklearn-demo 8000:80

