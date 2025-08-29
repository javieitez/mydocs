## Debian
required for adding repos via command line  
```bash
sudo apt-get install -y software-properties-common
```
### Add repo
```bash
wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | sudo apt-key add -
sudo add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
```
### Install 
```bash
sudo apt-get update && sudo apt-get install adoptopenjdk-8-hotspot
```
### Make java 8 the default 
```bash
sudo mv /etc/alternatives/java /etc/alternatives/java17
sudo ln -s /usr/lib/jvm/adoptopenjdk-8-hotspot-amd64/bin/java /etc/alternatives/java
```
Check the version with `java -version`

## Further Reading

https://blog.adoptopenjdk.net/2019/05/adoptopenjdk-rpm-and-deb-files/
