## Overview 

Seems obvious, but `Promises` need to be declared first, otherwise they would be just regular functions

```javascript
var doThisfirst = function(){
var promise = new Promise(function(resolve, reject) {
  //things to do in the first place
}}
```
In order to be recognized as a promise by the next `.then` block, it must return a promise in the end. 
Otherwise, it throws an undefined error

```javascript
var doThisfirst = function(){
var promise = new Promise(function(resolve, reject) {
  //things to do in the first place

  return promise; 
}}
```
it also needs to return a `resolve` message in order to trigger the next action, so in the end the code would be 

```javascript
var doThisfirst = function(){
var promise = new Promise(function(resolve, reject) {
  //things to do in the first place
  
  resolve('it went fine');
  return promise; 
}}
```


https://www.codingame.com/playgrounds/347/javascript-promises-mastering-the-asynchronous/chaining-the-promises


## Add a promise inside a function 

```javascript
function whatEver() {
	return new Promise(function(resolve, reject){
		
    //Do Something
    resolve('It went well');
    
      })}
```
For example, you can add a FETCH query (which is a promise in itself) and wait for it to finish until returning the resolve code.

```javascript
function fetchAndWait() {
	return new Promise(function(resolve, reject){
		fetch(someUrl, initObject)
		.then(function (response) {
			if (response.ok) {
				resolve('OK, logged out');
			}})
      })}
```
