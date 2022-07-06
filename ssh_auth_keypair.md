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

## Troubleshooting 
If it still asks for a password, `tail -f /var/log/secure` on the server.

The user's home folder's permissions must be 700, otherwise the key is rejected and SSH prompts for password.

## Sources
* https://www.redhat.com/sysadmin/configure-ssh-keygen
* https://chemicloud.com/kb/article/ssh-authentication-refused-bad-ownership-or-modes-for-directory/
