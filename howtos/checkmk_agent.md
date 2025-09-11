# Package Installation

Download the agent package from your checkmk server and upload it to the host

## Debian/Ubuntu

Upload the file `check-mk-agent_2.0.0p7-1_all.deb` and install the package with ` dpkg`

~~~ bash
dpkg -i check-mk-agent_2.0.0p7-1_all.deb
~~~ 

## Redhat
Upload the file `check-mk-agent-2.0.0p7-1.noarch.rpm` and install the package with `rpm` 

~~~ bash
rpm -U check-mk-agent-2.0.0p7-1.noarch.rpm 
~~~

## Open the firewall port in linux server.

~~~ bash
firewall-cmd --zone=trusted --permanent --add-port=6556/tcp
firewall-cmd --zone=public --permanent --add-port=6556/tcp
firewall-cmd --reload
~~~

## Test the installation
check if the agent is running in the server.
~~~ bash
telnet localhost 6556 | grep check_mk
~~~

It will will return something similar to this

~~~ bash
<<<check_mk>>>
AgentDirectory: /etc/check_mk
DataDirectory: /var/lib/check_mk_agent
SpoolDirectory: /var/lib/check_mk_agent/spool
PluginsDirectory: /usr/lib/check_mk_agent/plugins
LocalDirectory: /usr/lib/check_mk_agent/local
check_mk@.service static
check_mk.socket enabled
~~~

For rpm or deb based installation, go to [[CHECKMK_Install_agent_in_linux_server]]

# Manual Installation

Download the following files from http://yourcheckmk.server/yoursite/check_mk/wato.py?mode=download_agents_linux

* check_mk_agent.linux
* xinetd.conf

upload them to the Linux Server, then run 

``` shell
cp check_mk_agent.linux /usr/bin/check_mk_agent
chmod +x /usr/bin/check_mk_agent
cp xinetd.conf /etc/xinetd.d/check_mk
systemctl restart xinetd.service
systemctl status xinetd.service
```
Test the installation with 
```bash
telnet localhost 6556 | grep check_mk
```
must return 

```
<<<check_mk>>>
AgentDirectory: /etc/check_mk
DataDirectory: /var/lib/check_mk_agent
```
