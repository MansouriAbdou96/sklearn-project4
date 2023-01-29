@echo on

docker build -t project4:1.0 .

docker images

docker run -p 8000:80 project4:1.0