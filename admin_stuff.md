
### Recover an SSH session using tmux

First run tmux and execute a command inside the TMUX session
```bash
$ tmux
$ make (something huge)
```

Let's say the connection fails for some reason, or you just closed the SSH window without finishing the session. SSH back to the host and run

```bash
$ tmux ls
0: 1 windows (created Tue Aug 23 12:39:52 2017) [103x30]

$ tmux attach -t 0
```
You're back in the tmux sesion
