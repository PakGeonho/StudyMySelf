<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");// 전송 방식이 get이었으면 server.xml의 URIEncoding이 자동으로 UTF-8로 인코딩을 해주지만, POST방식은 그렇게 해주지 못한다..
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	아이디 : <%= request.getParameter("mem_id") %> <br>
	성명 : <%= request.getParameter("mem_name") %> <br>
	<%-- 학위 : <%= request.getParameter("querystring_grp")  %> --%>
			<!-- ↑넘겨받은 값 중 하나만 받는다. 이전의 checkBox는 복수갯수인데... => 하물며, 요청 본문에선 다 잘 나온다. -->
	<!-- 복수개의 학위 값을 얻기위해 스크립트릿을 하나 연다. -->
	<h3> 1) request.getParameterMap() : 클라이언트로부터 전송된 쿼리스트링을 Map 타입으로 변환</h3>
	<%
		Map<String, String[]> paramMap = request.getParameterMap();
		Iterator<String> keys = paramMap.keySet().iterator();
		while(keys.hasNext()){
			String key = keys.next();
			String[] values = paramMap.get(key);
			for(String value : values){
	%>
			Map : <%= key %> - <%= value %><br/>
	<%
			}
		}
	%>
	<h3> 2) request.getParameterValues(키) : 클라이언트로부터 전송된 단일키의 다중값 쿼리스트링을 키를 활용해서 취득</h3>
	<%
		String[] values = request.getParameterValues("querystring_grp");
		for(String value : values){
	%>
			string[] : <%=value %><br/>
	<%
		}
	%>
	
	<h3> 3) request.getParameterNames() : 클라이언트로부터 전송되는 쿼리스트링의 키를 취득.</h3>
	<%
		Enumeration<String> names = request.getParameterNames();
		while(names.hasMoreElements()){
			String  key = names.nextElement();
	%>
			string : <%= key %><br/> <!-- key값만 출력된다. -->
	<%
		}
	%>
</body>
</html>