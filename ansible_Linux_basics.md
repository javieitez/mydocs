### SSH configuration
On the Ansible control node, generate a SSH key pair 
```bash
ssh-keygen
```
then copy it to each managed node, in order to avoid SSH asking for passwords.

From the control node, run
```bash
ssh-copy-id -i .ssh/id_rsa.pub [name]@[host]
```
Repeat for each managed node

Test each node to make sure it doesn't prompt for password and to remove the first time confirmation message
```
ansible all -m ping
```

### Playbook usage
Run
```bash
ansible-playbook playbook.yml -i hosts -K
```
* `-i hostsfile`  points to the inventory file 
  * Alternatively, you can use `-l` and specify a subset of hosts
* `-K` asks for BECOME (sudo) password
  * passwords should only used for labs and debugging, production environments must avoid hardcoded passwords at all costs

### Ping all hosts

```
ansible -i <my-inventory> all -m ping
```

### Retrieve Facts
Get a list of all the available facts for a given host
```
ansible -m setup <hostname>
```

### Run a command 
```
ansible <hostname> -m shell -a 'command'
```
#### Example commands
Count how many `*.gitam` files exist on each server
``` shell
ansible all -m shell -a 'ls /var/opt/*.gitam| wc -l'
```
Quick overview of each server's architecture
``` shell
ansible all -m shell -a 'uname -a'
```
