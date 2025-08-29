### Fix locale warnings

first run
```bash
$ sudo locale-gen "en_US.UTF-8"
Generating locales...
  en_US.UTF-8... done
Generation complete.

$ sudo dpkg-reconfigure locales
Generating locales...
  en_US.UTF-8... up-to-date
Generation complete.
```

then edit `/etc/environment` and add
```bash
LC_ALL=en_US.UTF-8
LANG=en_US.UTF-8
```
