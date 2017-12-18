# Basic Stuff
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

 * All variables declared outside of a function are **global**.
 * Functions can overwrite the value of a global variable. 

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

# Functions
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
Function names must **not** be declared inside of `{...}`blocks.

### Function arguments

We can pass multiple arguments to a function, like `function functionName(a, b)`.
```javascript
var sum = function (a, b) {
    return a + b;
}

console.log(sum(2,2))
```

If we specify 2 arguments, all parameters beyond the 2nd are ignored. Therefore `sum(2, 2, 2)` would return 4 and not 6. 

We can specify any number of arguments, like `sum(a, b, c, d)` or iterate through an undetermined number of them by using the `arguments.length` property, in array-style. 

```javascript
var sumall = function() { 
  var i, total =0;
  for (i = 0; i < arguments.length; i +=1) {
    total += arguments[i]
  }
  console.log(arguments.length)
  return total;
}; 


console.log(sumall(2,2,2,5,9));
```


### IF/ELSEIF/ELSE statements

Syntax is `if (condition1) {code} else if (condition2) {code} else {code}`, with as many conditions as needed. 

```javascript
var d = new Date()
var t = d.getHours()
var say = function(y) {console.log(y)}; 

if (t <= 6){
  say("Too soon to get up");}
else if (t <= 12 ){
  say("It's AM");} 
else if (t >=13 && t < 22 ){
  say("It's PM");}
else {
  say("Go the fuck to sleep");}
```

### IIFE functions

**IIFE** stands for **Immediately Invoked Function Expression**. The pattern would be 

```javascript
(function functionName(){ /* code */ })();
```
# Methods
### String methods

Methods can be appended to any string. `match("string")` returns a matching string    
```javascript
"abcdefghijk".match("bcd")
//returns [ 'bcd', index: 1, input: 'abcdefghijk' ]
```
It works the same any with variable containing a string
```javascript
var sampleStr = "abcdefghijk"
sampleStr.match("d")
// returns [ 'd', index: 3, input: 'abcdefghijk' ]
```

