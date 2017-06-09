* Elements are just named. Like `div {}`
* IDs are preceded by a hash. `#disclaimer {}` matches `<div id="disclaimer">`
* IDs must be unique.
    * Styles on IDs have preference over styles on classes
    * Classes are preferable for formatting. 
    * IDs are better for placing text on a given DIV using JavaScript. 
* Classes are preceded by a dot. `.alert-box {}` matches `<div id="disclaimer" class="alert-box">` 

### Naming Conventions

* ID and class names can contain numbers, underscores and hyphens, but cannot start with a number. `1class` is an invalid class name. `class1`, `class_1` and `class-1` are valid.
* Since IDs are unique, they can only have one name. `<div id="name1 name2">`, _name2_ is ignored.
* Classes can have multiple names, in order to combine multiple styles.

As a good practice, stick to functional names (IE: _disabled_ instead of _gray_). Use things like `class="warning"` instead of `class="red"`.
As a good practice, use consistent names across the whole project.

