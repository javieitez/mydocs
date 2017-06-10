To show the current branch on the prompt, add to .bashrc

    PS1='\[\033[01;32m\]${C9_USER}\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 " (%s)") $ '
