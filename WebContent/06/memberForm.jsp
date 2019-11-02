<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src='/ddit/js/validation.js'></script>
<script type="text/javascript">

	$(function(){
		/* $('#checkId').click(function(){
			event.preventDefault();
			//입력한 값을 가져온다.
			mem_id = $('input[name=mem_id]').val();			
			//요청
			xhr = new XMLHttpRequest();
			xhr.open("get", "/ddit/06/checkId.jsp?mem_id="+mem_id, true);
			xhr.send();
			//응답
			xhr.onreadystatechange = function(){
				if(this.readyState == 4 && this.status == 200){
					res = this.responseText;
				};
				$('#checkMessage').html(res);
			};
		}); */
		$('#checkMessage').text("아이디 중복검사를 수행하십시오.");
		$('form').submit(function(){
			
			if($('#checkMessage').text().trim() == '아이디 중복검사를 수행하십시오.'){
				alert("아이디 중복검사를 하지 않았습니다.");
				return false;
			}
			if($('#checkMessage').text().trim() == '이미 존재하는 아이디입니다.'){
				alert("중복된 아이디로는 가입할 수 없습니다.");
				return false;
			}
			if(!$('input[name=mem_name]').val().validationNM()){
				alert('성명을 바르게 입력해주세요.');
				return false;};//아이디가 바르게 입력되지않아도 alert만 띄우고 submit은 진행될 수 있다. return false로 submit을 통한 서버로의 요청을 막는다
			var regno = $('input[name=mem_regno1]').val() + '-' + $('input[name=mem_regno2]').val();//주민번호가 올바른지(주민번호가 맞는지)부터 확인하는 문장
			if(!regno.validationREGNO()){
				alert('주민번호를 바르게 입력해주세요.');
				return false;}//아이디가 바르게 입력되지않아도 alert만 띄우고 submit은 진행될 수 있다. return false로 submit을 통한 서버로의 요청을 막는다
			var bir = $('input[name=mem_bir1]').val() + '-' + $('input[name=mem_bir2]').val() + '-' + $('input[name=mem_bir3]').val();
			if(!bir.validationBIR()){
				alert('생년월일을 바르게 입력해주세요.');
				return false;}//아이디가 바르게 입력되지않아도 alert만 띄우고 submit은 진행될 수 있다. return false로 submit을 통한 서버로의 요청을 막는다
			if(!$('input[name=mem_id]').val().validationID()){
				alert('아이디를 바르게 입력해주세요.');
				return false;};//아이디가 바르게 입력되지않아도 alert만 띄우고 submit은 진행될 수 있다. return false로 submit을 통한 서버로의 요청을 막는다
			if(!$('input[name=mem_pass]').val().validationPWD()){
				alert('비밀번호를 바르게 입력해주세요.');
				return false;};//아이디가 바르게 입력되지않아도 alert만 띄우고 submit은 진행될 수 있다. return false로 submit을 통한 서버로의 요청을 막는다
			var hometel = $('select[name=mem_hometel1] option:selected').val() + '-' + $('input[name=mem_hometel2]').val() + '-' + $('input[name=mem_hometel3]').val();
			if(!hometel.validationHOMETEL()){
				alert('집 전화번호를 바르게 입력해주세요.');
				return false;};//아이디가 바르게 입력되지않아도 alert만 띄우고 submit은 진행될 수 있다. return false로 submit을 통한 서버로의 요청을 막는다
			if(!'042-000-0000'.validationCOMTEL()){
				alert('회사 전화번호를 바르게 입력해주세요.');
				return false;};//아이디가 바르게 입력되지않아도 alert만 띄우고 submit은 진행될 수 있다. return false로 submit을 통한 서버로의 요청을 막는다
			var hp = $('select[name=mem_hp1] option:selected').val() + '-' + $('input[name=mem_hp2]').val() + '-' + $('input[name=mem_hp3]').val();
			if(!hp.validationHP()){
				alert('휴대폰 번호를 바르게 입력해주세요.');
				return false;};//아이디가 바르게 입력되지않아도 alert만 띄우고 submit은 진행될 수 있다. return false로 submit을 통한 서버로의 요청을 막는다
			var mail = $('input[name=mem_mail1]').val() + '@' + $('select[name=mem_mail2] option:selected').val();
			if(!mail.validationMAIL()){
				alert('메일을 바르게 입력해주세요.');
				return false;};//아이디가 바르게 입력되지않아도 alert만 띄우고 submit은 진행될 수 있다. return false로 submit을 통한 서버로의 요청을 막는다
			if($('input[name=mem_zip1]').val().length == 0 || $('input[name=mem_zip2]').val().length == 0){
				alert('주소를 모두 입력해주세요.');
				return false;
			}
			if($('input[name=mem_add1]').val().length == 0 || $('input[name=mem_add2]').val().length == 0){
				alert('주소를 모두 입력해주세요.');
				return false;
			}
			if($('input[name=mem_like]').val().length == 0 || $('input[name=mem_job]').val().length == 0){
				alert('빈칸을 모두 입력해주세요.');
				return false;
			}
				
				
			$('input[name=mem_bir]').attr('value',$('input[name=mem_bir1]').val() + '-' + $('input[name=mem_bir2]').val() + '-' + $('input[name=mem_bir3]').val());
			$('input[name=mem_hometel]').attr('value', $('select[name=mem_hometel1] option:selected').val() + '-' + $('input[name=mem_hometel2]').val() + '-' + $('input[name=mem_hometel3]').val());
			$('input[name=mem_hp]').attr('value', $('select[name=mem_hp1] option:selected').val() + '-' + $('input[name=mem_hp2]').val() + '-' + $('input[name=mem_hp3]').val());
			$('input[name=mem_mail]').attr('value',$('input[name=mem_mail1]').val() + '@' + $('select[name=mem_mail2] option:selected').val());
			$('input[name=mem_zip]').attr('value', $('input[name=mem_zip1]').val() + $('input[name=mem_zip2]').val());
			$('form[name=memberForm]').append($('<input type="hidden" name="mem_comtel" value="042-000-0000" />'));
			


			
		});
	});
	function idCheck(){
		if(!$('input[name=mem_id]').val().validationID()){
			alert('아이디를 바르게 입력해주세요.');
			return;
		};
		$.ajax({//$(=jQuery) 이용해서 ajax를 사용하겠습니다.
		    type : "POST" //"POST", "GET"
		    , async : true //true, false-> false 하면 동기식으로 변경됨 .(ajax 안 쓴거처럼 됨.)
		    , url : "<%=request.getContextPath()%>/06/checkedID.jsp" //Request URL
		    , data : { mem_id : $('input[name=mem_id]').val() }
		    , dataType : "json" //전송받을 데이터의 타입 
		    , error : function(result) {
		                      alert("code : " + result.status + "\r\nmessage : " + result.reponseText);
		              }
		    , success : function(result) {
		    				// {'flag' : 'true'} or {'flag' : 'false'}
		    				if(eval(result.flag)){
		    					alert("사용할 수 있는 아이디입니다.");
		    				}else{
		    					alert("사용할 수 없는 아이디입니다.");
		    				}
		    			}
		    });
	}
	function zipcodePopup(){
		// 브라우저 document 팝업 : 모달리스 - 활성화된 팝업의 포커스가 자유롭게 이동.
		//						모달 - 활성화된 팝업이 포커스를 점유하며, 해당 팝업이 종료시에만 포커스가 자유롭게 이동.
		var url = '<%= request.getContextPath() %>/06/zipcodeSearch.jsp';
		// location.href = '주소'; // 브라우저 히스토리(요청스택)에 해당 요청 주소가 저장(history back|forward)
		// location.replace('주소'); // 브라우저 히스토리(요청스택)에 해당 요청 주소를 저장하지 않음.
		var options = 'copyhistory=no,width=380px,height=400px,status=no,resizable=no,scrollbars=no';
		window.open(url, '우편번호검색', options);
	}


</script>
</head>
<style>
.fieldName {text-align: center; background-color: #f4f4f4;}
.tLine {background-color: #d2d2d2; height: 1px;}
.btnGroup { text-align: right; }
td {text-align: left; }
#checkMessage{color : red;}
</style>
<body>
<form name="memberForm" action="<%=request.getContextPath()%>/06/insertMemberInfo.jsp" method="post">
		<div id="whydont" style="display : none" >asdafa</div>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr><td rowspan="13" class="pic" colspan="2" style="vertical-align: bottom; width: 150px; text-align: center;">
			<img src="${pageContext.request.contextPath }/image/btn_pic.gif" alt="사진올리기" class="btn" title="인적사항에 올릴 증명	을 검색합니다." 
				style="cursor: pointer;"/><br/>
			<div style="width: 100%" align="center">
				size : 235x315 이하
			</div>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">성 명</td>
		<td>
			<input type="text" name="mem_name" value=""/>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">주민등록번호</td>
		<td>
			<input type="text" name="mem_regno1" size="6" value=""/>
  			<input type="text" name="mem_regno2" size="7" value=""/>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">생년월일</td>
		<td>
				<input type="hidden" name="mem_bir" />
				<input type="text" name="mem_bir1" size="4" value="" />년
				<input type="text" name="mem_bir2" size="2" value="" />월
				<input type="text" name="mem_bir3" size="2" value="" />일
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">아이디</td>
		<td>
			<input type="text" name="mem_id" value="">&nbsp;&nbsp;<b><a href="javascript:idCheck();">[ID 중복검사]</a></b>
			<span id="checkMessage"></span>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">비밀번호</td>
		<td>
			<input type="text" name="mem_pass" value="" /> 8 ~ 20 자리 영문자 및 숫자 사용
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">비밀번호확인</td>
		<td>
			<input type="text" name="mem_pass_confirm" value="" /> 8 ~ 20 자리 영문자 및 숫자 사용
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px;">
	<tr>
		<td class="fieldName" width="100px" height="25">전화번호</td>
		<td>
			<div>
			<input type="hidden" name="mem_hometel"/>
			<select name="mem_hometel1">
				<option value="02">02</option>
				<option value="031">031</option>
				<option value="032">032</option>								        	
				<option value="033">033</option>				        	
				<option value="041">041</option>
				<option value="042">042</option>				        	
				<option value="043">043</option>				        	
				<option value="051">051</option>				        	
				<option value="052">052</option>
				<option value="053">053</option>				        					        	
				<option value="061">061</option>
				<option value="062">062</option>
				<option value="063">063</option>				        					        					        	
				<option value="064">064</option>				        					        					        	
				<option value="070">070</option>				        					        					        	
			</select>	- 	
			<input type="text" name="mem_hometel2" size="4" value="" /> - 
			<input type="text" name="mem_hometel3" size="4" value="" />
			</div>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">핸드폰</td>
		<td>
			<input type="hidden" name="mem_hp"/>
			<select name="mem_hp1">
				<option value="010">010</option>
				<option value="016">016</option>				        	
				<option value="017">017</option>				        	
				<option value="019">019</option>				        	
			</select>	-
			<input type="text" name="mem_hp2" size="4" value="" /> - 
			<input type="text" name="mem_hp3" size="4" value="" />
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">이메일</td>
		<td>
			<input type="hidden" name="mem_mail" />
			<input type="text" name="mem_mail1" value="" /> @
			<select name="mem_mail2">
				<option value="naver.com">naver.com</option>
				<option value="daum.net">daum.net</option>
				<option value="hanmail.net">hanmail.net</option>
				<option value="nate.com">nate.com</option>
				<option value="gmail.com">gmail.com</option>				
			</select>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
		
	<tr>
		<td class="fieldName" width="100px" height="25">주소</td>
		<td>
			<input type="hidden" name="mem_zip" />
			<input type="text" name="mem_zip1" id="mem_zip1" size="3" value="" /> - 
			<input type="text" name="mem_zip2" id="mem_zip2" size="3" value="" />
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" type="button" onclick="zipcodePopup();">우편번호검색</button><br>
			<input type="text" name="mem_add1" id="mem_add1" value="" />
			<input type="text" name="mem_add2" id="mem_add2" value="" />
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">직 업</td>
		<td>
			<input type="text" name="mem_job" value=""/>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">취 미</td>
		<td>
			<input type="text" name="mem_like" value=""/>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr><td colspan="2" height="20"></td></tr>
	
	<tr>
		<td class="btnGroup" colspan="2" >
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn1" type="submit">가입하기</button>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn2" type="reset">취소</button>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn3" type="button">목록</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>








