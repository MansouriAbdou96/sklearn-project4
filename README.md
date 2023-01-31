[![CircleCI](https://dl.circleci.com/status-badge/img/gh/MansouriAbdou96/sklearn-project4/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/MansouriAbdou96/sklearn-project4/tree/main)

## Project Summary

This project is a pre-trained `sklearn` model for predicting housing prices in Boston based on features like average rooms in a home, highway access, and teacher-to-pupil ratios. The project involves operationalizing a Python Flask app (`app.py`) to serve predictions through API calls. The model and data were originally from Kaggle [the data source site](https://www.kaggle.com/c/boston-housing). The project can be extended to any pre-trained machine learning model, including image recognition and data labeling.

### Project Content

The repository includes a .circleci/config.yml file that tests the `Dockerfile` and `app.py` using `hadolint` and `pylint` through a Makefile that includes commands for setup, installation, testing, linting. The project also includes an output_text_file folder that contains two text files for logs generated from running the app with docker using `make_predictions.sh` and for logs generated from running the app with kubernetes. This ensures that the code is thoroughly tested and validated before deployment.

Also include the following shell scripts:

- `run_docker.sh` for building and running the Docker image
- `run_kubernetes.sh` for deploying the Docker image to a Kubernetes cluster and port forwarding
- `upload_docker.sh` for uploading the Docker image to Docker Hub
- `make_predictions.sh` to send input values to app.py and make predictions.

These scripts automate the deployment and prediction process, making it easier to use and run the app.

## Setup the Environment

* Create a virtualenv with Python 3.7 and activate it. Refer to this link for help on specifying the Python version in the virtualenv. 
```bash
python3 -m pip install --user virtualenv
# You should have Python 3.7 available in your host. 
# Check the Python path using `which python3`
# Use a command similar to this one:
python3 -m virtualenv --python=<path-to-Python3.7> .devops
source .devops/bin/activate
```
* Run `make install` to install the necessary dependencies

### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`

### Kubernetes Steps

* Setup and Configure Docker locally

1. Install Docker: You can download and install Docker from the official website (https://www.docker.com/products/docker-desktop).

2. Start Docker: Once installed, start Docker by clicking on the Docker icon in your system tray or the application menu.

Verify Installation: To verify if Docker is installed and running, you can run the following command in your terminal or command prompt:
```bash
docker run hello-world 
```

* Setup and Configure Kubernetes locally

1. Install kubectl for interacting with a Kubernetes cluster. It allows you to manage, inspect, and interact with the components of your cluster, such as nodes, pods, services, and deployments. With kubectl, you can create, update, and delete resources, check cluster status, and more.

* Download the latest version of kubectl: You can download the latest version of kubectl from the official Kubernetes website (https://kubernetes.io/docs/tasks/tools/install-kubectl/).

* Make the kubectl binary executable: You can make the binary executable by running the following command:
```bash
chmod +x kubectl 
```

* Move the binary to your PATH: You can move the binary to a directory in your PATH, such as /usr/local/bin/, so that you can use the kubectl command from anywhere. You can do this by running the following command:
```bash
sudo mv kubectl /usr/local/bin/
```

* Verify the installation: You can verify that kubectl was installed successfully by running the following command:
```bash
kubectl version
```

2. Install a Kubernetes Environment: You can either use Minikube or a cloud provider to set up a local Kubernetes environment. Minikube is a tool that makes it easy to run a single-node Kubernetes cluster locally. You can download and install Minikube from the official website (https://kubernetes.io/docs/tasks/tools/install-minikube/).

3. Start Minikube: Once Minikube is installed, you can start using docker it by running the following command in your terminal or command prompt:
```bash
minikube start --driver docker 
```

4. To verify if Minikube has been set up successfully, you can run the following command in your terminal or command prompt:
```bash
kubectl cluster-info
```

* Create Flask app in Container

1. The command `docker build -t sklearn:1.0` is used to build a Docker image using the Dockerfile present in the repository. The -t flag is used to specify a tag (i.e. version) for the image, in this case sklearn:1.0. The . at the end of the command specifies the build context, which is the current directory where the Dockerfile is located. This command builds the Docker image with the specified tag and makes it available for use on the local system.
```bash
# Build image and add a descriptive tag
docker build -t sklearn:1.0
```

* Run via kubectl

1. This command runs the Docker container in a Kubernetes cluster by creating a pod with the specified name (sklearn-demo) and Docker image (specified by Docker ID or path). The image is exposed on port 80 and labeled as an "app" with the name "sklearn-demo".

```bash
# Run the Docker Hub container with kubernetes
kubectl create deployment sklearn-demo\
    --image=mansouri96/sklearn:1.0\
    --replicas=1\
    --port=80 
```

2. This command forwards the container port, which is 80, to host port 8000 using kubectl. It enables access to the application running in the container through localhost at port 8000.
```bash
# Forward the container port to a host
kubectl port-forward <pod-name> 8000:80
```
