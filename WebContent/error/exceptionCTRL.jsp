<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	클라이언트는 서버로부터 발생된 에러의 정보를 취득(상태코드:500).
	에러 코드 취득 시 응답컨텐츠의 사이즈가 513byte 미만일 때는 클라이언트는 응답컨텐츠를 랜더링 출력하지 않음.
 -->
	익셉션 : <%=exception.getClass().getName() %><br>
	메세지 : <%=exception.getMessage() %><br>
</body>
</html>