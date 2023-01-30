@echo on

docker build -t sklearn:1.0 .

docker images

docker run -p 8000:80 sklearn:1.0