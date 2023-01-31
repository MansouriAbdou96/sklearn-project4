#!/usr/bin/env bash

# Build image and add a descriptive tag
docker build -t sklearn:1.0 .

# List docker images
docker images 

# Run flask app
docker run -p 8000:80 sklearn:1.0
