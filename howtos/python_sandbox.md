### Overview

Official Python images https://hub.docker.com/_/python

The image contains Python encapsulated in a minimal Debian 11 environment

### Dockerfile

In the same folder, put the `requirements.txt` file and the `Dockerfile`

Build the container
```shell
docker build -t my-python-app .
```
then run it
```shell
docker run -it --rm --name my-running-app my-python-app
```
