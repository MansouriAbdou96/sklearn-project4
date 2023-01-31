@echo on

set dockerpath="mansouri96/sklearn:1.0"

kubectl create deployment sklearn-demo2 --image=%dockerpath% --replicas=1 --port=80

kubectl get pods 

for /f "tokens=*" %%i in ('kubectl get pods -o jsonpath="{.items[0].metadata.name}"') do set pod_name=%%i
kubectl port-forward %pod_name% 8000:80