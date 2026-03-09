View logs 
```shell
docker logs <containername>
```
Run a shell in the container
```shell
docker exec -it <containername> /bin/bash
```
inspect the internal IP of a container
```shell
docker inspect <container id> | grep "IPAddress"
```
copy files from the local filesystem into the container
```
docker cp src/. container_id:/target
```

or the other way around
```
docker cp container_id:/src/. target
```
