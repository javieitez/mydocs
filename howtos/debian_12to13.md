First, upgrade everything
```
sudo apt update && sudo apt full-upgrade -y
```
As `root` , edit the `sources` files, replacing all `bookworm` ocurrences with `trixie`
```
sed -i 's/bookworm/trixie/g' /etc/apt/sources.list
sed -i 's/bookworm/trixie/g' /etc/apt/sources.list.d/*.list
```
Upgrade again, but the minimal packages
```
sudo apt update && sudo apt upgrade --without-new-pkgs
```
Upgrade again, now everything else and removing old packages. It will ask you to replace some files, review and answer carefully.
```
sudo apt full-upgrade --autoremove -y
```
Remove any remainings from the old setup
```
sudo apt --purge autoremove -y
sudo apt autoclean
```

Finally, `reboot`

