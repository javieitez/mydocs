# Variables
To declare a variable
```bash
VARNAME="value"
```
No spaces around `=`. String values must be quoted.

### Command Output to Variable
```bash
variable=$(command)
```
## Compare values

`=` and `==` are for string comparisons

`-eq` is for numeric comparisons, along with `-lt`, `-le`, `-gt`, `-ge`, and `-ne`

### Integer between a range

```bash
[[ "$myINPUT" -ge "$myMIN" && "$myINPUT" -le "$myMAX" ]]
```
## 
