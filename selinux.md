### Get Status
```bash
getenforce
```
It returns `Enforcing` or `Permissive`

### Temporarily Change Status 

* `setenforce 0` to disable
* `setenforce 1` to enable 

Changes are reset on next reboot

### Permanently change status

`vim /etc/selinux/config` and change the value of `SELINUX=` 

It can take one of these three values:
* `enforcing` - SELinux security policy is enforced.
* `permissive` - SELinux prints warnings instead of enforcing.
* `disabled` - No SELinux policy is loaded.

A reboot is required for the changes to take effect. You can use `setenforce` to change the status until then.
