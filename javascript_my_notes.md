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

Once defined, a function can be called in other JavaScript functions

```javascript
function doTwice(a) {
  return a + a;
}

function doFourTimes(b){
  return doTwice(b) + doTwice(b);
}

console.log(doTwice(5));
console.log(doFourTimes(5));
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
### Create a WHILE loop

The counter must be declared before the loop
```javascript
var i = 0;

while (i < 50) {
    console.log("The number is " + i);
    i++;   
}
```
