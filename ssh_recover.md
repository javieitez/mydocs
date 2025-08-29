## Recover an SSH session 
### tmux
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

### screen
run

```bash
$ screen
$ make (something huge)
```
You can close the window or dettach the screen session with _Ctrl+A+D_ and the command will keep running in the background. 

To reattach the session again, run

```bash
$ screen -r
```
If there are more than one session dettached, list all of them with ```screen -ls``` and then reattach a specific one with ```screen -r (sessionID)```
