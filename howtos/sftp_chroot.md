Create a group for SFTP only access

```bash
groupadd sftponly
```
Create a user

```bash
useradd -g sftponly -s /sbin/nologin -m -d /SFTP/sftpuser sftpuser
```
and give it a password
```bash
passwd username
```
The user's home and all the way up must have `755` permissions and be owned by `root:anygroup`
Under the user's home, a folder named `upload` must exist with the same permissions and owner 

e.g: for a home located at `/SFTP/users/sftpuser`

```bash
chown root /SFTP/
chown root /SFTP/users/
chown root /SFTP/users/sftpuser
chown root /SFTP/users/sftpuser/upload
chmod 755 /SFTP/
chmod 755 /SFTP/users/
chmod 755 /SFTP/users/sftpuser
chmod 755 /SFTP/users/sftpuser/upload
```
`vim /etc/ssh/sshd_config` and add at the bottom
```conf
# override default of no subsystems
Subsystem       sftp    /usr/libexec/openssh/sftp-server

Match Group sftponly
ChrootDirectory /SFTP/users/%u
ForceCommand internal-sftp
```
reload ssh settings with `systemctl reload sshd`

Further users only need to be added to the `sftponly` group and have their home folder under the right path with `755` permission. 
