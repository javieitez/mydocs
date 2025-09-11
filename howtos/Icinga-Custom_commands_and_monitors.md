{{>toc}}
# Add a custom command

edit `/etc/icinga2/conf.d/commands.conf`

the following example creates a generic check for Widows hosts running NSClient++, use it as a template.

```conf
object CheckCommand "check_winnt" {
  command = [ PluginDir + "/check_nt"]
  
  arguments = {
    "-H" = "$nt_address$"
    "-p" = "$nt_port$"
    "-s" = "$nt_pass$"
    "-v" = "$nt_value$"
    "-l" = "$nt_local$" 
    "-w" = "$nt_warning$"
    "-c" = "$nt_critical$"
    "-d" = "$nt_detail$"
  }
vars.nt_address = "$address$"  
}
```
The variable `$nt_address$` is automatically filled with the value of `$address$`, which must contain the host IP address or a resolvable name.

The remaining variables are used in the check monitor and, when filled, are passed as a parameter.

The following check creates a monitor for the C: drive of a Windows Host. It returns warning when 80% of the drive's capacity is reached, critical at 90%.

```conf
object Service "C Drive free space" {
  host_name = "WinDev11"
  check_command = "check_winnt"
  
  vars.nt_value = "USEDDISKSPACE"
  vars.nt_local = "C"
  vars.nt_port = "12489"
  vars.nt_pass = "mypassword"
  vars.nt_warning = "80"
  vars.nt_critical = "90"
  }
```
This one creates a memory usage monitor
```conf
object Service "RAM usage" {
  host_name = "WinDev11"
  check_command = "check_winnt"
  
  vars.nt_value = "MEMUSE"
  vars.nt_port = "12489"
  vars.nt_pass = "mypassword"
  vars.nt_warning = "80"
  vars.nt_critical = "90"
  }
```
The following check monitors the CPU load. The warning and critical thresholds are included in the variable `$nt_local$` and therefore, ommited in the check and not passed as parameters.
```conf
  object Service "CPU Load" {
  host_name = "WinDev11"
  check_command = "check_winnt"
  
  vars.nt_value = "CPULOAD"
  vars.nt_local = "60,90,95,120,90,95"
  vars.nt_port = "12489"
  vars.nt_pass = "mypassword"
  }
```

# Monitor a Windows Service

The `check_nt` plugin can be used to monitor the status of a Windows service by passing the parameters `-v SERVICESTATE` and `-l SERVICE_NAME`

&#128220; You can get the service names and statuses by typing `Get-Service` in a powershell prompt.


```conf
    object Service "SSHD Windows services" {
  host_name = "WinDev11"
  check_command = "check_winnt"
  
  vars.nt_value = "SERVICESTATE"
  vars.nt_local = "SSHD,SSH-AGENT"
  vars.nt_port = "12489"
  vars.nt_pass = "mypassword"
  vars.nt_detail = "SHOWALL"
  }
```
