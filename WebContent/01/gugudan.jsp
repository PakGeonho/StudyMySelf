<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!
//디클러레이션
	public int multiple(int i, int j){
		return i * j;
	}
%>
<%
	String value = "스크립트릿 : 자바 코드 영역";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	for(int i = 2 ; i < 10 ; i++){
%>
	<%= i%>단 <br/> <!-- 익스프레션 : 스크립트릿, 디클러레이션의 값, 메서드를 가지고 활용하는 영역. -->
<%		
		for(int j = 1 ; j < 10 ; j++){
%>
	<%= i %> * <%= j %> = <%=multiple(i,j) %> <br/>
<%
		} %><br>
<%
	}
%>
</body>
</html>