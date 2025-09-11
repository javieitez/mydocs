## Create a systemd service

Create a file named `/etc/systemd/system/myservice.service`

```ini
[Unit]
Description=Description of my service
After=network.target
StartLimitIntervalSec=0
[Service]
Type=simple
Restart=always
RestartSec=1
User=myuser
ExecStart=/path/to/my/script

[Install]
WantedBy=multi-user.target
```
That’s it. There's no need to `chmod` it to apply any special permissions.

We can now start the service:
```
systemctl start myservice
```

## More information
* https://medium.com/@benmorel/creating-a-linux-service-with-systemd-611b5c8b91d6
* https://www.ibm.com/support/pages/db2-enable-red-hat-systemctl-service-starting-and-stopping-db2-automatically
* https://www.freedesktop.org/wiki/Software/systemd/
