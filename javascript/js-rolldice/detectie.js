// Detect Internet Explorer 6-11 and throw an error if found
var isIE = /*@cc_on!@*/false || !!document.documentMode;
var IEerrmsg = 'This app won\'t work on Internet Explorer. \r Please use a modern browser with JS capabilities.'
if (isIE == true) {
	alert(IEerrmsg);}
