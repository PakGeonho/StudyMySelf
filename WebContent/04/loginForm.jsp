<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String message = request.getParameter("message");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	if('<%=message%>' != 'null'){
		alert('<%=message%>');
	}
</script>
</head>
<body>
	<form action="<%=request.getContextPath()%>/04/loginCheck.jsp" >
		<table>
		
			<tr>
				<td>아이디</td>
				<td><input  name='mem_id' type="text" /></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input name='mem_pass' type="text" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value='로그인'/>
				<a href='/ddit/04/memberForm.jsp'>회원가입을 해주세요</a></td>
			</tr>
		</table>
	</form>
</body>
</html>