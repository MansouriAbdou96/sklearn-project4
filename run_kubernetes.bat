@echo on

set dockerpath="mansouri96/sklearn:1.0"

kubectl create deployment sklearn-demo2 --image=%dockerpath% --replicas=1 --port=80

kubectl get pods 

kubectl port-forward sklearn-demo2 8000:80