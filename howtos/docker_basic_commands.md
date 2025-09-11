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
