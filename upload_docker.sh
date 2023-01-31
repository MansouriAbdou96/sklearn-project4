#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Create dockerpath
# dockerpath=<your docker ID/path>
dockerpath="mansouri96/sklearn:1.0"


# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login 

# Using command to Get the ID of Image sklearn
imageid=$(docker images | grep "sklearn" | awk '{print $3}')
docker tag $imageid $dockerpath


# Push image to a docker repository
docker push $dockerpath
