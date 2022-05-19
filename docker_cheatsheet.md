### Containers
list running containers
```
docker ps
```
login to a running container
```
docker exec -it <container-name> /bin/bash
```
stop and delete a running container
```
docker rm -f <container-id>
```


### Volumes
Create a volume
```
docker volume create <volume-name>
```
Run a container with a volume attached
```
docker run -v <volume-name>:</mount/point/in/container> <container-name>
```
