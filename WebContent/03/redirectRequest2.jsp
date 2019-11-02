<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>pageContext 영역</h3>
	<%
		MemberVO pageMemberInfo= (MemberVO)pageContext.getAttribute("pageMemberInfo");
		if(pageMemberInfo != null){
	%>
	아이디 : <%= pageMemberInfo.getMem_id() %> <br>
	패스워드 : <%= pageMemberInfo.getMem_pass() %><br>
	성명 : <%= pageMemberInfo.getMem_name() %><br>
	<% } %>
	<hr>
	
	<h3>request 영역</h3> <!-- redirect되었기 때문에, request가 새로 만들어져 nullPointException이 발생. -->
	<%
		MemberVO reqMeberInfo = (MemberVO)request.getAttribute("reqMemberInfo");
		if(reqMeberInfo != null){
	%>
	아이디 : <%= reqMeberInfo.getMem_id() %> <br>
	패스워드 : <%= reqMeberInfo.getMem_pass() %><br>
	성명 : <%= reqMeberInfo.getMem_name() %><br>
	<% } %>
	<hr>
	<h3>session 영역</h3>
	아이디 : <%= ((MemberVO)session.getAttribute("sesMemberInfo")).getMem_id() %> <br>
	패스워드 : <%= ((MemberVO)session.getAttribute("sesMemberInfo")).getMem_pass() %><br>
	성명 : <%= ((MemberVO)session.getAttribute("sesMemberInfo")).getMem_name() %><br>
	<hr>
	<h3>application 영역</h3>
	아이디 : <%= ((MemberVO)application.getAttribute("appMemberInfo")).getMem_id() %> <br>
	패스워드 : <%= ((MemberVO)application.getAttribute("appMemberInfo")).getMem_pass() %><br>
	성명 : <%= ((MemberVO)application.getAttribute("appMemberInfo")).getMem_name() %><br>
	<hr>

</body>
</html>