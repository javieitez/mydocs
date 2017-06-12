To show the current branch on the prompt, add to the top of `.bashrc`

```shell
git_branch() {
	echo -n '(' && git branch 2>/dev/null | grep '^*' | colrm 1 2 | tr -d '\n' && echo  -n ')'
}
```
also, `export` the PS1 value, or replace `.bashrc`'s PS1 line with
```shell
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] $git_branch\$ '
´´´

