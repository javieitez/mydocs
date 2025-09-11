## Set a default value to a variable 
When a task returns the following
```
The task includes an option with an undefined variable
```
You can set a non-existing variable to a default value with
```yaml
{{ myvariable | default('This is the default value') }}
```
The default only applies if the variable was undefined. Otherwise, it will keep the original value. I.E: This is useful when different hosts return different facts.

## Use external vars file

### Unencrypyted file
Create an external yml file with variables

```yaml
---
my_var: value
my_var2: value2
my_varfoo: valuefoo
my_varspam: valuespam

```
Place a reference in your playbook

```yaml
  vars_files:
    -  vars_dir/my_vars_file.yml
```
### Encrypyted file
> &#128161; Be sure to have `export EDITOR=vim` in `~/.bashrc`

Same as before, but use `ansible-vault` to create the file 
```shell
ansible-vault create vars_dir/my_secret_file.yml
```
or to edit it
```shell
ansible-vault edit vars_dir/my_secret_file.yml
```
When running the playbook, use the `--ask-vault-password` flag
