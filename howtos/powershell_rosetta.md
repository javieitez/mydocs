Popular Linux commands and their powershell equivalents
|Linux Command| Powershell Command|
|---|---|
|`curl ifconfig.me`|`Invoke-RestMethod https://ifconfig.me/ip`|
|`cat ./filename.txt`|`Get-Content ./filename.txt`|
|`tail ./filename.txt`|`Get-Content -Tail 7 ./filename.txt`|
|`tail -f ./filename.txt`|`Get-Content -wait -tail 7 ./filename.txt`|
|`head ./filename.txt`|`Get-Content -Head 7 ./filename.txt`|
|`uname -a`|`Get-CimInstance Win32_OperatingSystem \| Select-Object $Properties \| Format-Table -AutoSize`|
|`grep mystring ./filename.txt`|`Select-String -Path './filename.txt' -Pattern 'mystring'`|

**Note** on `grep`: Most of the times, Powershell commands return **objects** instead of text, so there is no grepping pipeline equivalent to a traditional bash output. 

