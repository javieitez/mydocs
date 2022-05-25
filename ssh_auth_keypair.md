## SSH Authentication with keys

Let's assume the following scenario: ServerA and ServerB need to be able to talk to each other through SSH without asking for passwords.

## Create and share keys 

Login to ServerA and run
```
ssh-keygen
```
After the key pair is generated, run 
```
ssh-copy-id -i .ssh/id_rsa.pub user@ServerB
```
Repeat the operation in ServerB, pointing to ServerA

## Manually add the key
The content of each public key is stored in `∼/.ssh/authorized_keys`, one per line and in plain text. 

You can manually copy and paste a key if `ssh-copy-id` fails for any reason

## Source
https://www.redhat.com/sysadmin/configure-ssh-keygen
