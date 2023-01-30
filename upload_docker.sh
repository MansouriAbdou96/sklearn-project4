#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
dockerpath="mansouri96/sklearn:1.0"

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login 

# Using command to Get the ID of Image sklearn
# docker images | grep "sklearn:1.0" | awk '{print $3}'
docker tag 4a9c2013a49f $dockerpath

# Step 3:
# Push image to a docker repository
docker push $dockerpath
