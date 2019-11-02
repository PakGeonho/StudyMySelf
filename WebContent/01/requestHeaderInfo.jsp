<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		$('p').click(function(){
			$(this).css('background' , 'red');
		});
	})
</script>
</head>
<body>
<p>랄랄라</p>
클라이언트 IP Addr = <%= request.getRemoteAddr() %><br>
클라이언트 요청시 전송하는 쿼리 스트링 사이즈 : <%= request.getContentLength() %><br>
클라이언트 요청시 프로토콜 : <%=request.getProtocol() %><br>
요청시 URL : <%= request.getRequestURL() %><br>
요청시 URI : <%= request.getRequestURI() %><br>
요청시 컨텍스트 루트|패스 : <%= request.getContextPath() %> <br>
서블릿 패스 : <%= request.getServletPath() %><br>
요청시 쿼리스트링 전송 방식 : <%= request.getMethod() %> <br>
헤더(Accept-Language) : <%= request.getHeader("Accept-Language") %><br>
<%
	String userAgent = request.getHeader("User-Agent");
%>
당신의 브라우저는 <%= userAgent %> 입니다 <br>
</body>
</html>