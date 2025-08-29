## Install CertBot

https://certbot.eff.org/instructions?ws=haproxy&os=centosrhel8

## Register certificate

Run `certbot certonly --standalone` and follow the instructions. You will be prompted to enter the domain name.

## Monitor certificate expiration date

* https://linuxhandbook.com/monitor-ssl-certificates-checkmk/

## Renew certificate

* Certbot automatically renews the certificates before they expire 
* renewal info is located at `/etc/letsencrypt/renewal`

However, the files `fullchain.pem` and `privkey.pem` need to be concatenated for the certificate to be visible to HAProxy, and the HAProxyservice needs to be restarted.

The following script does so
```bash
#!/bin/bash

# init vars
BASEDIR="/etc/letsencrypt/live"
CERTDIR="mycertificate.example.com"

# concatenate pem files
cat $BASEDIR/$CERTDIR/fullchain.pem $BASEDIR/$CERTDIR/privkey.pem > /etc/ssl/$CERTDIR.pem

# Restart HAProxy
systemctl restart haproxy.service
```

Paste the script to `/etc/letsencrypt/renewal-hooks/post/haproxy-ssl-renew.sh` and make it executable

Finally add the following line to the bottom of `/etc/letsencrypt/renewal/mycertificate.example.com.conf`

```ini
post_hook = sudo /etc/letsencrypt/renewal-hooks/post/haproxy-ssl-renew.sh
```