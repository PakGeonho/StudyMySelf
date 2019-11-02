/**
 * 
 */
String.prototype.validationBUYERID = function(){
	return /^P[0-9]{5}$/.test(this);
};
String.prototype.validationBUYERLGU = function(){
	return /^P[0-9]{3}$/.test(this);
};
String.prototype.validationBUYERNAME = function(){
	return /^[가-힣]{2,4}$/.test(this);
};
String.prototype.validationBUYERTEL = function(){
	return /^0\d{1,2}-\d{3,4}-\d{4}$/.test(this);
};
String.prototype.validationBUYERMAIL = function() {
	return /^\w+@[a-z]+(\.[a-z]+){1,2}$/.test(this);
};