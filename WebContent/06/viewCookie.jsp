<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//클라이언트(브라우저)의 쿠키 저장소에 저장된 쿠키 중에서 클라이언트의 서버 대상 요청시 주소 내 도메인 또는 경로가 쿠키 설정(도메인, 경로) 내용과 일치하면,
	//해당 쿠키들은 서버로 전송.
	Cookie[] cookies = request.getCookies();
	for(Cookie currentCookie : cookies){
		out.println("key = " + currentCookie.getName() + " | value = " + URLDecoder.decode(currentCookie.getValue(), "UTF-8") +"<br>");
	}
%>
</body>
</html>