## Set a default value to a variable 
When a task returns the following
```
The task includes an option with an undefined variable
```
You can set a non-existing variable to a default value with
```yaml
{{ myvariable | default('This is the default value') }}
```
The default only applies if the variable was undefined. Otherwise, it will keep the original value. I.E: This is useful when different hosts return different facts.
