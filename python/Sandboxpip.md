## Create a Python Sandboxed environment in Debian
Some common methods:
* `virtualenv`/`venv`: Simple and effective for isolating Python packages.
* `pipx`: Great for isolating Python CLI applications.
* `Docker`: Provides full isolation, including filesystem and network.
* `Firejail`: Lightweight sandboxing for running applications.
* `chroot`: Filesystem isolation for more advanced use cases.


### Using `venv`
`virtualenv` and `venv` are tools to create isolated Python environments. They allow you to install Python packages in an isolated directory, separate from the system-wide Python installation.

Install `venv`
     ```bash
     sudo apt-get install python3-venv
     ```
Create a virtual environment
     ```bash
     python3 -m venv myenv
     ```
Activate the virtual environment
   ```bash
   source myenv/bin/activate
   ```
Install packages within the virtual environment
   ```bash
   pip install somepackage
   ```
Deactivate the virtual environment when done
   ```bash
   deactivate
   ```
### Using `pipx`
`pipx` is a tool to install and run Python applications in isolated environments, useful for installing Python CLI applications.

   ```bash
   sudo apt-get install pipx
   ```
Ensure `pipx` is in your PATH:
   ```bash
   pipx ensurepath
   ```
Install a Python application in an isolated environment
   ```bash
   pipx install somepackage
   ```
### Using `Docker`
Install Docker
   ```bash
   sudo apt-get update
   sudo apt-get install docker.io
   ```
Pull a Python image:
```bash
sudo docker pull python:3.9-slim
```
Run a Python container:
```bash
sudo docker run -it --rm python:3.9-slim bash
```
Install packages within the container:
```bash
pip install somepackage
```
Exit the container when done:
```bash
exit
```
### Using `Firejail`
`Firejail` is a SUID program that reduces the risk of security breaches by restricting the running environment of untrusted applications.
#### Steps:
Install `Firejail`:
```bash
sudo apt-get install firejail
```
Run Python in a sandboxed environment:
```bash
firejail python3
```
Install packages within the sandboxed environment:
```bash
pip install somepackage
```
### Using `chroot`
`chroot` changes the root directory for a process and its children, providing filesystem isolation.

Create a new directory for the chroot environment:
```bash
sudo mkdir /chrootenv
```
Install necessary files and binaries:
```bash
sudo debootstrap stable /chrootenv http://deb.debian.org/debian
```
Chroot into the new environment:
```bash
sudo chroot /chrootenv
```
Install Python and packages within the chroot environment:
```bash
apt-get install python3
pip install somepackage
```
Exit the chroot environment when done:
```bash
exit
```
