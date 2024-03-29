## Variables
To declare a variable
```bash
VARNAME="value"
```
No spaces around `=`. String values must be quoted.

### Command Output to Variable
```bash
TODAY=$(date)
```
A command inside backticks is expanded as well
```bash
Today is `date`
```
### Compare values
`=` and `==` are for string comparisons

`-eq` is for numeric comparisons, along with `-lt`, `-le`, `-gt`, `-ge`, and `-ne`

### if/else statements
```bash
if [ $myVAR == "something" ]
then
  # do something 
elif [ $myVAR == "something else" ]
then
  # do something else
else
  # all other cases 
fi
```
### Integer between a range
```bash
[[ "$myINPUT" -ge "$myMIN" && "$myINPUT" -le "$myMAX" ]]
```
## Parameter variables
```bash
./myscript.sh param1 param2 param3 
```
`param1`, `param2` and `param3` are stored on `$1`, `$2` and `$3`. And so on...  

### Bundled variables
`$#` returns the number of parameters entered in the command line.

`$?` returns the last exit code.

`$0` returns the name of the script

## Math and logic

### Iteration
`echo number{1,2,3}` returns `number1 number2 number3`
### Math

`echo $[2 + 2]` returns `4`

`echo $[3 * 3]` returns `9` (multiplication)

`echo $[3 ** 3]` returns `27` (exponentiation, as in `3 * 3 * 3`)

`echo $[5/2]` returns `2` (division), while `echo $[5%2]` returns `1` (remainder) 

`myVAR=1 && echo $myVAR` returns `1`

`echo $[++myVAR]` returns `2` (sums 1 *before* returning)

`echo $[myVAR++]` returns `2`, but increases the value of myVAR to `3` (sums 1 *after* returning)

`echo $[--myVAR]` and `echo $[myVAR--]` would substract one, before and after

:warning: Bash bundled math supports only integer operations. For floating point calculations you can use `bc`. 

`echo "2.1 + 2.2" | bc` returns `4.3`

On divisions, the amount of decimals is set with the `scale` parameter.

`echo "scale=1; 5 / 2" | bc` returns `2.5`

`echo "scale=2; 5 / 2" | bc` returns `2.50`

`echo "scale=9; 10 / 3" | bc` returns `3.333333333`

### Logic
`echo $[5==5]`, `echo $[5!=6]` and `echo $[5>=2]` return `1`, meaning `true`

`echo $[5==4]`, `echo $[5!=5]` and `echo $[5<=2]` return `0`, meaning `false`

`||` means `OR`

`&&` means `AND`

`-n` returns true if a variable is not empty (`non-zero` length).

`-z` returns true if a variable is empty (`zero` length). 

`-d` returns true if a dir exists

`-f` returns true if a file exists

`-s` returns true if a file exists and is not empty

`-w` returns true if a file exists and is writable

`-x` returns true if a file exists and is executable

`file1 -nt file2` returns true if file1 is newer than file2. `-ot` for older. 


## Single and Double Quotes
`'Single quotes'` preserve the literal value of everything inside them, including `$` and the backtick. A single quote may not occur between single quotes, not even escaped by `\`.

`"Double quotes"` preserve the literal value of everything inside them, except for `$` and `.`, `\` escapes when preceding special characters, or else is shown literally.
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
