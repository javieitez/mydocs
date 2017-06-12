### Naming Conventions

* ID and class names can contain numbers, underscores and hyphens, but cannot start with a number. `1class` is an invalid class name. `class1`, `class_1` and `class-1` are valid.
* Since IDs are unique, they can only have one name. `<div id="name1 name2">`, _name2_ is ignored.
* Classes can have multiple names, in order to combine multiple styles.

As a good practice, stick to functional names (IE: _disabled_ instead of _gray_). Use things like `class="warning"` instead of `class="red"`.
As a good practice, use consistent names across the whole project.

### Targeting 

* Elements are just targeted by name. Like `div {}`
* IDs are preceded by a hash. `#disclaimer {}` matches `<div id="disclaimer">`
* IDs must be unique.
    * Styles on IDs have preference over styles on classes
    * Classes are preferable for formatting. 
    * IDs are better for placing text on a given DIV using JavaScript. 
* Classes are preceded by a dot. `.alert-box {}` matches `<div id="disclaimer" class="alert-box">` 

* `a {}` targets all _a href_ links across the whole project
* `.description-box a p {}` targets all _a href_ links that are inside a p tag that is inside a div (or anything else) that belongs to the class _description-box_
    * declared elements are parsed by the browser from right to left

Styles that are more precisely targeted take priority over generic ones, so the second example on the list above would apply that style to the `a` links that specifically match the criteria, overwriting the generic style. All other `a` links of the project would fit to the generic style.

As a rule of thumb, do NOT declare more than three elemnts at once. Avoid stuff like `.description-box a li p {}` 

#### Nested Targeting

Styles can be nested inside each other, exactly the same way as html tags.

```css
    .microposts {
      list-style: none;
      padding: 0;
      li {
         padding: 10px 0;
         border-top: 1px solid #e8e8e8;
         }
      .user {
         margin-top: 5em;
         padding-top: 0;
         }
      }
```
#### Multiple targeting
```css
    h1, h2, h3, h4, h5, h6 {
      line-height: 1;
    }
```


### 
