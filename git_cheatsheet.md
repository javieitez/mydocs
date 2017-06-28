# Commands

```shell
git init 
git status
git add -A
git commit -am “Message”
git diff
``` 

## Commit to Github

* Create a new repo on github. Don't add a .gitignore or choose a license.
```shell
git remote add origin https://github.com/<yourname>/reponame.git
git push -u origin master
```

## BONUS: Add current branch to prompt

To show the current branch on the prompt, add to the top of `.bashrc`

```shell
# ***** add git's current branch to prompt. ******
# we need two functions for this to work: gb to get the current branch and
# git_branch to remove the empty () when not in a gitted dir

# add `git_branch` at any point of PS1 to insert the output

gb() {
        echo -n '(' && git branch 2>/dev/null | grep '^*' | colrm 1 2 | tr -d '\n' && echo  -n ')'
}


git_branch() {
        gb | sed 's/()//'
}
```

also, `export` the PS1 value, or add the `git_branch` function at the end of `.bashrc`'s PS1 line, like

```shell
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] `git_branch`\$ '
```

