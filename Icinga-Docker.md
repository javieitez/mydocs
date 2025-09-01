# Icinga - Docker Installation

A docker-compose stack is available at https://github.com/lippserd/docker-compose-icinga

Make sure the server has docker, docker-compose and git installed, then run

~~~ shell
git clone https://github.com/lippserd/docker-compose-icinga.git
cd docker-compose-icinga
docker-compose -p icinga-playground up 
~~~

Icinga Web is provided on port **8080** and you can access the Icinga 2 API on port **5665**. 

The default user of Icinga Web is `icingaadmin` with password `icinga`. 
The default user of the API is `icingaweb` with password `icingaweb`

This stack can also be tested at https://labs.play-with-docker.com/ 
