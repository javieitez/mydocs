# Working with dates

`/\d\d[\/|\-]\d\d[\/|\-]\d\d\d\d/g` would return any date in any of the followng formats

* MM/DD/YYYY
* DD/MM/YYYY
* MM-DD-YYYY
* DD-MM-YYYY

```javascript
var myMsg = "Departure date would be 12/18/2018 or 12-18-2019";
var findDates = /\d\d[\/|\-]\d\d[\/|\-]\d\d\d\d/gi;

myMsg.match(findDates);
//returns [ '12/18/2018', '12-18-2019' ]
```
