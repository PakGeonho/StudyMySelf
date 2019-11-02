/**
 * var value = "가나다"; => value는 자동으로 String값이 된다.
 * value.contains('나'); => value 안에 '나'라는 글자가 있으면 true, 없으면 false 반환.
 * value.length();
 * 
 * "a001".validationID()
 * 정규식 패턴 작성 : http://ryanswanson.com/regexp/#start
 * 
 *  ----------------이상이 자바스크립트의 기본 제공 기능---------------------
 *  우리가 본문에 정규식을 만들어서 기능을 사용할 것.
 */
String.prototype.validationID = function(){
   //this = a001
   return /^[a-z][0-9]{3}$/.test(this);//추출 가능하면 true, 아니면 false 반환.
};    
String.prototype.validationPWD = function(){
	return /^[0-9a-z]{4,8}$/.test(this);
};
String.prototype.validationNM = function(){
	return /^[가-힣]{2,3}$/.test(this);
};
String.prototype.validationREGNO = function(){
	//'111111-1111118' => 실제로 유효한 test용 주민번호
	//	1 1 1 1 1 1 - 1 1 1 1 1 1 =>마지막은 끊는다.
	//  * * * * * *   * * * * * *
	//  2+3+4+5+6+7 + 8+9+2+3+4+5 = 연산결과 = 매직넘버
	//	(11-(연산결과 % 11)) % 10 = 최종값
	//	if(최종값 == 매직넘버) 유효한 주민등록번호
	var noneBar = this.replace('-','');
	var regnum = 0;
	var temSum = 0;
	var magicNum = Number(noneBar.substr(noneBar.length -1));
	var noMagicNum = noneBar.substr(0,noneBar.length-1);
	var j = 2;
	for(i = 0 ; i < noneBar.length-1 ; i++ ){
		regnum = Number(noMagicNum.charAt(i));
		if(i<=7) temSum += regnum * (i+2);
		else temSum += regnum * (j++);
	}
	res = false;
	if(magicNum == (11-(temSum)%11)%10) res = true;
	return res;
};
String.prototype.validationBIR = function(){
	return /^(19[0-9][0-9]|20\d{2})-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/.test(this);
};
String.prototype.validationHOMETEL = function(){
	return /^0\d{1,2}-\d{3,4}-\d{4}$/.test(this);
};
String.prototype.validationCOMTEL = function(){
	return /^0\d{1,2}-\d{3,4}-\d{4}$/.test(this);
};
String.prototype.validationHP = function(){
	return /^01(0|1|6|7|8|9)-\d{4}-\d{4}$/.test(this);
};
// \w == [0-9a-zA-Z]
// + == 1번 이상 반복(반복 회수 무제한)
// \. == 키보드로 입력 가능한 문자 한개
// \ == 이스케이프문자 = 예약 문자를 일반 문자로 바꿔줌
String.prototype.validationMAIL = function() {
	return /^\w+@[a-z]+(\.[a-z]+){1,2}$/.test(this);
};
String.prototype.validationDONG = function() {
	return /^[가-힣]{2,6}$/.test(this);
};