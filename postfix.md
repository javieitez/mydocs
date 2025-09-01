**Postfix Commands**

View mail queue
```
mailq
```
Process the entire send queue
```
postqueue -f
```
Delete a mail from the queue
```
postcat -d [MAIL_ID]
```
Delete all mail from the queue
```
postsuper -d ALL
```
Delete all deferred mail
```
postsuper -d ALL deferred
```
Sort and count all emails from a source IP or email account
```
postqueue -p | awk '/^[0-9,A-F]/ {print $7}' | sort | uniq -c | sort -n
```
Delete all emails sent by a specific email account
```
postqueue -p | grep '^[A-Z0-9]' | grep no-reply@mydomain.com | cut -f1 -d' ' | tr -d \* | postsuper -d -
```
Delete all emails sent by a domain
```
postqueue -p | grep '^[A-Z0-9]' | grep @mydomain.com | cut -f1 -d' ' | tr -d \* | postsuper -d -
```
To stop, start, and check the status of the postfix service, use `systemctl`
```
systemctl stop postfix
systemctl start postfix
systemctl status postfix
```
Output log
```
tail -f /var/log/mail.log
```
`postfix stop`: Stops all Postfix processes, including the MTA and other services.
`postfix start`: Starts all Postfix processes.
`postfix flush`: Flushes the mail queue, attempting to deliver all queued messages. After this, Postfix will stop processing new messages until resumed.
`postfix resume`: Resumes mail processing after using `postfix flush`.
