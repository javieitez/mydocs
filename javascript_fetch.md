## Overview

**fetch** replaces the old **xmlhttprequest** and is supposed to provide a simpler and more modern way to interact with external resources

## Usage

```javascript
fetch(method, url, [headers])
```
If ommitted, **method** defaults to **GET**. This allows us to create a fetch request in it's simplest form

```javascript
fetch('https://example.com/api')
```
headers must be declared once. 

```javascript
fetch('https://example.com/api', {
  headers: new Headers({
    'Content-Type': 'application/json'
  })
```
After that,header content can only be appended 
