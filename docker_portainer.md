![](img/portainerlogo.png)

Credentials are stored on the usual KeePass DB

## Upgrade to a newer version

Remove the current instance
``` shell
docker stop portainer && docker rm portainer
```
Pull the newer version
```shell
docker pull portainer/portainer-ce:latest
```
Then start it
``` shell
docker run -d -p 8000:8000 -p 9443:9443 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
```

## Further Reading

https://docs.portainer.io/start/upgrade
