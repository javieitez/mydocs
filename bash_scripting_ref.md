## Variables
To declare a variable
```bash
VARNAME="value"
```
No spaces around `=`. String values must be quoted.

### Command Output to Variable
```bash
variable=$(command)
```
### Compare values

`=` and `==` are for string comparisons

`-eq` is for numeric comparisons, along with `-lt`, `-le`, `-gt`, `-ge`, and `-ne`

### Integer between a range
```bash
[[ "$myINPUT" -ge "$myMIN" && "$myINPUT" -le "$myMAX" ]]
```
## Parameters
```bash
./myscript.sh param1 param2 param3 
```
`param1`, `param2` and `param3` are stored on `$1`, `$2` and `$3`. And so on...  

### Bundled variables
`$#' returns the number of parameters entered in the command line.
`$?` returns the last exit code.
`$0`returns the name of the script

## Backticks, Single and Double Quotes
Text inside backticks is executed like a command, similar to `$(command)`
```bash
echo "The content of this folder is `ls`"
```
`'Single quotes'` preserve the literal value of everything inside them, including `$` and `. A single quote may not occur between single quotes, not even escaped by `\`.
`"Double quotes"` preserve the literal value of everything inside them, except for `$` and `. `\` escapes when preceding special characters, or else is shown literally.
```bash
echo "Double quotes can contain \"escaped double quotes\""
```
```bash
echo "'single quotes' are taken literally inside double quotes"
echo 'and "the other way around"'
```
## Further reading
* https://tldp.org/LDP/Bash-Beginners-Guide/html/Bash-Beginners-Guide.html
* https://tldp.org/LDP/abs/html/
