## Create a Python Sandboxed environment in Debian
Some common methods:
- **`virtualenv`/`venv`**: Simple and effective for isolating Python packages.
- **`pipx`**: Great for isolating Python CLI applications.
- **`Docker`**: Provides full isolation, including filesystem and network.
- **`Firejail`**: Lightweight sandboxing for running applications.
- **`chroot`**: Filesystem isolation for more advanced use cases.


### 1. **Using `virtualenv` or `venv`**
`virtualenv` and `venv` are tools to create isolated Python environments. They allow you to install Python packages in an isolated directory, separate from the system-wide Python installation.

1. **Install `virtualenv` or `venv`:**
   - For `virtualenv`:
     ```bash
     sudo apt-get install python3-virtualenv
     ```
   - For `venv` (included in Python 3.3+):
     ```bash
     sudo apt-get install python3-venv
     ```
2. **Create a virtual environment:**
   - Using `virtualenv`:
     ```bash
     virtualenv myenv
     ```
   - Using `venv`:
     ```bash
     python3 -m venv myenv
     ```
3. **Activate the virtual environment:**
   ```bash
   source myenv/bin/activate
   ```
4. **Install packages within the virtual environment:**
   ```bash
   pip install somepackage
   ```
5. **Deactivate the virtual environment when done:**
   ```bash
   deactivate
   ```

### 2. **Using `pipx` for Isolated Application Installation**
`pipx` is a tool to install and run Python applications in isolated environments. It is useful for installing Python CLI applications.

#### Steps:
1. **Install `pipx`:**
   ```bash
   sudo apt-get install pipx
   ```
2. **Ensure `pipx` is in your PATH:**
   ```bash
   pipx ensurepath
   ```
3. **Install a Python application in an isolated environment:**
   ```bash
   pipx install somepackage
   ```
### 3. **Using `Docker` for a Fully Sandboxed Environment**
1. **Install Docker:**
   ```bash
   sudo apt-get update
   sudo apt-get install docker.io
   ```
2. **Pull a Python image:**
   ```bash
   sudo docker pull python:3.9-slim
   ```
3. **Run a Python container:**
   ```bash
   sudo docker run -it --rm python:3.9-slim bash
   ```
4. **Install packages within the container:**
   ```bash
   pip install somepackage
   ```
5. **Exit the container when done:**
   ```bash
   exit
   ```
### 4. **Using `Firejail` for Application Sandboxing**
`Firejail` is a SUID program that reduces the risk of security breaches by restricting the running environment of untrusted applications.
#### Steps:
1. **Install `Firejail`:**
   ```bash
   sudo apt-get install firejail
   ```
2. **Run Python in a sandboxed environment:**
   ```bash
   firejail python3
   ```
3. **Install packages within the sandboxed environment:**
   ```bash
   pip install somepackage
   ```
### 5. **Using `chroot` for Filesystem Isolation**
`chroot` changes the root directory for a process and its children, providing filesystem isolation.

#### Steps:
1. **Create a new directory for the chroot environment:**
   ```bash
   sudo mkdir /chrootenv
   ```
2. **Install necessary files and binaries:**
   ```bash
   sudo debootstrap stable /chrootenv http://deb.debian.org/debian
   ```
3. **Chroot into the new environment:**
   ```bash
   sudo chroot /chrootenv
   ```
4. **Install Python and packages within the chroot environment:**
   ```bash
   apt-get install python3
   pip install somepackage
   ```
5. **Exit the chroot environment when done:**
   ```bash
   exit
   ```
