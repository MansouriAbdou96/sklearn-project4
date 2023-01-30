@echo on

set dockerpath="mansouri96/sklearn:1.0"

echo Docker ID and Image: %dockerpath%

docker login 

docker tag 4a9c2013a49f %dockerpath%

docker push %dockerpath%