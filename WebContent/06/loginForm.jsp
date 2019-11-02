<%@page import="kr.or.ddit.utiles.CrytoGenerator"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("UTF-8");
	String message = request.getParameter("message");
	
	//공개키 취득
	Map<String, String> publicKeyMap = CrytoGenerator.generatePairKey(session);
%>
<html>
<head>
<!-- 
	자바스크립트 RSA 암호화 환경
	1. js라이브러리
		http://www-cs-students.stanford.edu/~tjw/jsbn
		jsbn.js, prng4.js, rng.js, rsa.js 다운로드.
	2. js 폴더에 import
	3. js 라이브러리 선언 순서
		jsbn -> rsa -> prng4 -> rng
 -->
<!-- 
	클라이언트단 SHA256 | 512 해시 암호화 알고리즘을 적용한 암호화 환경
		요구 환경 : 
			1. js라이브러리
				1.1 http://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9/core.js
				1.2 http://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9/sha256.js -> 선언 순서도 중요하다. cores먼저 선언해줘야함.
 -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin.css" type="text/css">
<title>회원관리 관리자 로그인</title>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9/core.js"></script>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9/sha256.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src='<%=request.getContextPath() %>/js/validation.js'></script>
<script type="text/javascript" src='<%=request.getContextPath() %>/js/cookieControl.js'></script>
<script type="text/javascript" src='<%=request.getContextPath() %>/js/jsbn.js' ></script>
<script type="text/javascript" src='<%=request.getContextPath() %>/js/rsa.js' ></script>
<script type="text/javascript" src='<%=request.getContextPath() %>/js/prng4.js' ></script>
<script type="text/javascript" src='<%=request.getContextPath() %>/js/rng.js' ></script>
<script type="text/javascript">
	$(function(){
		if('<%=message%>' != "null"){
			alert('<%=message%>');
		} 
		if(Get_Cookie("mem_id")){
			$('input[name=mem_id]').attr('value', Get_Cookie("mem_id"));
			$('#saveID').prop('checked', true);
		}
		$('.loginBtn').click(function(){
			 
			if($('#saveID').prop('checked')){
				Set_Cookie( 'mem_id', $('input[name=mem_id]').val(),1,'/','192.168.207.134');
			}else{
				Delete_Cookie('mem_id', '/', '192.168.207.134');
			}
			// 해시 암호화 기법(단방향성 FingerPrinter -> 암호화만 하고 복호화는 안함.)을 활용한 해싱(암호화 기법).
			//	- 해싱된 암호문은 서버 단에서 평문으로 복호화 하지 않고 활용.
			//	- 적용된 해시 암호화 알고리즘이 해커에 의해서 뚫리면, 모든 데이터가 평문으로 변경되어 노출됨.
			//	- 사용을 기피 이유 : 단어사전입력 공격(무차별 글자 조합을 적용하여 입력하는 공격)에 약함.
			//					대응 방법 - salt(소금치기) : salt + 해시 암호화 기법.
			// 해시 암호화 알고리즘 : SHA256(256bit = 32byte) or SHA512(512bit = 64byte) -> 32byte or 64byte Hexa 표현(암호화 결과값)
			var mem_id = $('input[name=mem_id]').val();//평문 id 취득.
			var encrypt_id = CryptoJS.SHA256(mem_id).toString();//평문 id를 해시 암호화.
			var mem_pass = $('input[name=mem_pass]').val();
			var encrypt_pass = CryptoJS.SHA256(mem_pass).toString();
			
			// javascript, jQuery 내 jsp의 익스프레션 선언 시 반드시 '' 또는 "" 내 선언(문자열)
			var modulus = '<%=publicKeyMap.get("publicModulus")%>'; //지수부
			var exponent = '<%= publicKeyMap.get("publicExponent")%>' //가수부
			var rsaOBJ = new RSAKey();
			rsaOBJ.setPublic(modulus, exponent);//공개키를 세팅하는 문장.
			var encryt_id = rsaOBJ.encrypt(mem_id);//평문을 매개변수로 넘겨주면 암호문을 리턴해줌.
			var encryt_pass = rsaOBJ.encrypt(mem_pass);
			
			var $frm = $('<form action="<%=request.getContextPath()%>/06/loginCheck.jsp" method="POST"></form>');
			//$frm.append('<input type="hidden" name="mem_id" value="' + $('input[name=mem_id]').val() + '"/>');
			$frm.append('<input type="hidden" name="mem_id" value="' + encryt_id + '"/>');
			//$frm.append('<input type="hidden" name="mem_pass" value="' + $('input[name=mem_pass]').val()+'"/>');
			$frm.append('<input type="hidden" name="mem_pass" value="' + encryt_pass +'"/>');
			
			$(document.body).append($frm);
			$frm.submit(); // 서브밋 시작됨.
			
		});
	})
</script>

</head>
<body>
	<table width="770" border="0" align="center" cellpadding="0"
		cellspacing="0" style="margin: 90px;">
		<tr>
			<td height="150" align="center"><img src="${pageContext.request.contextPath }/image/p_login.gif" /></td>
		</tr>
		<tr>
			<td height="174"
				style="background: url(${pageContext.request.contextPath }/image/login_bg.jpg); border: 1px solid #e3e3e3;">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td width="260" height="110" align="center"
							style="border-right: 1px dotted #736357;">
							<img src="${pageContext.request.contextPath }/image/logo.jpg" />
						</td>
						<td>
							<table border="0" align="center" cellpadding="5"
								cellspacing="0">
								<tr>
									<td><b>아이디</b></td>
									<td><input type="text" name="mem_id" class="box" tabindex="3" height="18" /></td>
									<td rowspan="2">
										<img src="${pageContext.request.contextPath }/image/login.gif" class="loginBtn"/>
									</td>
								</tr>
								<tr>
									<td><b>패스워드</b></td>
									<td><input type="password" name="mem_pass" class="box" tabindex="3" height="18" /></td>
								</tr>
								<tr>
									<td colspan="3" align="right">
										아이디저장<input type="checkbox" id="saveID" />
										<a href="<%=request.getContextPath()%>/06/main.jsp?contentPage=/06/memberForm.jsp">회원가입을 원하세요??</a>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>
