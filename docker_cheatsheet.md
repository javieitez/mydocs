## Key concepts

* **Image:** a static template for running containers
  * Images have layers, which can be restoration points 
* **Container:** a running instance of an image 
  * You can run multiple instances of the same image
  * Containers have a state and can change
  * Changes are preserved during the life of the container, but are lost if the container is removed
* **Storage:** can be attached to a container to save data there 

### Containers
Run a container from an image
```
docker container run (OPTIONS) [image:label] 
```
Options can be `--name [container_name]`, `-p [host_port]:[container_port]`, `-v [/host/path]:[/container/path]`, etc...

`--rm` removes the container after finishing

to run interactively 
```
docker container run -it [docker_image] /bin/bash
```
List running containers
```
docker ps
```
login to a running container
```
docker exec -it [container-name] /bin/bash
```
stop and delete a running container
```
docker rm -f [container-id]
```


### Volumes and storage
> :information_source: Storage inside containers is volatile: once a container ir removed, the information stored in it is gone forever. 

> :point_right: _A volume is just a folder on the host machine mapped to a path on the container._

Create a volume
```
docker volume create [volume-name]
```
Run a container with a volume attached
```
docker run -v [volume-name]:[/mount/point/in/container] [image-name]
```
Run a container with the current folder attached to a mountpoint
```
docker run [image-name] -v "$(pwd):/[/mount/point/in/container]" 
```

### Networks
> :information_source: Docker Networks are an abstraction independent of the physical network they rely on. The same network can be distributed across multiple hosts on different physical networks.  

> :point_right: _If two containers are on the same network, they can talk to each other. If they aren't, they can't._
```
docker network create [network-name]
```
to use a specific network driver
```
docker network create -d [bridge|overlay|macvlan] [network-name]
```
* `bridge` single host, NATed to the real network
* `overlay` can span across multiple hosts for containers on each host to communicate directly, even on different physical networks
* `macvlan` -aka `transparent`- connects directly to the physical network

> :point_right: containers on a bridged network can resolve each other's names. The internal Docker DNS server worcks for all containers started with the `--name` or `--net-alias` flag.

### Building images 

Example Dockerfile

```dockerfile
# the source OS
FROM alpine
# commands to run when creating the image
RUN apk update && apk add nodejs
# put local files on a folder inside the image
COPY . /app
# make a folder the default path
WORKDIR /app
# run a command each time the image is executed in a container
CMD ["node","index.js"]
```

Create an image from the Dockerfile and the contents of the current dir

``` 
docker image build -t [image_name]:[tag_version] .
```

### Docker Swarm
> :information_source: Manages clusters of Docker nodes and deploys and manages applications, similar to Kubernetes.

Create a new swarm. The node that you run the command on becomes the first manager.
```
docker swarm init 
```
Reveal the command and token needed to join an existing swarm
```
 docker swarm join-token [manager|worker]
 ```
 List all nodes in the swarm
 ```
 docker node ls
 ```
 add a service to the swarm
 ```
docker service create --name my-svc --network my-net -p 80:80 --replicas 10 myrepo/myimage:v1
 ```
 `docker service ls` lists running services, while `docker service ps [service]` and `docker service inspect --pretty` give detailed information.
 
 Scale a service up or down (add or remove replicas)
```
docker service scale my-svc=12
```
Update a service with a new image
```
docker service update --image myrepo/myimage:v2 --update-parallelism 2 --update-delay 20s my-svc
```
Debug a service with `docker service logs my-svc`

Remove a service with `docker service rm my-svc` 

:warning: No confirmation is requested. All nodes are removed immediately.
