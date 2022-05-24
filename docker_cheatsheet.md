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


### Volumes and storage
Create a volume
```
docker volume create <volume-name>
```
Run a container with a volume attached
```
docker run -v <volume-name>:</mount/point/in/container> <image-name>
```
Run a container with the current folder attached to a mountpoint
```
docker run <image-name> -v "$(pwd):/</mount/point/in/container>" 
```

### Networks
> If two containers are on the same network, they can talk to each other. If they aren't, they can't.
```
docker network create <network-name>
```

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
docker image build -t <image_name>:<tag_version> .
```
