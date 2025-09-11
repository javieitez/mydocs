# Test certificate and key

How to check if a certificate matches a private key using the modulus test.

Create a script with the following content

```shell
#!/bin/bash
openssl x509 -noout -modulus -in /path/to/certificate.cer | openssl md5
openssl rsa -noout -modulus -in /path/to/privatekey.key | openssl md5
openssl req -noout -modulus -in /path/to/csr_file.csr | openssl md5
```
`chmod+x` and execute it, it will return a string similar to this for each line
```shell
(stdin)= ccbebcc2a78ff8a36c7b3e0128573c48
```
If the three strings are identical, the csr, certificate and key match.

## Additional info 
https://www.ssl.com/faqs/how-do-i-confirm-that-a-private-key-matches-a-csr-and-certificate/
