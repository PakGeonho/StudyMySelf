<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="org.apache.catalina.tribes.membership.MemberImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%
	String mem_id = request.getParameter("mem_id");

	Map<String, String> params = new HashMap<String, String>();
	
	params.put("mem_id", mem_id);
	
	IMemberService service = IMemberServiceImpl.getInstance();
	MemberVO memberInfo = service.memberInfo(params);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.fieldName {text-align: center; background-color: #f4f4f4;}
.tLine {background-color: #d2d2d2; height: 1px;}
.btnGroup { text-align: right; }
td {text-align: left; }
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function(){
		
		$('select[name=mem_hp1] option[value=<%= memberInfo.getMem_hp().split("-")[0]%>]').prop("selected",true);
		$('select[name=mem_hometel1] option[value=<%= memberInfo.getMem_hometel().split("-")[0]%>]').prop("selected",true);

		$('#btn3').click(function(){
			$(location).attr('href','<%= request.getContextPath() %>/06/deleteMemberInfo.jsp?mem_id=<%=memberInfo.getMem_id()%>');
		});
		$('#btn4').click(function(){
			$(location).attr('href','<%= request.getContextPath() %>/06/main.jsp?contentPage=/06/memberList.jsp');
		});
		var aaa = 0;
		aa = $('select[name=mem_mail2] option');
		for(var i = 0 ; i < aa.length ; i++){
			if('<%=memberInfo.getMem_mail().split("@")[1]%>' == $('select[name=mem_mail2] option').eq(i).val()) aaa++;
		};
		if(aaa == 0){
			res = $('<option value="<%= memberInfo.getMem_mail().split("@")[1]%>" selected><%= memberInfo.getMem_mail().split("@")[1]%></option>');
			$('select[name=mem_mail2]').append(res);
		} else{
			$('select :selected').prop('selected', false);
			$('select[name=mem_mail2] option[value=<%= memberInfo.getMem_mail().split("@")[1]%>]').prop("selected",true);
		}
		$('input[name=mem_bir]').attr('value',<%= memberInfo.getMem_bir().split("-")[0] + "-" +memberInfo.getMem_bir().split("-")[1] + "-" +memberInfo.getMem_bir().split("-")[2].substring(0,2) %>);
		
		$('form').submit(function(){
			$('input[name=mem_bir]').attr('value',$('input[name=mem_bir1]').val() + '-' + $('input[name=mem_bir2]').val() + '-' + $('input[name=mem_bir3]').val());
			$('input[name=mem_hometel]').attr('value', $('select[name=mem_hometel1] option:selected').val() + '-' + $('input[name=mem_hometel2]').val() + '-' + $('input[name=mem_hometel3]').val());
			$('input[name=mem_hp]').attr('value', $('select[name=mem_hp1] option:selected').val() + '-' + $('input[name=mem_hp2]').val() + '-' + $('input[name=mem_hp3]').val());
			$('input[name=mem_mail]').attr('value',$('input[name=mem_mail1]').val() + '@' + $('select[name=mem_mail2] option:selected').val());
			$('input[name=mem_zip]').attr('value', $('input[name=mem_zip1]').val() + $('input[name=mem_zip2]').val());
			$('form[name=memberForm]').append($('<input type="hidden" name="mem_comtel" value="042-000-0000" />'));
			$('form[name=memberForm]').append($('<input type="hidden" name="mem_id" value="<%= memberInfo.getMem_id() %>" />'));
		});
	});
	function zipcodePopup(){
		event.preventDefault(); 
		// 브라우저 document 팝업 : 모달리스 - 활성화된 팝업의 포커스가 자유롭게 이동.
		//						모달 - 활성화된 팝업이 포커스를 점유하며, 해당 팝업이 종료시에만 포커스가 자유롭게 이동.
		var url = '<%= request.getContextPath() %>/06/zipcodeSearch.jsp';
		// location.href = '주소'; // 브라우저 히스토리(요청스택)에 해당 요청 주소가 저장(history back|forward)
		// location.replace('주소'); // 브라우저 히스토리(요청스택)에 해당 요청 주소를 저장하지 않음.
		var options = 'copyhistory=no,width=380px,height=400px,status=no,resizable=no,scrollbars=no';
		window.open(url, '우편번호검색', options);
	}
</script>
<body>
<form name="memberForm" action="<%= request.getContextPath() %>/06/updateMemberInfo.jsp" method="post">
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
			<input type="text" name="mem_name" value="<%=memberInfo.getMem_name()%>" disabled="disabled"/>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">주민등록번호</td>
		<td>
			<input type="text" name="mem_regno1" size="6" value="<%=memberInfo.getMem_regno1() %>" disabled="disabled"/>
  			<input type="text" name="mem_regno2" size="7" value="<%=memberInfo.getMem_regno2() %>" disabled="disabled"/>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">생년월일</td>
		<td>
				<input type="hidden" name="mem_bir" />
				<input type="text" name="mem_bir1" size="4" value="<%=memberInfo.getMem_bir().split("-")[0] %>" disabled="disabled"/>년
				<input type="text" name="mem_bir2" size="2" value="<%=memberInfo.getMem_bir().split("-")[1] %>" disabled="disabled"/>월
				<input type="text" name="mem_bir3" size="2" value="<%=memberInfo.getMem_bir().split("-")[2].substring(0,2) %>" disabled="disabled"/>일
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">아이디</td>
		<td>
			<input type="text" name="mem_id" value="<%=memberInfo.getMem_id() %>" disabled="disabled">
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">비밀번호</td>
		<td>
			<input type="text" name="mem_pass" value="<%=memberInfo.getMem_pass() %>" /> 8 ~ 20 자리 영문자 및 숫자 사용
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">비밀번호확인</td>
		<td>
			<input type="text" name="mem_pass_confirm" value="<%=memberInfo.getMem_pass() %>" /> 8 ~ 20 자리 영문자 및 숫자 사용
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
			<input type="text" name="mem_hometel2" size="4" value="<%=memberInfo.getMem_hometel().split("-")[1] %>" /> - 
			<input type="text" name="mem_hometel3" size="4" value="<%=memberInfo.getMem_hometel().split("-")[2] %>" />
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
			<input type="text" name="mem_hp2" size="4" value="<%=memberInfo.getMem_hp().split("-")[1]%>" /> - 
			<input type="text" name="mem_hp3" size="4" value="<%=memberInfo.getMem_hp().split("-")[2]%>" />
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">이메일</td>
		<td>
			<input type="hidden" name="mem_mail" />
			<input type="text" name="mem_mail1" value="<%= memberInfo.getMem_mail().split("@")[0] %>" /> @
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
			<input type="text" name="mem_zip1" id="mem_zip1" size="3" value="<%= memberInfo.getMem_zip().split("-")[0] %>" /> - 
			<input type="text" name="mem_zip2" id="mem_zip2" size="3" value="<%= memberInfo.getMem_zip().split("-")[1] %>" />
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" onclick="zipcodePopup();">우편번호검색</button><br>
			<input type="text" name="mem_add1" id="mem_add1" value="<%= memberInfo.getMem_add1() %>" />
			<input type="text" name="mem_add2" id="mem_add2" value="<%= memberInfo.getMem_add2() %>" />
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">직 업</td>
		<td>
			<input type="text" name="mem_job" value="<%= memberInfo.getMem_job() %>"/>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">취 미</td>
		<td>
			<input type="text" name="mem_like" value="<%= memberInfo.getMem_like() %>"/>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr><td colspan="2" height="20"></td></tr>
	
	<tr>
		<td class="btnGroup" colspan="2" >
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn1" type="submit">수정하기</button>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn2" type="reset">취소</button>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn3" type="button">삭제</button>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn4" type="button">목록</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>








