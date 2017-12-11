### Declare a variable

The type is automatically detected. This one is numeric

```javascript
var myInteger = 5;
console.log(myInteger * 5);
```

This one is text
```javascript
var mySentence = "All work and no play makes jack a dull  boy";
console.log(mySentence);
```

### Create a function
```javascript
function say(y) {console.log(y)}; 
var mySentence = "All work and no play makes jack a dull  boy";

  say(mySentence);
```

### Declare a variable that contains a function
```javascript
var say = function(y) {console.log(y)}; 
var mySentence = "All work and no play makes jack a dull  boy";

say(mySentence);
```

### Create a FOR loop

for(initial value; until value; increment)

```javascript
var say = function(y) {console.log(y)}; 
var mySentence = "All work and no play makes jack a dull  boy";

for (i = 0; i <50; i++ ) {
  say(mySentence);
}
```
