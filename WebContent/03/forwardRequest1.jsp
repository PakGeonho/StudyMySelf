<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.member.service.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Map<String, String> params = new HashMap<String, String>();
	params.put("mem_id","a001");
	
	IMemberService service = IMemberServiceImpl.getInstance();
	MemberVO memberInfo = service.memberInfo(params);
	
	// 기본 객체 : 9개
	//	저장영역(Scope) : pageContext, request, session, application => 모두 pageContext객체로부터 얻어온다.
	//			값 저장 : .setAttribute(키, 값); 값 => Object(업캐스팅)
	//			   취득 : .getAttribute(키); (다운캐스팅)값 -> 다운캐스팅이므로 필수로 요구된다.
	//			   갱신 : .removeAttribute(키);
	//			   갱신 : .setAttribute(동일키, 다른값);
	pageContext.setAttribute("pageMemberInfo", memberInfo);
	request.setAttribute("reqMemberInfo", memberInfo); //=>forwarding 할 때마다 재활용됨.
	session.setAttribute("sesMemberInfo", memberInfo);
	application.setAttribute("appMemberInfo", memberInfo);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>pageContext 영역</h3>
	아이디 : <%= ((MemberVO)pageContext.getAttribute("pageMemberInfo")).getMem_id() %> <br>
	패스워드 : <%= ((MemberVO)pageContext.getAttribute("pageMemberInfo")).getMem_pass() %><br>
	성명 : <%= ((MemberVO)pageContext.getAttribute("pageMemberInfo")).getMem_name() %><br>
	<hr>
	<h3>request 영역</h3>
	아이디 : <%= ((MemberVO)request.getAttribute("reqMemberInfo")).getMem_id() %> <br>
	패스워드 : <%= ((MemberVO)request.getAttribute("reqMemberInfo")).getMem_pass() %><br>
	성명 : <%= ((MemberVO)request.getAttribute("reqMemberInfo")).getMem_name() %><br>
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
	
	
	<%
		// 포워딩 처리 주소 : 컨텍스트 루트|패스가 배제된 서블릿 패스만 설정.
		RequestDispatcher dispatcher = request.getRequestDispatcher("/03/forwardRequest2.jsp");
		dispatcher.forward(request, response);
	%>
	
</body>
</html>